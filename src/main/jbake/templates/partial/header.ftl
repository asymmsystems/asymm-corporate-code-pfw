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
<#assign siteDefaultDesc = "Developer tools that verify conformance to industry specifications - before deployment, not after.">
<#if (content.seo_title)??>
  <#assign metaTitle = content.seo_title>
<#elseif (content.title)??>
  <#assign metaTitle = content.title + " - Asymm Systems">
<#else>
  <#assign metaTitle = "Asymm Systems">
</#if>
<#assign metaDescription = (content.description)!siteDefaultDesc>
<#-- Canonical / og:url: site_host + "/" + uri, trailing index.html stripped to the clean directory URL. -->
<#assign pageUri = (content.uri)!"">
<#if pageUri?ends_with("index.html")>
  <#assign pageUri = pageUri?substring(0, pageUri?length - 10)>
</#if>
<#assign canonicalUrl = config.site_host + "/" + pageUri>
<#if (content.og_image)??>
  <#assign ogImage = config.site_host + "/images/" + content.og_image>
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
<meta name="theme-color" content="#5295A3">
<link rel="icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicon.svg" type="image/svg+xml">
<link rel="alternate icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicon.png" type="image/png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600&family=Proza+Libre:wght@400;500;600;700;800&family=Fira+Code:wght@400;500&display=swap" rel="stylesheet">
<link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6/css/all.min.css">

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
