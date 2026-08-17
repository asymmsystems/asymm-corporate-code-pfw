<#--
  Document head. Included by every page template (page, home, product/home,
  news, newsitem, research). SEO-bearing tags are derived from per-page front
  matter with site-level fallbacks.

  Front-matter knobs (all optional):
    seo_title   complete <title> override (else "${title} - Asymm Systems")
    description per-page meta + og + twitter description
    og_image    filename under /images/ for the social card (else og-image.png)
    og_type     open-graph type override (else "article" for posts, "website")
-->
<#assign siteDefaultDesc = "Asymm Systems builds Organization-as-Code: verify conformance to industry specifications at build time, not after deployment. Compliance-by-Compilation.">
<#if (content.seo_title)??>
  <#assign metaTitle = content.seo_title>
<#elseif (content.title)??>
  <#assign metaTitle = content.title + " - Asymm Systems">
<#else>
  <#assign metaTitle = "Asymm Systems">
</#if>
<#assign metaDescription = (content.description)!siteDefaultDesc>
<#-- Canonical / og:url: site_host + "/" + uri, reduced to the clean URL the host
     serves. Cloudflare Pages serves extensionless URLs and 308-redirects *.html
     to them, so strip index.html (directory pages) and the .html extension. -->
<#assign pageUri = (content.uri)!"">
<#if pageUri?ends_with("index.html")>
  <#assign pageUri = pageUri?substring(0, pageUri?length - 10)>
<#elseif pageUri?ends_with(".html")>
  <#assign pageUri = pageUri?substring(0, pageUri?length - 5)>
</#if>
<#assign canonicalUrl = config.site_host + "/" + pageUri>
<#-- og:image: explicit per-page override, else a per-product card, else the
     Asymm Systems company card. og-image.png is the company default. -->
<#assign pageUriForOg = (content.uri)!"">
<#if (content.og_image)??>
  <#assign ogImage = config.site_host + "/images/" + content.og_image>
<#elseif pageUriForOg?starts_with("product/eliya")>
  <#assign ogImage = config.site_host + "/images/og-eliya.png">
<#elseif pageUriForOg?starts_with("product/dial")>
  <#assign ogImage = config.site_host + "/images/og-dial.png">
<#elseif pageUriForOg?starts_with("product/forensics")>
  <#assign ogImage = config.site_host + "/images/og-forensics.png">
<#else>
  <#assign ogImage = config.site_host + "/images/og-image.png">
</#if>
<#if (content.og_type)??>
  <#assign ogType = content.og_type>
<#elseif (content.type)?? && content.type == "post">
  <#assign ogType = "article">
<#else>
  <#assign ogType = "website">
</#if>
<meta charset="utf-8"/>
<title>${metaTitle?xml}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="${metaDescription?xml}">
<link rel="canonical" href="${canonicalUrl}">
<link rel="alternate" type="application/atom+xml" title="Asymm Systems" href="${config.site_host}/feed.xml">
<meta name="theme-color" content="#5295A3">
<link rel="icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicon.svg" type="image/svg+xml">
<link rel="alternate icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicon.png" type="image/png">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600&family=Proza+Libre:wght@400;500;600;700;800&family=Fira+Code:wght@400;500&display=swap" rel="stylesheet">
<link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/style.css" rel="stylesheet">

<!-- Open Graph -->
<meta property="og:title" content="${metaTitle?xml}">
<meta property="og:description" content="${metaDescription?xml}">
<meta property="og:image" content="${ogImage}">
<meta property="og:url" content="${canonicalUrl}">
<meta property="og:type" content="${ogType}">
<meta property="og:site_name" content="Asymm Systems">
<#if (content.type)?? && content.type == "post" && (content.date)??>
<meta property="article:published_time" content="${content.date?string('yyyy-MM-dd')}">
</#if>
<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="${metaTitle?xml}">
<meta name="twitter:description" content="${metaDescription?xml}">
<meta name="twitter:image" content="${ogImage}">

<#include "/partial/seo/jsonld.ftl">
