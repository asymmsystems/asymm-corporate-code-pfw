<!DOCTYPE html>
<html lang="en">
<head>
<#include "header.ftl">
</head>
<body>
<#include "menu.ftl">

<div class="container" style="padding-top: 6rem; padding-bottom: 8rem; min-height: 70vh;">
    <span class="news-date">System Event: ${content.date?string("dd MMMM yyyy")}</span>
    <h1 class="page-title" style="margin-top: 0.5rem;">${content.title}</h1>
    <hr style="border:none; border-bottom:1px solid var(--border-subtle); margin-bottom: 3rem;">
    
    <div style="color:var(--text-secondary); font-size:1.15rem; line-height:1.7;">
        ${content.body}
    </div>
</div>

<#include "footer.ftl">
</body>
</html>
