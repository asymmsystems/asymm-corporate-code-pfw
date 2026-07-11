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

<#-- Posts feeding the update feed. JBake exposes published_posts; fall back to posts. -->
<#assign posts_to_list = []>
<#if published_posts??>
    <#assign posts_to_list = published_posts>
<#elseif posts??>
    <#assign posts_to_list = posts>
</#if>

<#-- Each post carries a free-text `kicker`. Fold those into a small set of
     categories so the filter chips stay useful as the feed grows; an unmapped
     kicker simply becomes its own category. -->
<#assign catMap = {
    "Launch":              "Release",
    "Project Milestone":   "Release",
    "Technical Brief":     "Engineering",
    "Essay":               "Perspective",
    "Community Invitation":"Community"
}>
<#function categoryOf post>
    <#local k = (post.kicker)!"Update">
    <#return (catMap[k])!k>
</#function>
<#-- post.uri is JBake's relative "registry/foo.html"; link the canonical form. -->
<#function hrefOf post>
    <#local h = post.uri>
    <#if h?ends_with(".html")><#local h = h?remove_ending(".html")></#if>
    <#if !h?starts_with("/")><#local h = "/" + h></#if>
    <#return h>
</#function>

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <article class="page-body">

        <h1 class="page-title">Press &amp; Updates</h1>
        <p>Releases and milestones from Asymm Systems, and where Eliya and the company have been covered.</p>

        <#if (posts_to_list?size > 0)>
        <#assign featured = posts_to_list[0]>
        <#-- Whole card is the link, so the CTA is a span: org-link is class-driven
             and supplies the arrow, and nesting an <a> inside an <a> is invalid. -->
        <a class="pu-featured" href="${hrefOf(featured)}">
            <div class="pu-featured-meta">
                <span class="pu-tag">${categoryOf(featured)}</span>
                <span class="pu-featured-date">${featured.date?string("dd MMMM yyyy")}</span>
            </div>
            <h2>${featured.title}</h2>
            <p>${(featured.description)!""}</p>
            <span class="org-link org-link--inline org-link--internal">Read the briefing</span>
        </a>
        </#if>

        <section>
            <div class="section-intro">
                <span class="section-kicker">Update feed</span>
                <h2>Releases and milestones</h2>
            </div>

            <#-- Revealed by JS only, so the feed degrades to a plain table without it. -->
            <div class="pu-controls" hidden>
                <label class="pu-search-wrap">
                    <span class="pu-visually-hidden">Search updates</span>
                    <input type="search" class="pu-search" placeholder="Search updates&hellip;" autocomplete="off">
                </label>
                <div class="pu-chips" role="group" aria-label="Filter by category">
                    <button type="button" class="pu-chip is-active" data-cat="all">All</button>
                    <#assign cats = []>
                    <#list posts_to_list as post>
                        <#assign c = categoryOf(post)>
                        <#if !cats?seq_contains(c)><#assign cats = cats + [c]></#if>
                    </#list>
                    <#list cats as c>
                    <button type="button" class="pu-chip" data-cat="${c}">${c}</button>
                    </#list>
                </div>
            </div>

            <#if (posts_to_list?size > 0)>
            <div class="pu-table-wrap">
                <table class="pu-table">
                    <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Category</th>
                            <th scope="col">Headline</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#list posts_to_list as post>
                        <#assign c = categoryOf(post)>
                        <tr class="pu-row" data-cat="${c}"
                            data-search="${(post.title + ' ' + ((post.description)!''))?lower_case?html}">
                            <td class="pu-cell-date">${post.date?string("yyyy-MM-dd")}</td>
                            <td><span class="pu-tag pu-tag--${c?lower_case?replace(' ', '-')}">${c}</span></td>
                            <td class="pu-cell-headline">
                                <a href="${hrefOf(post)}" class="org-link org-link--inline org-link--internal">${post.title}</a>
                                <span class="pu-cell-desc">${(post.description)!""}</span>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
            <p class="pu-empty" hidden>No updates match that filter.</p>
            <#else>
            <p style="opacity: 0.5;">No announcements yet. Check back soon for updates.</p>
            </#if>
        </section>

        <section>
            <div class="section-intro">
                <span class="section-kicker">Media</span>
                <h2>In the press</h2>
                <p>Independent coverage and featured writing. For interviews or briefings, reach us at
                    <a href="mailto:ping@asymm.systems" class="org-link org-link--inline org-link--internal">ping@asymm.systems</a>.</p>
            </div>

            <div class="pu-press-grid">
                <a class="pu-press-card" href="https://www.infoq.com/news/2026/06/eliya-jvm-diagnostic-profile/"
                    target="_blank" rel="noopener">
                    <span class="pu-press-pub">InfoQ</span>
                    <span class="pu-press-title org-link org-link--external">Eliya 25 Brings a JVM-Level Diagnostic Profile to OpenJDK 25 LTS</span>
                    <span class="pu-press-note">Coverage of the Eliya 25.0.3 release and the
                        <code>-XX:EliyaProfile</code> policy point. June 2026.</span>
                </a>

                <a class="pu-press-card" href="https://www.infoq.com/news/2026/06/java-news-roundup-jun22-2026/"
                    target="_blank" rel="noopener">
                    <span class="pu-press-pub">InfoQ</span>
                    <span class="pu-press-title org-link org-link--external">Java News Roundup</span>
                    <span class="pu-press-note">Eliya featured alongside the wider Java ecosystem. June 2026.</span>
                </a>

                <a class="pu-press-card" href="https://www.jvm-weekly.com/p/where-production-policy-belongs-building"
                    target="_blank" rel="noopener">
                    <span class="pu-press-pub">JVM Weekly</span>
                    <span class="pu-press-title org-link org-link--external">Where Production Policy Belongs: Building Eliya in Public with Fahim Farook</span>
                    <span class="pu-press-note">Volume 183.</span>
                </a>

                <a class="pu-press-card" href="https://foojay.io/today/where-production-policy-belongs-building-eliya-in-public/"
                    target="_blank" rel="noopener">
                    <span class="pu-press-pub">Foojay</span>
                    <span class="pu-press-title org-link org-link--external">Where production policy belongs: building Eliya in public (part 1)</span>
                    <span class="pu-press-note">The thesis behind EliyaProfile, by founder Fahim Farook.</span>
                </a>

                <a class="pu-press-card" href="https://nljug.org/foojay/where-production-policy-belongs-building-eliya-in-public-part-1/"
                    target="_blank" rel="noopener">
                    <span class="pu-press-pub">NLJUG</span>
                    <span class="pu-press-title org-link org-link--external">Where production policy belongs: building Eliya in public (part 1)</span>
                    <span class="pu-press-note">Syndicated to the Nederlandse Java User Group.</span>
                </a>
            </div>
        </section>
    </article>
