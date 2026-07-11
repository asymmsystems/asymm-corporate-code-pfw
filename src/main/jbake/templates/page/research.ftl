<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
</head>
<body>
<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "/partial/brand/asymm-brand.ftl"></div>
    </nav>
</div>

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <article class="page-body">
        <h1 class="page-title">Research</h1>
        <p>Our goal is to drive ODA conformance and telecom innovation through developer-first empirical research.</p>

        <div class="news-list" style="margin-top: 4rem;">
            <#include "/macro/news.ftl">
            <#assign projects_count = 0>
            <#list all_content as item>
                <#if item.uri?? && item.uri?contains("research/") && item.status == "published" && (item.type!"") != "survey">
                    <#assign projects_count = projects_count + 1>
                    <@renderNewsEntry
                        title=item.title
                        uri=item.uri
                        description=(item.description!"")
                        meta_left=(item.field!"RESEARCH")
                        meta_mid=(item.format!"ANALYSIS")
                        meta_right=(item.lifecycle!"")
                        cta_label=(item.cta!"Read &rarr;") />
                </#if>
            </#list>

            <#if projects_count == 0>
                <p style="opacity: 0.5;">No research published yet. Check back later.</p>
            </#if>
        </div>

    </article>
</div>
<#include "/partial/menu/menu.ftl">
</body>
</html>
