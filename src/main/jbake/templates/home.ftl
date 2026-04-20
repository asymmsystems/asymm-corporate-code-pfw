<!DOCTYPE html>
<html lang="en">
<head>
<#include "header.ftl">
</head>
<body>

<#if content.hero_title??>
<#include "hero.ftl">
</#if>

${content.body}


<#include "menu.ftl">
</body>
</html>
