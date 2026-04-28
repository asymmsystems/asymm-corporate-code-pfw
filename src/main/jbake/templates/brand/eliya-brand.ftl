<#--
    eliya-brand.ftl — Eliya logo SVG (cup + smoke) with theme + animation + color control.
    CSS for these classes lives in style.scss (so the markup can also be inlined directly
    in HTML content pages without going through an FTL include).

    Parameters (set via FreeMarker <#assign> in the calling template, or via frontmatter
    on the content page when the calling template forwards them):

        eliya_theme       : "color" (default, rose smoke) | "mono" (text-primary at low alpha) | "watermark" (#e6e6e6)
        eliya_trigger     : "auto"  (default, autoplay)   | "hover" (animate on parent ":hover")
        eliya_rounds      : "infinite" (default for auto) | <integer N> (e.g. "1", "3", "5")
        eliya_cup_color   : <CSS color>  (optional override — applied to the cup paths only)
        eliya_smoke_color : <CSS color>  (optional override — applied to the smoke paths only)

    Either color override wins over the theme's default for that part. Set one or both.
    For hover trigger to fire, the parent element must have class "eliya-trigger-parent".
-->
<#assign eliya_theme = (eliya_theme!"color")>
<#assign eliya_trigger = (eliya_trigger!"auto")>
<#assign eliya_rounds = (eliya_rounds!"infinite")>
<#assign eliya_cup_color = (eliya_cup_color!"")>
<#assign eliya_smoke_color = (eliya_smoke_color!"")>

<#assign eliyaInlineStyle = "">
<#if eliya_cup_color != ""><#assign eliyaInlineStyle = eliyaInlineStyle + "--eliya-cup-stroke: " + eliya_cup_color + ";"></#if>
<#if eliya_smoke_color != ""><#assign eliyaInlineStyle = eliyaInlineStyle + " --eliya-smoke-stroke: " + eliya_smoke_color + ";"></#if>
<#if eliya_rounds != "infinite"><#assign eliyaInlineStyle = eliyaInlineStyle + " --eliya-rounds: " + eliya_rounds + ";"></#if>

<svg class="eliya-svg-logo eliya-svg-logo--${eliya_theme} eliya-svg-logo--${eliya_trigger}"
     <#if eliyaInlineStyle != "">style="${eliyaInlineStyle}"</#if>
     viewBox="0 0 399 391" fill="none" xmlns="http://www.w3.org/2000/svg"
     aria-label="Eliya">
    <g transform="translate(0.5,0.5)">
        <!-- Cup body, rim, handle (static) -->
        <path class="eliya-cup-stroke" d="M 137 360 Q 17 310 27 170" />
        <path class="eliya-cup-stroke" d="M 133 359.5 L 221 359.5" />
        <path class="eliya-cup-stroke" d="M 17 170 L 337 170" />
        <path class="eliya-cup-stroke eliya-cup-base" d="M 7 382 L 367 382" />
        <path class="eliya-cup-stroke" d="M 217 360 Q 337 310 327 170" />
        <path class="eliya-cup-stroke" d="M 267 330 Q 377 280 387 230 Q 397 180 327 200" />

        <!-- Smoke (straight vertical lines, animated via CSS d-property morph) -->
        <path class="eliya-smoke eliya-smoke-1" d="M 177 150 L 177 70" />
        <path class="eliya-smoke eliya-smoke-2" d="M 137 150 L 137 110" />
        <path class="eliya-smoke eliya-smoke-3" d="M 217 150 L 217 10" />
    </g>
</svg>
