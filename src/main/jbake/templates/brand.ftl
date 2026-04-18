<style>
    .asymm-brand {
        display: inline-flex;
        align-items: center;
        text-decoration: none;
        font-family: 'Alegreya', serif;
        font-weight: 600;
        font-size: 1.6rem;
        letter-spacing: -0.02em;
        color: #1A1C1E;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }
    .asymm-brand .bracket {
        color: inherit;
        line-height: 1;
    }
    .asymm-brand .bracket.right {
        transition: transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        transform: translate3d(0, 0, 0);
        will-change: transform;
        backface-visibility: hidden;
    }
    .asymm-brand .brand-text {
        padding-bottom: 2px;
        margin: 0 0.13em;
        color: inherit;
        line-height: 1;
        transition: transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        transform: translate3d(0, 0, 0);
        will-change: transform;
        backface-visibility: hidden;
    }
    .asymm-brand .systems-text {
        font-weight: 300;
        color: #333333;
        padding-left: 0.36em;
        padding-bottom: 2px;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        line-height: 1;
    }
    /* Dark Theme */
    .asymm-brand.brand-dark {
        color: #F9F7F6;
    }
    .asymm-brand.brand-dark .systems-text {
        color: #F9F7F6;
    }
    .asymm-brand.brand-dark:hover .systems-text, 
    .asymm-brand.brand-dark:focus .systems-text, 
    .asymm-brand.brand-dark:active .systems-text, 
    .asymm-brand.brand-dark.brand-reveal .systems-text {
        color: #F9F7F6;
    }

    .asymm-brand:hover, .asymm-brand:focus, .asymm-brand:active, .brand-reveal, .asymm-brand.brand-initial-release {
        color: #BA6E8F;
        opacity: 1.0;
    }
    .asymm-brand:hover .brand-text, .asymm-brand:focus .brand-text, .asymm-brand:active .brand-text, .brand-reveal .brand-text {
        transform: translate3d(0.45em, 0, 0);
    }
    .asymm-brand:hover .bracket.right, .asymm-brand:focus .bracket.right, .asymm-brand:active .bracket.right, .brand-reveal .bracket.right {
        transform: translate3d(-3.0em, 0, 0);
    }
    .asymm-brand:hover .systems-text, .asymm-brand:focus .systems-text, .asymm-brand:active .systems-text, .brand-reveal .systems-text {
        color: #333333;
        opacity: 1.0;
    }
    .asymm-brand.brand-initial-release,
    .asymm-brand.brand-initial-release .bracket.right,
    .asymm-brand.brand-initial-release .brand-text,
    .asymm-brand.brand-initial-release .systems-text {
        transition-duration: 1s !important;
    }
</style>
<a href="/" class="asymm-brand <#if brand_theme?? && brand_theme == 'dark'>brand-dark</#if> brand-reveal brand-initial-release">
    <span class="bracket">[</span><span class="brand-text">asymm</span><span class="bracket right">}</span>
    <span class="systems-text">systems</span>
</a>
<script>
    window.addEventListener('DOMContentLoaded', () => { 
        const reveals = document.querySelectorAll('.brand-reveal');
        setTimeout(() => reveals.forEach(el => el.classList.remove('brand-reveal')), 3000); 
        setTimeout(() => reveals.forEach(el => el.classList.remove('brand-initial-release')), 4200); 
    });
</script>
