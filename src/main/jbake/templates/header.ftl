<meta charset="utf-8"/>
<title><#if (content.title)??><#escape x as x?xml>${content.title}</#escape> — Asymm Systems<#else>Asymm Systems</#if></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="<#if (content.description)??>${content.description}<#else>Developer tools that verify conformance to industry specifications — before deployment, not after.</#if>">
<link rel="icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicon.svg" type="image/svg+xml">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600&family=Proza+Libre:wght@400;500;600;700;800&family=Fira+Code:wght@400;500&display=swap" rel="stylesheet">
<link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/style.css" rel="stylesheet">

<!-- Open Graph -->
<meta property="og:title" content="<#if (content.title)??><#escape x as x?xml>${content.title}</#escape> — Asymm Systems<#else>Asymm Systems</#if>">
<meta property="og:description" content="Developer tools that verify conformance to industry specifications — before deployment, not after.">
<meta property="og:image" content="https://asymm.systems/images/og-image.png">
<meta property="og:url" content="https://asymm.systems<#if (content.uri)??>${content.uri}</#if>">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
