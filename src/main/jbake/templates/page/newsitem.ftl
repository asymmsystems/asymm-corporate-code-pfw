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
        <div class="news-post-header">
            <h1>${content.title}</h1>
            <div class="news-post-meta">
                ${content.kicker!"Official Announcement"} <span style="margin: 0 0.6rem; opacity: 0.5;">|</span> ${content.date?string("dd MMMM yyyy")}
            </div>
        </div>

        <div class="asymm-body">
            <div class="news-content">
                ${content.body}
            </div>
            
            <hr class="section-divider" style="margin: 4rem 0;">
            <p><a href="/registry.html" class="org-link org-link--inline org-link--internal org-link--back">Back to Registry</a></p>
        </div>
    </article>
</div>

<#include "/partial/menu/menu.ftl">
</body>
</html>
