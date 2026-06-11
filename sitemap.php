<?php
/**
 * Serves sitemap.xml for crawlers and footer links.
 * Edit sitemap.xml when adding pages; this file does not need changes.
 */
header('Content-Type: application/xml; charset=UTF-8');
readfile(__DIR__ . '/sitemap.xml');
