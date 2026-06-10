<#--
    breadcrumb.ftl — terminal-styled breadcrumb component.

    Driven by `breadcrumbContexts` in /partial/menu/menu-data.ftl
    (parallel pattern to `menuContexts`). The first context whose
    `match` is a prefix of content.uri wins; pages without a matching
    context do not render a breadcrumb.

    Per-page leaf is derived from `content.breadcrumb_leaf` if set
    (frontmatter override), otherwise the URL leaf segment. The
    page's own segment is the rendered "leaf"; everything before it
    comes from the context's `trail`.

    Structure mirrors the legacy hardcoded markup so the existing
    .crumb-* CSS continues to apply unchanged. The wrapper class
    `.crumb-nav` replaces the legacy `.eliya-breadcrumb` (renamed
    sitewide as part of ADR-style refactor — breadcrumb is now a
    sitewide pattern, not Eliya-specific).

    Usage from a wrapper template:
        <#include "/macro/breadcrumb.ftl">
        <#include "/partial/menu/menu-data.ftl">
        <@renderBreadcrumbForUri uri=(content.uri!"") leaf=(content.breadcrumb_leaf!"") />
-->

<#macro renderBreadcrumb crumbs leaf>
<nav class="crumb-nav" aria-label="Breadcrumb"><#list crumbs as c><#if (c.href)?? && c.href != ""><a href="${c.href}">${c.label}</a><#else><span>${c.label}</span></#if><span class="crumb-sep">/</span></#list><span class="crumb-leaf">${leaf}</span></nav>
</#macro>

<#macro renderBreadcrumbForUri uri leaf>
    <#-- Resolve leaf: explicit param wins, otherwise derive from URI's last segment. -->
    <#assign resolvedLeaf = leaf>
    <#if resolvedLeaf == "">
        <#assign segments = uri?split("/")>
        <#assign last = segments[segments?size - 1]>
        <#-- Strip .html and trailing index. -->
        <#if last == "" || last == "index.html">
            <#assign last = segments[segments?size - 2]!"">
        </#if>
        <#assign resolvedLeaf = last?replace(".html", "")>
    </#if>

    <#-- Resolve trail: first matching context wins. -->
    <#assign matched = false>
    <#list breadcrumbContexts as ctx>
        <#if !matched && uri?contains(ctx.match)>
            <@renderBreadcrumb crumbs=ctx.trail leaf=resolvedLeaf />
            <#assign matched = true>
        </#if>
    </#list>
</#macro>
