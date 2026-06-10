<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
</head>
<body>

<section class="hero">
    <div class="container hero-grid">
        <div class="hero-content fade-in">
            <div class="nav-brand" style="margin-bottom: 4rem;">
                <#include "/partial/brand/asymm-brand.ftl">
            </div>
            <#if content.hero_badge??>
            <div class="hero-badge">
                <span class="dot"></span>${content.hero_badge}
            </div>
            </#if>
            <h1>${content.hero_title}</h1>
            <p>${content.hero_text}</p>
            <#if content.hero_install_command??>
            <button type="button" class="inline-terminal" style="max-width: 500px; margin-top: 1rem;"
                onclick="copyToClipboard('${content.hero_install_command}');"
                aria-label="Copy command: ${content.hero_install_command}">
                <code>${content.hero_install_command}</code>
                <span class="copy-btn" aria-hidden="true">Copy</span>
            </button>
            </#if>
            <#if content.hero_cta_primary?? || content.hero_cta_secondary??>
            <div class="hero-cta">
                <#if content.hero_cta_primary??>
                <a href="${content.hero_cta_primary_href}" class="org-link org-cta org-link--internal">${content.hero_cta_primary}</a>
                </#if>
                <#if content.hero_cta_secondary??>
                <a href="${content.hero_cta_secondary_href}" class="org-link org-cta org-link--internal">${content.hero_cta_secondary}</a>
                </#if>
            </div>
            </#if>
        </div>
        <div class="hero-visual">
            <#if content.hero_visual_include??>
            <#include "${content.hero_visual_include}">
            </#if>
        </div>
    </div>
</section>

<article class="microsite-body">
    <#-- Eliya is currently the only product_home consumer; its body lives in
         /content/product/eliya.html (FTL form with macro calls) so it can use
         the macro library. The body's own sections wrap content in
         <div class="container">, so no outer container here — that would
         double-pad the left/right edges. When a second product page lands
         (e.g. Dial), make this include conditional on content.uri or use a
         frontmatter pointer. -->
    <#include "/content/product/eliya.html">
</article>

<#include "/partial/menu/menu.ftl">
</body>
</html>
