<#-- Home page — pure structural shell. Page sections + macro invocations
     live in /content/home.ftl. -->
<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
</head>
<body>

<#if content.hero_title??>
<#include "/partial/hero.ftl">
</#if>

<#-- .page-body wrapper makes the alternating section-bg rule fire
     on the corporate home (3 sections: bento / pipeline / OSS banner).
     Hero stays outside the wrapper because it has its own treatment. -->
<article class="page-body home-body">
    <#include "/content/home.ftl">
    ${content.body}
</article>

<#include "/partial/menu/menu.ftl">
</body>
</html>
