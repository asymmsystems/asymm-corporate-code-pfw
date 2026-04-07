<!DOCTYPE html>
<html lang="en">
<head>
<#include "header.ftl">
</head>
<body>
<#include "menu.ftl">

<div class="container" style="padding-top: 6rem; padding-bottom: 8rem; min-height: 70vh;">
    <h1 class="page-title">System Logs</h1>
    <hr style="border:none; border-bottom:1px solid var(--border-subtle); margin-bottom: 3rem;">
    
    <#list published_posts as post>
    <div class="news-item">
        <a href="${post.uri}" class="news-link">${post.title}</a>
        <span class="news-date">${post.date?string("dd MMMM yyyy")}</span>
    </div>
    </#list>
</div>

<#include "footer.ftl">
</body>
</html>
