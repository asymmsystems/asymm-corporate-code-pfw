<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
<#-- Surveys are hosted neutrally: noindex, no product chrome, direct-link only. -->
<meta name="robots" content="noindex, nofollow">
</head>
<body>
<#-- No global nav, menu, or footer: this template carries the research identity
     only (in the page copy), never the product brand. See ADR-00001 / survey hosting. -->
<div class="container">
    <article class="page-body" style="padding-top: 3rem; padding-bottom: 6rem;">
        ${content.body}
    </article>
</div>
</body>
</html>
