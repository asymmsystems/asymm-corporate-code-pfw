<!DOCTYPE html>
<html lang="en">
<head>
<#include "/partial/header.ftl">
</head>
<body>
<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "/partial/brand/asymm-brand.ftl"></div>
    </nav>
</div>

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <article class="page-body">
        <h1 class="page-title">Newsroom</h1>
        <p>Announcements from Asymm Systems, and where Eliya and the company have been covered across the Java and telecom press.</p>

        <div class="news-list">
            <#assign posts_to_list = []>
            <#if published_posts??>
                <#assign posts_to_list = published_posts>
            <#elseif posts??>
                <#assign posts_to_list = posts>
            </#if>

            <#if (posts_to_list?size > 0)>
                <#include "/macro/news.ftl">
                <#list posts_to_list as post>
                    <@renderNewsEntry
                        title=post.title
                        uri=post.uri
                        description=(post.description!"")
                        meta_left=(post.kicker!"Announcement")
                        meta_right=post.date?string("dd MMMM yyyy")
                        cta_label="…more" />
                </#list>
            <#else>
                <p style="opacity: 0.5;">No announcements yet. Check back soon for updates.</p>
            </#if>
        </div>

        <section class="press" style="margin-top: 5rem;">
            <h2>In the press</h2>
            <p>Where Eliya and Asymm Systems have been covered and featured. For interviews or briefings, reach us at
                <a href="mailto:ping@asymm.systems" class="org-link org-link--inline org-link--internal">ping@asymm.systems</a>.</p>
            <ul class="press-list">
                <li>
                    <strong>InfoQ</strong>:
                    <a href="https://www.infoq.com/news/2026/06/eliya-jvm-diagnostic-profile/" target="_blank" rel="noopener"
                        class="org-link org-link--inline org-link--external">Eliya 25 Brings a JVM-Level Diagnostic Profile to OpenJDK 25 LTS</a>.
                    Coverage of the Eliya 25.0.3 release and the <code>-XX:EliyaProfile</code> policy point. June 2026.
                </li>
                <li>
                    <strong>InfoQ</strong>:
                    <a href="https://www.infoq.com/news/2026/06/java-news-roundup-jun22-2026/" target="_blank" rel="noopener"
                        class="org-link org-link--inline org-link--external">Java News Roundup</a>.
                    Eliya featured alongside the wider Java ecosystem. June 2026.
                </li>
                <li>
                    <strong>JVM Weekly</strong>:
                    <a href="https://www.jvm-weekly.com/p/where-production-policy-belongs-building" target="_blank" rel="noopener"
                        class="org-link org-link--inline org-link--external">Where Production Policy Belongs: Building Eliya in Public with Fahim Farook</a>.
                    Volume 183.
                </li>
                <li>
                    <strong>Foojay</strong>:
                    <a href="https://foojay.io/today/where-production-policy-belongs-building-eliya-in-public/" target="_blank" rel="noopener"
                        class="org-link org-link--inline org-link--external">Where production policy belongs: building Eliya in public (part 1)</a>.
                    The thesis behind EliyaProfile, by founder Fahim Farook.
                </li>
                <li>
                    <strong>NLJUG</strong> (Nederlandse Java User Group):
                    <a href="https://nljug.org/foojay/where-production-policy-belongs-building-eliya-in-public-part-1/" target="_blank" rel="noopener"
                        class="org-link org-link--inline org-link--external">Where production policy belongs: building Eliya in public (part 1)</a>.
                    Syndicated to the Dutch Java User Group.
                </li>
            </ul>
        </section>
    </article>
</div>

<#include "/partial/menu/menu.ftl">
</body>
</html>
