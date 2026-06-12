// Check Your Backup — website interactions (vanilla JS, no dependencies)

(function () {
  "use strict";

  // Menu dropdown (text "Menu", no hamburger)
  var menuTrigger = document.getElementById("navMenuTrigger");
  var menuPanel = document.getElementById("navMenuPanel");
  var menuDropdown = menuTrigger && menuTrigger.closest(".nav-menu-dropdown");

  function closeMenu() {
    if (!menuDropdown || !menuTrigger || !menuPanel) return;
    menuDropdown.classList.remove("is-open");
    menuTrigger.setAttribute("aria-expanded", "false");
    menuPanel.hidden = true;
  }

  function openMenu() {
    if (!menuDropdown || !menuTrigger || !menuPanel) return;
    menuDropdown.classList.add("is-open");
    menuTrigger.setAttribute("aria-expanded", "true");
    menuPanel.hidden = false;
  }

  function toggleMenu() {
    if (!menuDropdown) return;
    if (menuDropdown.classList.contains("is-open")) closeMenu();
    else openMenu();
  }

  if (menuTrigger && menuPanel && menuDropdown) {
    menuTrigger.addEventListener("click", function (event) {
      event.stopPropagation();
      toggleMenu();
    });

    menuPanel.addEventListener("click", function (event) {
      if (event.target.tagName === "A") closeMenu();
    });

    document.addEventListener("click", function (event) {
      if (!menuDropdown.contains(event.target)) closeMenu();
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape") closeMenu();
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
        "Free - Portable - Runs locally. Version " +
        data.version +
        " - Released " +
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
        ? [size, "v" + data.version].filter(Boolean).join(" - ")
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
