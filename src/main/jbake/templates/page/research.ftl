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
        <h1 class="page-title">The Laboratory</h1>
        <p>Our goal is to drive ODA conformance and telecom innovation through developer-first empirical research.</p>

        <div class="news-list" style="margin-top: 4rem;">
            <#include "/macro/news.ftl">
            <#assign projects_count = 0>
            <#list all_content as project>
                <#if project.type?? && project.type == "project" && project.status == "published">
                    <#assign projects_count = projects_count + 1>
                    <@renderNewsEntry
                        title=project.title
                        uri=project.uri
                        description=(project.description!"")
                        meta_left=(project.field!"RESEARCH")
                        meta_mid=(project.format!"STUDY")
                        meta_right=(project.lifecycle!"ACTIVE")
                        cta_label="Participate" />
                </#if>
            </#list>

            <#if projects_count == 0>
                <p style="opacity: 0.5;">No active research tracks at this time. Check back later.</p>
            </#if>
        </div>

    </article>
</div>
<#include "/partial/menu/menu.ftl">
</body>
</html>
