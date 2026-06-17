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
    /* .form-control sets appearance: none, which strips the native select arrow.
       Restore a chevron so dropdowns read as dropdowns. */
    .page-body--survey select.form-control {
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 10 6'%3E%3Cpath d='M1 1l4 4 4-4' fill='none' stroke='%23888' stroke-width='1.5'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 1rem center;
        background-size: 0.7rem;
        padding-right: 2.5rem;
    }
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