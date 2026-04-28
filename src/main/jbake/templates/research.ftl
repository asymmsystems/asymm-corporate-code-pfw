<#include "/header.ftl">
<#include "/menu/menu.ftl">

<div class="container" style="padding-top: 4rem; padding-bottom: 8rem; min-height: 70vh;">
    <article class="page-body">
        <h1 class="page-title">The Laboratory</h1>
        <p>Our goal is to drive ODA conformance and telecom innovation through developer-first empirical research.</p>
        
        <div class="news-list" style="margin-top: 4rem;">
            <#assign projects_count = 0>
            <#list all_content as project>
                <#if project.type?? && project.type == "project" && project.status == "published">
                    <#assign projects_count = projects_count + 1>
                    <div class="news-entry">
                        <div class="news-entry-meta" style="font-family: var(--font-body); font-size: 0.65rem; color: var(--color-rose); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 0.5rem;">
                            ${project.field!"RESEARCH"} <span style="margin: 0 0.5rem; opacity: 0.5;">|</span> ${project.format!"STUDY"} <span style="margin: 0 0.5rem; opacity: 0.5;">|</span> ${project.lifecycle!"ACTIVE"}
                        </div>
                        <h2 class="news-entry-title">
                            <a href="${project.uri}" class="org-link org-link--internal">${project.title}</a>
                        </h2>
                        <p class="news-entry-summary">
                            ${project.description!""} 
                            <a href="${project.uri}" class="org-link org-link--inline org-link--internal">Participate</a>
                        </p>
                    </div>
                </#if>
            </#list>

            <#if projects_count == 0>
                <p style="opacity: 0.5;">No active research tracks at this time. Check back later.</p>
            </#if>
        </div>

    </article>
</div>
<#include "/menu/menu.ftl">
</body>
</html>
