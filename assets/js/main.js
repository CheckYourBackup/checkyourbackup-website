// Check Your Backup — website interactions (vanilla JS, no dependencies)

(function () {
  "use strict";

  // Mobile nav toggle
  var toggle = document.getElementById("navToggle");
  var nav = document.getElementById("nav");

  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = nav.classList.toggle("open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
    });

    // Close the menu after clicking a link (mobile)
    nav.addEventListener("click", function (event) {
      if (event.target.tagName === "A") {
        nav.classList.remove("open");
        toggle.setAttribute("aria-expanded", "false");
      }
    });
  }

  // Current year in the footer
  var year = document.getElementById("year");
  if (year) {
    year.textContent = new Date().getFullYear();
  }

  // ---------- Downloads (driven by downloads/releases.js) ----------
  function formatBytes(bytes) {
    if (!bytes || bytes <= 0) return "";
    var mb = bytes / (1024 * 1024);
    if (mb >= 1024) return (mb / 1024).toFixed(2) + " GB";
    if (mb >= 10) return Math.round(mb) + " MB";
    return mb.toFixed(1) + " MB";
  }

  function formatDate(iso) {
    if (!iso) return "";
    var d = new Date(iso + "T00:00:00");
    if (isNaN(d.getTime())) return iso;
    return d.toLocaleDateString(undefined, {
      year: "numeric",
      month: "long",
      day: "numeric"
    });
  }

  function renderDownloads() {
    var data = window.CYB_RELEASES;
    var container = document.getElementById("downloadCards");
    if (!data || !container) return;

    // Release meta line + footer version
    var meta = document.getElementById("releaseMeta");
    if (meta) {
      meta.textContent =
        "Free · Portable · Runs locally. Version " +
        data.version +
        " · Released " +
        formatDate(data.releaseDate);
    }
    var footerVersion = document.getElementById("footerVersion");
    if (footerVersion) footerVersion.textContent = data.version;

    container.innerHTML = "";

    (data.platforms || []).forEach(function (p) {
      var card = document.createElement("div");
      card.className = "dl-card" + (p.available ? "" : " dl-card-soon");

      var size = formatBytes(p.bytes);
      var specLine = p.available
        ? [size, "v" + data.version].filter(Boolean).join(" · ")
        : "Coming soon";

      var button;
      if (p.available) {
        button =
          '<a class="btn btn-primary dl-btn" href="' +
          p.file +
          '" download>Download</a>';
      } else {
        button =
          '<span class="btn btn-disabled dl-btn" aria-disabled="true">Coming soon</span>';
      }

      card.innerHTML =
        '<div class="dl-os">' +
        p.name +
        "</div>" +
        '<div class="dl-detail">' +
        p.detail +
        "</div>" +
        '<div class="dl-spec">' +
        specLine +
        "</div>" +
        button;

      container.appendChild(card);
    });
  }

  renderDownloads();
})();
