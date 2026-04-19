<!DOCTYPE html>
<html lang="en">
<head>
<#include "header.ftl">
</head>
<body>
<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "brand.ftl"></div>
    </nav>
</div>

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <h1 class="page-title">News</h1>
    <hr style="border:none; border-bottom:1px solid var(--border-subtle); margin-bottom: 3rem;">
    
    <#list published_posts as post>
    <div class="news-item">
        <a href="${post.uri}" class="news-link">${post.title}</a>
        <span class="news-date">${post.date?string("dd MMMM yyyy")}</span>
    </div>
    </#list>
</div>

<#include "footer.ftl">
<#include "menu.ftl">
</body>
</html>
