<#--
    guide-nav.ftl — end-of-page navigation for the Eliya user guide.

    Renders "previous | user guide | next" on every guide page, driven by the
    ordered list below. That order is the guide's reading order and mirrors the
    index at /product/eliya/user-guide/ — keep the two in step when adding a
    page. A page not in the list (or the index itself) renders no nav.

    Included once from page/page.ftl, so guide pages don't hand-roll a back
    link each. Arrows and colours come from .org-link (--back gives the left
    arrow, --internal the right); the centre link carries no modifier, so it
    gets no arrow.
-->
<#assign guidePages = [
    { "uri": "product/eliya/user-guide/what-is-eliya.html",          "label": "What is Eliya?" },
    { "uri": "product/eliya/user-guide/quick-start.html",            "label": "Quick start" },
    { "uri": "product/eliya/user-guide/install-linux.html",          "label": "Install on Linux" },
    { "uri": "product/eliya/user-guide/install-docker.html",         "label": "Install with Docker" },
    { "uri": "product/eliya/user-guide/install-macos.html",          "label": "Install on macOS" },
    { "uri": "product/eliya/user-guide/install-freebsd.html",        "label": "Install on FreeBSD" },
    { "uri": "product/eliya/user-guide/verify-download.html",        "label": "Verify your download" },
    { "uri": "product/eliya/user-guide/verify-reproducibility.html", "label": "Verify reproducibility" },
    { "uri": "product/eliya/user-guide/versioning.html",             "label": "Versioning" },
    { "uri": "product/eliya/user-guide/flag-architecture.html",      "label": "Flag architecture" },
    { "uri": "product/eliya/user-guide/flags-reference.html",        "label": "Flags reference" },
    { "uri": "product/eliya/user-guide/diff-from-upstream.html",     "label": "Diff from upstream" },
    { "uri": "product/eliya/user-guide/cli.html",                    "label": "asymm CLI" },
    { "uri": "product/eliya/user-guide/troubleshooting.html",        "label": "Troubleshooting" },
    { "uri": "product/eliya/user-guide/uninstall.html",              "label": "Uninstall" },
    { "uri": "product/eliya/user-guide/release-notes.html",          "label": "Release notes" },
    { "uri": "product/eliya/user-guide/license.html",                "label": "License" },
    { "uri": "product/eliya/user-guide/lessons-from-production.html","label": "Lessons from production" }
]>

<#assign guideIdx = -1>
<#list guidePages as p>
    <#if p.uri == (content.uri)!"">
        <#assign guideIdx = p?index>
    </#if>
</#list>

<#if guideIdx gte 0>
<nav class="guide-nav" aria-label="User guide">
    <div class="guide-nav-prev">
        <#if guideIdx gt 0>
        <a href="/${guidePages[guideIdx - 1].uri}"
            class="org-link org-link--internal org-link--back">${guidePages[guideIdx - 1].label}</a>
        </#if>
    </div>
    <div class="guide-nav-up">
        <a href="/product/eliya/user-guide/" class="org-link">user guide</a>
    </div>
    <div class="guide-nav-next">
        <#if guideIdx lt (guidePages?size - 1)>
        <a href="/${guidePages[guideIdx + 1].uri}"
            class="org-link org-link--internal">${guidePages[guideIdx + 1].label}</a>
        </#if>
    </div>
</nav>
</#if>
