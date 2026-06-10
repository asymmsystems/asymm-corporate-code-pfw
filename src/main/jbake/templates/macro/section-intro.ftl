<#--
    section-intro.ftl — kicker + heading + intro paragraph.

    <@renderSectionIntro kicker="…" title="…" text="…"/>
        Plain text body.

    <@renderSectionIntro kicker="…" title="…">…inline HTML body…</@renderSectionIntro>
        Use the nested form when the body needs links / strong / em / code.
        When `text` is empty AND there is nested content, the nested form
        wins. When both are empty, no body paragraph is emitted.
-->

<#macro renderSectionIntro kicker title text="">
<div class="section-intro">
    <span class="section-kicker">${kicker}</span>
    <h2>${title}</h2>
    <#if text != "">
    <p>${text}</p>
    <#else>
    <#nested>
    </#if>
</div>
</#macro>
