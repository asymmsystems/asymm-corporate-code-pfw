<#--
    news.ftl — news/registry/research entry macro.

    <@renderNewsEntry
        title="…" uri="/path/to/post"
        description="…"
        meta_left="…"  meta_mid=""  meta_right=""
        cta_label="…more" />

    Used by both the news listing (kicker + date) and the research listing
    (field + format + lifecycle). Pipe separators are emitted between
    populated meta_* slots automatically. cta_label appears inline at the
    end of the description; defaults to "…more".
-->

<#macro renderNewsEntry title uri description meta_left meta_mid="" meta_right="" cta_label="…more">
<#-- Normalize post.uri (e.g. "registry/foo.html") to the canonical absolute
     extensionless form ("/registry/foo") so internal links point straight at
     the canonical URL instead of a relative .html that 308-redirects. -->
<#local href = uri>
<#if href?ends_with(".html")><#local href = href?remove_ending(".html")></#if>
<#if !href?starts_with("/")><#local href = "/" + href></#if>
<div class="news-entry">
    <div class="news-entry-meta">
        ${meta_left}<#if meta_mid != ""> <span class="news-entry-meta-sep">|</span> ${meta_mid}</#if><#if meta_right != ""> <span class="news-entry-meta-sep">|</span> ${meta_right}</#if>
    </div>
    <h2 class="news-entry-title"><a href="${href}" class="org-link org-link--internal">${title}</a></h2>
    <p class="news-entry-summary">${description} <a href="${href}" class="org-link org-link--inline org-link--internal">${cta_label}</a></p>
</div>
</#macro>
