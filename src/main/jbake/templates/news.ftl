<!DOCTYPE html>
<html lang="en">
<head>
<#include "/header.ftl">
</head>
<body>
<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "/brand/asymm-brand.ftl"></div>
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
                <#list posts_to_list as post>
                <div class="news-entry">
                    <div class="news-entry-meta" style="font-family: var(--font-body); font-size: 0.65rem; color: var(--color-rose); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 0.5rem;">
                        ${post.kicker!"Announcement"} <span style="margin: 0 0.5rem; opacity: 0.5;">|</span> ${post.date?string("dd MMMM yyyy")}
                    </div>
                    <h2 class="news-entry-title"><a href="${post.uri}" class="org-link org-link--internal">${post.title}</a></h2>
                    <p class="news-entry-summary">${post.description!""} <a href="${post.uri}" class="org-link org-link--inline org-link--internal">...more</a></p>
                </div>
                </#list>
            <#else>
                <p style="opacity: 0.5;">No announcements yet. Check back soon for updates.</p>
            </#if>
        </div>
    </article>
</div>

<#include "/menu/menu.ftl">
</body>
</html>
