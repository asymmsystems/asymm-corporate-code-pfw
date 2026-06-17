<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<#list published_content as content>
    <#-- Surveys are direct-link only: keep them out of the sitemap. -->
    <#if (content.type!"") != "survey">
    <url>
        <loc>${config.site_host}/${content.uri}</loc>
        <lastmod>${content.date?string("yyyy-MM-dd")}</lastmod>
    </url>
    </#if>
</#list>
</urlset>
