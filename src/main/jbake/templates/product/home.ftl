<!DOCTYPE html>
<html lang="en">
<head>
<#include "/header.ftl">
</head>
<body>

<section class="hero">
    <div class="container hero-grid">
        <div class="hero-content fade-in">
            <div class="nav-brand" style="margin-bottom: 4rem;">
                <#include "/brand/asymm-brand.ftl">
            </div>
            <#if content.hero_badge??>
            <div class="hero-badge">
                <span class="dot"></span>${content.hero_badge}
            </div>
            </#if>
            <h1>${content.hero_title}</h1>
            <p>${content.hero_text}</p>
            <#if content.hero_install_command??>
            <div class="inline-terminal" style="max-width: 500px; margin-top: 1rem;"
                onclick="copyToClipboard('${content.hero_install_command}');" title="Click to copy">
                <code>${content.hero_install_command}</code>
                <span class="copy-btn">Copy</span>
            </div>
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

<div class="container container--wide">
    <article class="microsite-body">
        ${content.body}
    </article>
</div>

<#include "/menu/menu.ftl">
</body>
</html>
