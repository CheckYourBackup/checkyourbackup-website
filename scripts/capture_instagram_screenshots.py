#!/usr/bin/env python3
"""Capture website sections as Instagram-ready screenshots."""

from __future__ import annotations

import sys
from pathlib import Path

from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "instagram" / "captures"
BASE_URL = "http://localhost:5173"

SECTIONS = [
    ("hero", "#top", "Landing hero"),
    ("features", "#features", "Features grid"),
    ("readonly", "#readonly", "Read-only promise"),
    ("how-it-works", "#how", "How it works"),
    ("screenshots", "#screenshots", "App screenshots"),
    ("status", "#status", "Status legend"),
    ("download", "#download", "Download CTA"),
]

VIEWPORTS = {
    "feed-1080x1350": {"width": 1080, "height": 1350},
    "story-1080x1920": {"width": 1080, "height": 1920},
    "square-1080x1080": {"width": 1080, "height": 1080},
}


def capture() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    created: list[Path] = []

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        for folder, viewport in VIEWPORTS.items():
            target_dir = OUT / folder
            target_dir.mkdir(parents=True, exist_ok=True)

            context = browser.new_context(
                viewport=viewport,
                device_scale_factor=2,
                color_scheme="light",
            )
            page = context.new_page()

            for slug, anchor, _label in SECTIONS:
                # Story format: focus on hero, screenshots, download
                if folder == "story-1080x1920" and slug not in {
                    "hero",
                    "screenshots",
                    "download",
                }:
                    continue
                # Square: hero, features, download carousel set
                if folder == "square-1080x1080" and slug not in {
                    "hero",
                    "features",
                    "screenshots",
                    "download",
                }:
                    continue

                page.goto(f"{BASE_URL}/{anchor}", wait_until="networkidle")
                page.wait_for_timeout(600)

                outfile = target_dir / f"{slug}.png"
                page.screenshot(path=str(outfile), type="png")
                created.append(outfile)
                print(f"  {outfile.relative_to(ROOT)}")

            context.close()

        browser.close()

    print(f"\nDone — {len(created)} files in {OUT.relative_to(ROOT)}/")
    return 0


if __name__ == "__main__":
    sys.exit(capture())
