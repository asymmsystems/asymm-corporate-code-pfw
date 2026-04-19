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
    <span class="news-date">${content.date?string("dd MMMM yyyy")}</span>
    <h1 class="page-title" style="margin-top: 0.5rem;">${content.title}</h1>
    <hr style="border:none; border-bottom:1px solid var(--border-subtle); margin-bottom: 3rem;">
    
    <div style="color:var(--text-secondary); font-size:1.15rem; line-height:1.7;">
        ${content.body}
    </div>
</div>

<#include "footer.ftl">
<#include "menu.ftl">
</body>
</html>
