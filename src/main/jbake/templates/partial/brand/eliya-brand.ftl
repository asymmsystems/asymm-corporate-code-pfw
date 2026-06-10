<#--
    eliya-brand.ftl — self-contained Eliya logo (CSS + SVG markup + animation).

    Parameters (set via <#assign> in the calling template, or via frontmatter on
    the content page when the calling template forwards them):

        eliya_theme       : "color" (default, rose smoke) | "mono" (text-primary at low alpha) | "watermark" (#e6e6e6)
        eliya_trigger     : "auto"  (default, autoplay)   | "hover" (animate on parent ":hover")
        eliya_rounds      : "infinite" (default for auto) | <integer N> (e.g. "1", "3", "5")
        eliya_cup_color      : <CSS color>  (optional override — applied to the cup outline strokes)
        eliya_cup_fill_color : <CSS color>  (optional override — applied to the cup body fill)
        eliya_smoke_color    : <CSS color>  (optional override — applied to the smoke paths only)

    Each override wins over the theme default for that part. Set any combination.
    For hover trigger, the parent must carry class "eliya-trigger-parent".
-->
<#-- Resolution order for each parameter:
       1. Explicit <#assign> in the calling template (wins)
       2. Frontmatter on the content page (`eliya_theme=…` etc.) via content.*
       3. Built-in default (last resort)
     This means content/product/eliya.html can set `eliya_theme=watermark`
     in its frontmatter and the brand will honour it without any wrapper
     plumbing. -->
<#assign eliya_theme = (eliya_theme!(content.eliya_theme)!"color")>
<#assign eliya_trigger = (eliya_trigger!(content.eliya_trigger)!"auto")>
<#assign eliya_rounds = (eliya_rounds!(content.eliya_rounds)!"infinite")>
<#assign eliya_cup_color = (eliya_cup_color!(content.eliya_cup_color)!"")>
<#assign eliya_cup_fill_color = (eliya_cup_fill_color!(content.eliya_cup_fill_color)!"")>
<#assign eliya_smoke_color = (eliya_smoke_color!(content.eliya_smoke_color)!"")>

<#assign eliyaInlineStyle = "">
<#if eliya_cup_color != ""><#assign eliyaInlineStyle = eliyaInlineStyle + "--eliya-cup-stroke: " + eliya_cup_color + ";"></#if>
<#if eliya_cup_fill_color != ""><#assign eliyaInlineStyle = eliyaInlineStyle + " --eliya-cup-fill: " + eliya_cup_fill_color + ";"></#if>
<#if eliya_smoke_color != ""><#assign eliyaInlineStyle = eliyaInlineStyle + " --eliya-smoke-stroke: " + eliya_smoke_color + ";"></#if>
<#if eliya_rounds != "infinite"><#assign eliyaInlineStyle = eliyaInlineStyle + " --eliya-rounds: " + eliya_rounds + ";"></#if>

<style>
    /* ============================================================
       Eliya brand-mark — cup + animated smoke. CSS scoped to
       .eliya-svg-logo so multiple instances on a page are safe.
       Stroke colours are CSS custom properties so the inline-style
       overrides above (frontmatter eliya_cup_color / eliya_smoke_color)
       win over per-theme fallbacks below.
       ============================================================ */
    .eliya-svg-logo {
        width: 100%;
        max-width: 400px;
        display: block;
    }
    .eliya-svg-logo .eliya-cup-stroke {
        stroke: var(--eliya-cup-stroke, var(--border-normal));
        stroke-width: 20;
        stroke-miterlimit: 10;
        fill: none;
    }
    .eliya-svg-logo .eliya-cup-base {
        stroke-width: 15;
    }
    .eliya-svg-logo .eliya-cup-fill {
        /* Cup fill defaults to the same colour as the cup outline so the
           cup reads as a single solid form. Override via --eliya-cup-fill
           (or eliya_cup_fill_color in frontmatter) for a two-tone effect. */
        fill: var(--eliya-cup-fill, var(--eliya-cup-stroke, var(--border-normal)));
        stroke: none;
    }
    .eliya-svg-logo .eliya-smoke {
        stroke-miterlimit: 10;
        fill: none;
    }
    .eliya-svg-logo .eliya-smoke-1 { stroke-width: 18; }
    .eliya-svg-logo .eliya-smoke-2 { stroke-width: 14; }
    .eliya-svg-logo .eliya-smoke-3 { stroke-width: 16; }

    /* Theme defaults (used when frontmatter doesn't override) */
    .eliya-svg-logo--color .eliya-smoke {
        stroke: var(--eliya-smoke-stroke, var(--color-rose));
    }
    .eliya-svg-logo--mono .eliya-smoke {
        stroke: var(--eliya-smoke-stroke, var(--text-primary));
        opacity: 0.55;
    }
    .eliya-svg-logo--mono .eliya-cup-fill {
        /* Default to the cup-stroke colour; mono theme already paints the
           outline at low alpha, so the fill follows. */
        fill: var(--eliya-cup-fill, var(--eliya-cup-stroke, var(--text-primary)));
        opacity: 0.55;
    }
    .eliya-svg-logo--watermark .eliya-cup-stroke {
        stroke: var(--eliya-cup-stroke, #e6e6e6);
    }
    .eliya-svg-logo--watermark .eliya-smoke {
        stroke: var(--eliya-smoke-stroke, #e6e6e6);
    }
    .eliya-svg-logo--watermark .eliya-cup-fill {
        fill: var(--eliya-cup-fill, #e6e6e6);
    }

    /* Trigger: auto — autoplay continuously */
    .eliya-svg-logo--auto .eliya-smoke-1 {
        animation: eliya-smoke-1-anim 1.5s ease-in-out var(--eliya-rounds, infinite);
    }
    .eliya-svg-logo--auto .eliya-smoke-2 {
        animation: eliya-smoke-2-anim 1.5s ease-in-out var(--eliya-rounds, infinite);
        animation-delay: 0.15s;
    }
    .eliya-svg-logo--auto .eliya-smoke-3 {
        animation: eliya-smoke-3-anim 1.5s ease-in-out var(--eliya-rounds, infinite);
        animation-delay: 0.3s;
    }

    /* Trigger: hover — animate when .eliya-trigger-parent ancestor is hovered */
    .eliya-trigger-parent:hover .eliya-svg-logo--hover .eliya-smoke-1 {
        animation: eliya-smoke-1-anim 1.5s ease-in-out var(--eliya-rounds, 1);
    }
    .eliya-trigger-parent:hover .eliya-svg-logo--hover .eliya-smoke-2 {
        animation: eliya-smoke-2-anim 1.5s ease-in-out var(--eliya-rounds, 1);
        animation-delay: 0.15s;
    }
    .eliya-trigger-parent:hover .eliya-svg-logo--hover .eliya-smoke-3 {
        animation: eliya-smoke-3-anim 1.5s ease-in-out var(--eliya-rounds, 1);
        animation-delay: 0.3s;
    }

    /* Straight-line smoke that grows tall at 50% and returns to rest at 100% */
    @keyframes eliya-smoke-1-anim {
        0%, 100% { d: path('M 177 150 L 177 70'); }
        50%      { d: path('M 177 150 L 177 10'); }
    }
    @keyframes eliya-smoke-2-anim {
        0%, 100% { d: path('M 137 150 L 137 110'); }
        50%      { d: path('M 137 150 L 137 60'); }
    }
    @keyframes eliya-smoke-3-anim {
        0%, 100% { d: path('M 217 150 L 217 10'); }
        50%      { d: path('M 217 150 L 217 110'); }
    }

    @media (prefers-reduced-motion: reduce) {
        .eliya-svg-logo .eliya-smoke {
            animation: none !important;
        }
    }
</style>

<svg class="eliya-svg-logo eliya-svg-logo--${eliya_theme} eliya-svg-logo--${eliya_trigger}"
     <#if eliyaInlineStyle != "">style="${eliyaInlineStyle}"</#if>
     viewBox="0 0 399 391" fill="none" xmlns="http://www.w3.org/2000/svg"
     aria-label="Eliya">
    <g transform="translate(0.5,0.5)">
        <!-- Cup body fill (rendered first so the outline strokes layer on top) -->
        <path class="eliya-cup-fill"
              d="M 79 120 Q 265 120 265 267 Q 265 414 79 414 Z"
              transform="rotate(90,172,267)" />

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
