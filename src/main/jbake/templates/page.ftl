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

<#assign hasToc = (content.toc!'false')?string == 'true'>

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <#if hasToc>
    <div class="page-with-toc">
        <article class="page-body" id="page-body">
            ${content.body}
        </article>
        <aside class="page-toc" id="page-toc" aria-label="Table of contents">
            <span class="toc-label">On this page</span>
            <ul id="page-toc-list"></ul>
        </aside>
    </div>
    <#else>
    <article class="page-body">
        ${content.body}
    </article>
    </#if>
</div>

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

<#include "/menu/menu.ftl">
</body>
</html>