</div>

<script>
    // Update-feed filter: category chips + headline search. The controls stay
    // hidden until this runs, so a no-JS visitor sees the full table instead of
    // dead inputs.
    (function () {
        var controls = document.querySelector('.pu-controls');
        var rows = Array.prototype.slice.call(document.querySelectorAll('.pu-row'));
        if (!controls || !rows.length) return;
        controls.hidden = false;

        var search = controls.querySelector('.pu-search');
        var chips = Array.prototype.slice.call(controls.querySelectorAll('.pu-chip'));
        var empty = document.querySelector('.pu-empty');
        var activeCat = 'all';

        function apply() {
            var q = (search.value || '').trim().toLowerCase();
            var shown = 0;
            rows.forEach(function (row) {
                var okCat = activeCat === 'all' || row.getAttribute('data-cat') === activeCat;
                var okQ = !q || (row.getAttribute('data-search') || '').indexOf(q) !== -1;
                var show = okCat && okQ;
                row.hidden = !show;
                if (show) shown++;
            });
            if (empty) empty.hidden = shown !== 0;
        }

        search.addEventListener('input', apply);
        chips.forEach(function (chip) {
            chip.addEventListener('click', function () {
                chips.forEach(function (c) { c.classList.remove('is-active'); });
                chip.classList.add('is-active');
                activeCat = chip.getAttribute('data-cat');
                apply();
            });
        });
    })();
</script>

<#include "/partial/menu/menu.ftl">
</body>
</html>
