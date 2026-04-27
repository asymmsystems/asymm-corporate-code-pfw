<div class="ide-status-bar">
    <!-- Desktop -->
    <div class="status-left desktop-only">
        <a href="/" class="status-item" style="color: #BA6E8F; font-family: 'Alegreya', serif; font-size: 1.5rem; font-weight: 600; padding: 0 1.2rem; letter-spacing: 0.05em; padding-bottom: 3px;">
            [ }
        </a>
        <a href="/product/eliya" class="status-item">
            <img src="/images/eliya-logo-short.png" class="status-icon-img" alt="Eliya" /> Eliya
        </a>
        <a href="/product/dial" class="status-item">
            <img src="/images/dial-logo-short.png" class="status-icon-img" alt="Dial" /> Dial
        </a>
    </div>
    <div class="status-right desktop-only">
        <a href="/research.html" class="status-item">Research</a>
        <a href="/product/eliya.html" class="status-item">Eliya JDK</a>
        <a href="/registry.html" class="status-item">Registry</a>
        <a href="/about.html" class="status-item">About</a>
        <a href="/about.html#contact" class="status-item">Contact</a>
        <span class="status-item" style="opacity: 0.5; padding-right: 1.2rem; cursor: default;">© 2026 Asymm</span>
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
            <a href="/product/eliya" class="drawer-link">
                <img src="/images/eliya-logo-short.png" class="status-icon-img" style="margin-right: 0.7rem;" alt="Eliya" /> Eliya
            </a>
            <a href="/product/dial" class="drawer-link">
                <img src="/images/dial-logo-short.png" class="status-icon-img" style="margin-right: 0.7rem;" alt="Dial" /> Dial
            </a>
        </div>
        <div class="drawer-section">
            <span class="drawer-label">Ecosystem</span>
            <a href="/registry.html" class="drawer-link">Registry</a>
            <a href="/research.html" class="drawer-link">Research</a>
            <a href="/about.html" class="drawer-link">About</a>
            <a href="/about.html#contact" class="drawer-link">Contact</a>
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
