<#--
    dial-brand.ftl — Dial logo (rotary dial PNGs, two layers, single-fire rotate on hover).
    CSS for these classes lives in style.scss (so the markup can also be inlined directly
    in HTML content pages without going through an FTL include — see content/index.html
    bento-dial card).

    Markup pattern:
      Two PNG watermarks layered on top of each other inside a `.bento-watermark` /
      `.bento-watermark-dial` wrapper. The front layer (.bento-watermark-1) rotates 70°
      and back to 0° on parent hover; the back layer stays static. Animation is single-
      fire per hover (JS adds .is-dialing on mouseenter, removes on animationend).

    The script below is idempotent — multiple includes on a single page won't double-bind
    listeners because `closest('.bento-dial')` and the `dataset.dialBound` guard ensure
    each card is wired exactly once.
-->

<img src="/images/dial-logo-short-2.png" class="bento-watermark bento-watermark-dial" alt="" />
<img src="/images/dial-logo-short-1.png" class="bento-watermark bento-watermark-dial bento-watermark-1" alt="" />

<script>
    (() => {
        const dialCards = document.querySelectorAll('.bento-dial');
        dialCards.forEach(card => {
            if (card.dataset.dialBound === '1') return;
            const front = card.querySelector('.bento-watermark-1');
            if (!front) return;
            card.dataset.dialBound = '1';
            card.addEventListener('mouseenter', () => front.classList.add('is-dialing'));
            front.addEventListener('animationend', () => front.classList.remove('is-dialing'));
        });
    })();
</script>
