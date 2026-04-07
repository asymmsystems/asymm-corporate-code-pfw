<footer>
    <div class="container">
        <div class="footer-grid">
            <div class="footer-brand">
                <div class="nav-brand" style="color: white; margin-bottom: 1rem;">[asymm] <span>systems</span></div>
                <p style="color: #A0AEC0; font-size: 0.9rem;">Asymm Systems (Pvt) Ltd<br>Verification tools that verify conformance to industry specifications.</p>
            </div>
            <div class="footer-column">
                <h4>Products</h4>
                <a href="https://jdk.asymm.systems" target="_blank" rel="noopener">Asymm JDK</a>
                <a href="https://dial-lang.dev" target="_blank" rel="noopener">Dial Engine</a>
            </div>
            <div class="footer-column">
                <h4>Resources</h4>
                <a href="/research/bss-survey-2026.html">Research</a>
                <a href="https://dial-lang.dev" target="_blank" rel="noopener">Documentation</a>
            </div>
            <div class="footer-column">
                <h4>Company</h4>
                <a href="/about.html">About</a>
                <a href="/news.html">News</a>
                <a href="/privacy.html">Privacy</a>
                <a href="mailto:info@asymm.systems">Contact</a>
            </div>
        </div>
        <div class="copyright">
            &copy; 2026 Asymm Systems (Pvt) Ltd. All rights reserved. Built statically via JBake.
        </div>
    </div>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const observerOptions = { root: null, rootMargin: '0px', threshold: 0.1 };
        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = entry.target.classList.contains('slide-up') ? 'translateY(0)' : 'none';
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);
        document.querySelectorAll('.fade-in, .slide-up').forEach(el => {
            el.style.opacity = '0';
            el.style.transition = 'opacity 0.8s ease-out, transform 0.8s cubic-bezier(0.25, 0.8, 0.25, 1)';
            if (el.classList.contains('slide-up')) { el.style.transform = 'translateY(30px)'; }
            observer.observe(el);
        });
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/matter-js/0.19.0/matter.min.js"></script>
<script src="/js/main.js"></script>
