<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
</head>
<body>
<#include "/macro/breadcrumb.ftl">
<#include "/partial/menu/menu-data.ftl">

<#assign hasToc = (content.toc!'false')?string == 'true'>

<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "/partial/brand/asymm-brand.ftl"></div>
    </nav>
    <@renderBreadcrumbForUri uri=(content.uri!"") leaf=(content.breadcrumb_leaf!"") />
</div>

<#-- body_template lets a content file declare an FTL body file (under
     templates/content/) that uses macros; falls back to ${content.body}
     for plain HTML/markdown content. See ADR-00001 §"Implementation Notes". -->
<#macro pageBody>
    <#if content.body_template??>
        <#include "${content.body_template}">
    <#else>
        ${content.body}
    </#if>
</#macro>

<#-- Article sits inside .container so its contents (header, p, lists,
     tables) align with the brand/breadcrumb above. Alt-bg is scoped to
     .home-body / .microsite-body, so .page-body has no need for
     full-bleed sections. The TOC, when present, is a fixed sidebar. -->
<div class="container">
    <article class="page-body page-body--breadcrumb<#if hasToc> page-body--toc</#if>" id="page-body">
        <@pageBody/>
    </article>
</div>
<#if hasToc>
<aside class="page-toc" id="page-toc" aria-label="Table of contents">
    <span class="toc-label">On this page</span>
    <ul id="page-toc-list"></ul>
</aside>
</#if>

<#if hasToc>
<script>
(function () {
    const slug = (s) => s.toLowerCase().trim()
        .replace(/[^a-z0-9\s-]/g, '')
        .replace(/\s+/g, '-')
        .replace(/-+/g, '-');

    const article = document.getElementById('page-body');
    const list = document.getElementById('page-toc-list');
    const tocAside = document.getElementById('page-toc');
    if (!article || !list || !tocAside) return;

    const headings = article.querySelectorAll('h2, h3');
    if (headings.length < 3) {
        tocAside.style.display = 'none';
        return;
    }

    const links = [];
    headings.forEach((h) => {
        if (!h.id) h.id = slug(h.textContent);
        const li = document.createElement('li');
        li.className = h.tagName === 'H3' ? 'toc-h3' : 'toc-h2';
        const a = document.createElement('a');
        a.href = '#' + h.id;
        a.textContent = h.textContent;
        a.addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById(h.id).scrollIntoView({ behavior: 'smooth', block: 'start' });
            history.replaceState(null, '', '#' + h.id);
        });
        li.appendChild(a);
        list.appendChild(li);
        links.push({ id: h.id, link: a, el: h });
    });

    // Scroll-spy — active heading is the last one above the top-third of the viewport
    let ticking = false;
    const update = () => {
        const threshold = window.innerHeight / 3;
        let active = links[0];
        for (const item of links) {
            if (item.el.getBoundingClientRect().top <= threshold) active = item;
            else break;
        }
        links.forEach(i => i.link.classList.toggle('toc-active', i === active));
        ticking = false;
    };
    window.addEventListener('scroll', () => {
        if (!ticking) { requestAnimationFrame(update); ticking = true; }
    }, { passive: true });
    update();
})();
</script>
</#if>

<#include "/partial/menu/menu.ftl">
</body>
</html>
