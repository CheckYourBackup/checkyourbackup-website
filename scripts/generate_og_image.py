#!/usr/bin/env python3
"""Generate assets/img/og-image.png for Open Graph / social link previews."""

from __future__ import annotations

import sys
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "assets" / "img" / "og-image.png"
OG_SIZE = (1200, 630)

# Prefer marketing hero; fallback to app results screenshot
SOURCES = {
    "hero": ROOT / "instagram" / "captures" / "feed-1080x1350" / "hero.png",
    "app-results": ROOT / "instagram" / "captures" / "app" / "screenshot-results.png",
}


def crop_to_og(im: Image.Image) -> Image.Image:
    """Center-crop or top-crop to 1200x630 aspect ratio, then resize."""
    target_w, target_h = OG_SIZE
    target_ratio = target_w / target_h
    w, h = im.size
    src_ratio = w / h

    if src_ratio > target_ratio:
        # Wider than target — crop width
        new_w = int(h * target_ratio)
        left = (w - new_w) // 2
        box = (left, 0, left + new_w, h)
    else:
        # Taller than target — crop from top (headline visible)
        new_h = int(w / target_ratio)
        box = (0, 0, w, min(new_h, h))

    cropped = im.crop(box)
    return cropped.resize(OG_SIZE, Image.Resampling.LANCZOS)


def main() -> int:
    for name, path in SOURCES.items():
        if not path.exists():
            print(f"Skip {name}: missing {path.relative_to(ROOT)}")
            continue
        im = Image.open(path).convert("RGB")
        out = crop_to_og(im)
        OUT.parent.mkdir(parents=True, exist_ok=True)
        out.save(OUT, format="PNG", optimize=True)
        print(f"Created {OUT.relative_to(ROOT)} from {path.relative_to(ROOT)} ({OG_SIZE[0]}x{OG_SIZE[1]})")
        return 0

    print("No source image found. Need hero.png or screenshot-results.png.", file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
