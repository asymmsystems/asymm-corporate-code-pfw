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
        <h1 class="page-title">The Registry</h1>
        <p>Formal record of project milestones, technical briefs, and ecosystem changes.</p>
        
        <div class="news-list">
            <#assign posts_to_list = []>
            <#if published_posts??>
                <#assign posts_to_list = published_posts>
            <#elseif posts??>
                <#assign posts_to_list = posts>
            </#if>

            <#if (posts_to_list?size > 0)>
                <#include "/macro/news.ftl">
                <#list posts_to_list as post>
                    <@renderNewsEntry
                        title=post.title
                        uri=post.uri
                        description=(post.description!"")
                        meta_left=(post.kicker!"Announcement")
                        meta_right=post.date?string("dd MMMM yyyy")
                        cta_label="…more" />
                </#list>
            <#else>
                <p style="opacity: 0.5;">No announcements yet. Check back soon for updates.</p>
            </#if>
        </div>
    </article>
</div>

<#include "/partial/menu/menu.ftl">
</body>
</html>
