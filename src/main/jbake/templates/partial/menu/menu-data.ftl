<#--
    menu-data.ftl — declarative menu and breadcrumb definitions.

    ============================================================
    menuContexts — status-bar / drawer menu items
    ============================================================
    Schema:
        menuContexts : sequence of contexts. The first one whose `match` is a prefix
                       of content.uri wins. If none match, menuDefault is used.
        Each context has:
            match : URI substring (no leading slash, JBake's content.uri form)
            items : sequence of menu items

        Each item has:
            label    : display text (required)
            href     : target URL (omit if `children` or `muted` is set)
            children : nested items for a dropdown (optional, single-level for now)
            muted    : true for visually-de-emphasised non-link items (e.g. © Asymm)

    Adding a new product context = one new entry in menuContexts. Adding a child link
    = one entry inside children. No new templates, no dispatch code.

    ============================================================
    breadcrumbContexts — top-of-page breadcrumb trails
    ============================================================
    Schema:
        breadcrumbContexts : sequence of contexts. First match (URI substring)
                             wins. Pages with no match render no breadcrumb.
        Each context has:
            match : URI substring (no leading slash)
            trail : ordered sequence of breadcrumb segments LEADING UP TO the
                    current page. Each segment has `label` and `href` (href
                    can be empty string for non-link nodes like "product").

    The page's own segment is rendered as the leaf at the end of the trail
    automatically (derived from URI's last segment, or the
    `breadcrumb_leaf` frontmatter override).

    More-specific contexts (deeper match prefixes) MUST be listed first.
-->

<#assign menuDefault = [
    {
        "label": "Products",
        "children": [
            { "label": "Eliya", "href": "/product/eliya.html" },
            { "label": "Dial",  "href": "/product/dial.html" }
        ]
    },
    { "label": "Research",       "href": "/research.html" },
    { "label": "Registry",       "href": "/registry.html" },
    { "label": "About",          "href": "/about.html" },
    { "label": "Contact",        "href": "/about.html#contact" }
    <#-- Privacy and "© 2026 Asymm" are sitewide meta items; emitted by
         menu.ftl directly so they appear on every page regardless of which
         context overrides menuDefault. Don't add them here. -->
]>

<#assign menuContexts = [
    {
        "match": "product/eliya",
        "items": [
            {
                "label": "Engineer",
                "children": [
                    { "label": "User Guide",        "href": "/product/eliya/user-guide/" },
                    { "label": "Flags reference",   "href": "/product/eliya/user-guide/flags-reference.html" },
                    { "label": "Diff from upstream","href": "/product/eliya/user-guide/diff-from-upstream.html" },
                    { "label": "asymm CLI",         "href": "/product/eliya/user-guide/cli.html" },
                    { "label": "Flag architecture", "href": "/product/eliya/user-guide/flag-architecture.html" },
                    { "label": "Install",           "href": "/product/eliya/user-guide/install-linux.html" },
                    { "label": "Migration",         "href": "/product/eliya/migration.html" }
                ]
            },
            {
                "label": "Operator",
                "children": [
                    { "label": "Downloads",         "href": "/product/eliya/downloads.html" },
                    { "label": "Security",          "href": "/product/eliya/security.html" },
                    { "label": "Lifecycle",         "href": "/product/eliya/lifecycle.html" },
                    { "label": "Verify download",   "href": "/product/eliya/user-guide/verify-download.html" },
                    { "label": "Lessons from production", "href": "/product/eliya/user-guide/lessons-from-production.html" }
                ]
            },
            {
                "label": "Decider",
                "children": [
                    { "label": "FAQ",                "href": "/product/eliya/faq.html" },
                    { "label": "Compare JDKs",       "href": "/research/choosing-a-jdk-2026.html" },
                    { "label": "JVM forensics vs APM","href": "/research/jvm-forensics-vs-apm.html" },
                    { "label": "Diff from upstream", "href": "/product/eliya/user-guide/diff-from-upstream.html" },
                    { "label": "License",           "href": "/product/eliya/user-guide/license.html" },
                    { "label": "Release Notes",     "href": "/product/eliya/user-guide/release-notes.html" }
                ]
            }
        ]
    }
]>

<#assign breadcrumbContexts = [
    {
        "match": "product/eliya/user-guide",
        "trail": [
            { "label": "asymm",      "href": "/" },
            { "label": "product",    "href": "" },
            { "label": "eliya",      "href": "/product/eliya.html" },
            { "label": "user-guide", "href": "/product/eliya/user-guide/" }
        ]
    },
    {
        "match": "product/eliya",
        "trail": [
            { "label": "asymm",   "href": "/" },
            { "label": "product", "href": "" },
            { "label": "eliya",   "href": "/product/eliya.html" }
        ]
    },
    {
        "match": "product/forensics",
        "trail": [
            { "label": "asymm",   "href": "/" },
            { "label": "product", "href": "" }
        ]
    }
]>
