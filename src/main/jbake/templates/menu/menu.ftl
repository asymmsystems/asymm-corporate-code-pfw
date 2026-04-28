<#assign uri = (content.uri)!"">
<#include "/menu/menu-data.ftl">
<#include "/menu/menu-render.ftl">

<#-- Resolve current items: first matching context wins, else default -->
<#assign currentItems = menuDefault>
<#list menuContexts as ctx>
    <#if uri?starts_with(ctx.match)>
        <#assign currentItems = ctx.items>
        <#break>
    </#if>
</#list>

<div class="ide-status-bar">
    <!-- Desktop -->
    <div class="status-left desktop-only">
        <a href="/" class="status-item" style="color: #BA6E8F; font-family: 'Alegreya', serif; font-size: 1.5rem; font-weight: 600; padding: 0 1.2rem; letter-spacing: 0.05em; padding-bottom: 3px;">
            [ }
        </a>
        <a href="/product/eliya.html" class="status-item">
            <img src="/images/eliya-logo-short.png" class="status-icon-img" alt="Eliya" /> Eliya
        </a>
        <a href="/product/dial.html" class="status-item">
            <img src="/images/dial-logo-short.png" class="status-icon-img" alt="Dial" /> Dial
        </a>
    </div>
    <div class="status-right desktop-only">
        <@renderStatusItems items=currentItems />
    </div>

    <!-- Mobile -->
    <div class="mobile-status-bar mobile-only">
        <a href="/" class="status-item" style="color: #BA6E8F; font-family: 'Alegreya', serif; font-size: 1.5rem; font-weight: 600; padding: 0 1.2rem; letter-spacing: 0.05em; padding-bottom: 3px;">
            [ }
        </a>
        <button class="terminal-toggle" id="terminal-toggle" aria-label="Toggle Navigation">
            <span style="font-family: 'Fira Code', monospace; font-size: 1.1rem;">&gt;_</span>
        </button>
    </div>
</div>

<!-- Mobile Terminal Drawer -->
<div class="terminal-drawer" id="terminal-drawer">
    <div class="drawer-header">
        <span style="color: #BA6E8F; font-family: 'Alegreya', serif; font-size: 1.5rem; font-weight: 600; padding: 0 1.2rem; letter-spacing: 0.05em; padding-bottom: 3px; display: flex; align-items: center;">
            [ }
        </span>
        <button class="terminal-toggle" id="terminal-close" aria-label="Close Navigation">
            <span style="font-family: 'Fira Code', monospace; font-size: 1.2rem;">×</span>
        </button>
    </div>
    <div class="drawer-content">
        <div class="drawer-section">
            <span class="drawer-label">// PRODUCTS</span>
            <a href="/product/eliya.html" class="drawer-link">
                <img src="/images/eliya-logo-short.png" class="status-icon-img" style="margin-right: 0.7rem;" alt="Eliya" /> Eliya
            </a>
            <a href="/product/dial.html" class="drawer-link">
                <img src="/images/dial-logo-short.png" class="status-icon-img" style="margin-right: 0.7rem;" alt="Dial" /> Dial
            </a>
        </div>
        <div class="drawer-section">
            <@renderDrawerItems items=currentItems />
        </div>
        <div class="drawer-footer">
            <a href="/privacy.html" class="drawer-link" style="font-size: 0.8rem; margin-bottom: 0.5rem; opacity: 0.7;">Privacy Policy</a>
            <span style="opacity: 0.5;">© 2026 Asymm Systems</span>
        </div>
    </div>
</div>

<script>
    window.addEventListener('DOMContentLoaded', () => {
        const toggle = document.getElementById('terminal-toggle');
        const closeBtn = document.getElementById('terminal-close');
        const drawer = document.getElementById('terminal-drawer');

        if (toggle && closeBtn && drawer) {
            toggle.addEventListener('click', (e) => {
                e.preventDefault();
                drawer.classList.add('open');
                document.body.style.overflow = 'hidden';
            });
            closeBtn.addEventListener('click', (e) => {
                e.preventDefault();
                drawer.classList.remove('open');
                document.body.style.overflow = '';
            });
        }

        // Status-bar hierarchical submenus (hover + click + keyboard)
        const submenus = document.querySelectorAll('.ide-status-bar .has-submenu');
        if (submenus.length) {
            let closeTimer = null;
            const closeAll = () => submenus.forEach(s => {
                s.dataset.open = 'false';
                s.querySelector('.status-trigger').setAttribute('aria-expanded', 'false');
            });
            const open = (el) => {
                closeAll();
                const trigger = el.querySelector('.status-trigger');
                const submenu = el.querySelector('.submenu');
                submenu.style.left = trigger.getBoundingClientRect().left + 'px';
                el.dataset.open = 'true';
                trigger.setAttribute('aria-expanded', 'true');
            };
            submenus.forEach(el => {
                el.addEventListener('mouseenter', () => { clearTimeout(closeTimer); open(el); });
                el.addEventListener('mouseleave', () => { closeTimer = setTimeout(closeAll, 150); });
                el.querySelector('.status-trigger').addEventListener('click', e => {
                    e.preventDefault();
                    el.dataset.open === 'true' ? closeAll() : open(el);
                });
            });
            document.addEventListener('keydown', e => { if (e.key === 'Escape') closeAll(); });
            document.addEventListener('click', e => {
                if (!e.target.closest('.has-submenu')) closeAll();
            });
            window.addEventListener('resize', () => {
                submenus.forEach(s => {
                    if (s.dataset.open === 'true') {
                        s.querySelector('.submenu').style.left =
                            s.querySelector('.status-trigger').getBoundingClientRect().left + 'px';
                    }
                });
            });
        }
    });

    function copyToClipboard(text) {
        navigator.clipboard.writeText(text).then(() => {
            const btn = event.target;
            const originalText = btn.innerText;
            btn.innerText = 'Copied!';
            setTimeout(() => { btn.innerText = originalText; }, 2000);
        });
    }
</script>
