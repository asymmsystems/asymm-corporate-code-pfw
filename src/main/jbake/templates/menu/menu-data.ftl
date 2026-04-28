<#--
    menu-data.ftl — declarative menu definitions.

    Schema:
        menuContexts : sequence of contexts. The first one whose `match` is a prefix
                       of content.uri wins. If none match, menuDefault is used.
        Each context has:
            match : URI prefix (no leading slash, JBake's content.uri form)
            items : sequence of menu items

        Each item has:
            label    : display text (required)
            href     : target URL (omit if `children` or `muted` is set)
            children : nested items for a dropdown (optional, single-level for now)
            muted    : true for visually-de-emphasised non-link items (e.g. © Asymm)

    Adding a new product context = one new entry in menuContexts. Adding a child link
    = one entry inside children. No new templates, no dispatch code.
-->

<#assign menuDefault = [
    { "label": "Research",       "href": "/research.html" },
    { "label": "Registry",       "href": "/registry.html" },
    { "label": "About",          "href": "/about.html" },
    { "label": "Contact",        "href": "/about.html#contact" },
    { "label": "© 2026 Asymm",   "muted": true }
]>

<#assign menuContexts = [
    {
        "match": "product/eliya",
        "items": [
            {
                "label": "Documentation",
                "children": [
                    { "label": "User Guide", "href": "/product/eliya/user-guide/" },
                    { "label": "Migration",  "href": "/product/eliya/migration.html" },
                    { "label": "Security",   "href": "/product/eliya/security.html" }
                ]
            },
            {
                "label": "Resources",
                "children": [
                    { "label": "Downloads",     "href": "/product/eliya/downloads.html" },
                    { "label": "Release Notes", "href": "/product/eliya/user-guide/release-notes.html" },
                    { "label": "Lifecycle",     "href": "/product/eliya/lifecycle.html" },
                    { "label": "License",       "href": "/product/eliya/user-guide/license.html" },
                    { "label": "FAQ",           "href": "/product/eliya/faq.html" }
                ]
            }
        ]
    }
]>
