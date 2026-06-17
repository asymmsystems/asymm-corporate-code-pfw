<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
<#-- Surveys are hosted neutrally: noindex, no product chrome, direct-link only. -->
<meta name="robots" content="noindex, nofollow">
<style>
    /* Survey layout, scoped to this template only.
       .page-body has no max-width and .container is the 1440px frame, so without
       this the form fills the page; and .checkbox-group is flex-row globally, so
       options would sit on one line. Constrain to a readable column and stack the
       checkbox options vertically. */
    .page-body--survey { max-width: 720px; margin-left: auto; margin-right: auto; }
    .page-body--survey .checkbox-group { flex-direction: column; gap: 0.5rem; }
    .page-body--survey .survey-grid { display: block; overflow-x: auto; }
    .page-body--survey .survey-section { margin-bottom: 1rem; }
</style>
</head>
<body>
<#-- No global nav, menu, or footer: this template carries the research identity
     only (in the page copy), never the product brand. See ADR-00001 / survey hosting. -->
<div class="container">
    <article class="page-body page-body--survey" style="padding-top: 3rem; padding-bottom: 6rem;">
        ${content.body}
    </article>
</div>
</body>
</html>
