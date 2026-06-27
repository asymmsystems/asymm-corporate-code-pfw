<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
    <title>${config.site_title?xml}</title>
    <subtitle>${config.site_description?xml}</subtitle>
    <link href="${config.site_host}/feed.xml" rel="self"/>
    <link href="${config.site_host}/"/>
    <id>${config.site_host}/</id>
    <updated>${published_date?string("yyyy-MM-dd'T'HH:mm:ss'Z'")}</updated>
<#list published_posts as post>
    <entry>
        <title>${post.title?xml}</title>
        <link href="${config.site_host}/${post.uri}"/>
        <id>${config.site_host}/${post.uri}</id>
        <updated>${post.date?string("yyyy-MM-dd'T'HH:mm:ss'Z'")}</updated>
        <#if post.description??><summary>${post.description?xml}</summary></#if>
    </entry>
</#list>
<#-- Research / Laboratory articles (undated articles fall back to the build date) -->
<#list published_content as c>
    <#if ((c.uri!"")?starts_with("research/")) && (c.type!"") != "survey">
    <entry>
        <title>${c.title?xml}</title>
        <link href="${config.site_host}/${c.uri}"/>
        <id>${config.site_host}/${c.uri}</id>
        <updated><#if c.date??>${c.date?string("yyyy-MM-dd'T'HH:mm:ss'Z'")}<#else>${published_date?string("yyyy-MM-dd'T'HH:mm:ss'Z'")}</#if></updated>
        <#if c.description??><summary>${c.description?xml}</summary></#if>
    </entry>
    </#if>
</#list>
</feed>
