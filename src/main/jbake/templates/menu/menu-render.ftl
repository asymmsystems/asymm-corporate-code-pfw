<#--
    menu-render.ftl — rendering macros for the data in menu-data.ftl.

    <@renderStatusItems items=...>   desktop status bar (with hover/click dropdowns)
    <@renderDrawerItems items=...>   mobile drawer (flat list with indented children)
-->

<#macro renderStatusItems items>
    <#list items as item>
        <#if (item.children)??>
            <div class="status-item has-submenu">
                <button class="status-trigger" aria-expanded="false" aria-haspopup="true">
                    ${item.label} <span class="submenu-caret" aria-hidden="true">▴</span>
                </button>
                <ul class="submenu" role="menu">
                    <#list item.children as child>
                        <li role="none"><a href="${child.href}" role="menuitem">${child.label}</a></li>
                    </#list>
                </ul>
            </div>
        <#elseif (item.muted)?? && item.muted>
            <span class="status-item" style="opacity: 0.5; padding-right: 1.2rem; cursor: default;">${item.label}</span>
        <#else>
            <a href="${item.href}" class="status-item">${item.label}</a>
        </#if>
    </#list>
</#macro>

<#macro renderDrawerItems items>
    <#list items as item>
        <#if (item.children)??>
            <span class="drawer-label">${item.label}</span>
            <#list item.children as child>
                <a href="${child.href}" class="drawer-link drawer-link--indent">${child.label}</a>
            </#list>
        <#elseif (item.muted)?? && item.muted>
            <#-- skip muted items in the mobile drawer -->
        <#else>
            <a href="${item.href}" class="drawer-link">${item.label}</a>
        </#if>
    </#list>
</#macro>
