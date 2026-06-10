<#--
    cards.ftl — card-shaped reusable macros.

    <@renderBentoCard …>…visual…</@renderBentoCard>
        Home-page bento card: badge / title / text / optional status / optional
        install terminal / optional CTA + brand visual (via <#nested>).

    <@renderProductCard …/>
        Flat product-feature card: optional badge / title / text / optional
        inline link. dashed=true switches to the dashed-border modifier
        (used in roadmap section). Append extra utility classes via cardClass.

    <@renderPipelineStep …/>
        Numbered step card for the methodology section. No nested content.
-->
<#include "/macro/terminal.ftl">

<#macro renderBentoCard cardClass badge title text status="" install_cmd="" cta_label="" cta_href="">
<div class="bento-card ${cardClass}">
    <div class="bento-content">
        <span class="product-badge">${badge}</span>
        <h3>${title}</h3>
        <p>${text}</p>
        <#if status != "">
        <p class="bento-status">${status}</p>
        </#if>
        <#if install_cmd != "">
        <@renderInlineTerminal command=install_cmd />
        </#if>
        <#if cta_label != "">
        <a href="${cta_href}" class="org-link org-cta org-link--internal">${cta_label}</a>
        </#if>
    </div>
    <#nested>
</div>
</#macro>

<#macro renderProductCard title text badge="" link_label="" link_href="" link_external=false dashed=false cardClass="" icon="">
    <#assign classes = "product-feature-card">
    <#if dashed><#assign classes = classes + " product-feature-card--dashed"></#if>
    <#if cardClass != ""><#assign classes = classes + " " + cardClass></#if>
    <#assign linkClass = "org-link org-link--inline " + (link_external?then("org-link--external", "org-link--internal"))>
<div class="${classes}">
    <#if icon != "">
    <i class="product-feature-card__icon ${icon}" aria-hidden="true"></i>
    </#if>
    <#if badge != "">
    <span class="product-badge">${badge}</span>
    </#if>
    <h3>${title}</h3>
    <p>${text}</p>
    <#if link_label != "">
    <a href="${link_href}" class="${linkClass}">${link_label}</a>
    </#if>
</div>
</#macro>

<#macro renderPipelineStep number title text>
<div class="pipeline-step">
    <div class="step-number">${number}</div>
    <h4>${title}</h4>
    <p>${text}</p>
</div>
</#macro>
