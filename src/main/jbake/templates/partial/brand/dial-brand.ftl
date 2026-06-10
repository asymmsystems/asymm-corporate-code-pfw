<#--
    dial-brand.ftl — self-contained Dial logo (CSS + image markup + single-fire rotate JS).

    Parameters:
        dial_color : <hex CSS color, e.g. "#e6e6e6">
                     The "#" is stripped to form the image filename suffix:
                     /images/dial-logo-short-{1,2}-<color>.png
                     (Defaults to "#e6e6e6" — the watermark grey used on home.)

    Markup pattern: two PNG watermarks layered on top of each other inside a
    `.bento-watermark` / `.bento-watermark-dial` wrapper. The front layer
    (.bento-watermark-1) rotates 70° and back to 0° once per parent hover; the
    back layer stays static. JS adds .is-dialing on mouseenter, removes on
    animationend. The script is idempotent (dataset.dialBound) so duplicate
    includes won't double-bind.
-->
<#assign dial_color = (dial_color!"#e6e6e6")>
<#assign dial_color_slug = dial_color?replace("#", "")>

<style>
    /* Dial logo rotation. Layout for .bento-watermark / .bento-watermark-dial
       is part of the bento-card layout in style.scss. */
    .bento-watermark-dial.is-dialing {
        animation: dial-rotate 1.4s cubic-bezier(0.45, 0.05, 0.55, 0.95);
    }
    @keyframes dial-rotate {
        0%   { transform: rotate(0deg); }
        35%  { transform: rotate(70deg); }
        70%  { transform: rotate(70deg); }
        100% { transform: rotate(0deg); }
    }
</style>

<img src="/images/dial-logo-short-2-${dial_color_slug}.png" class="bento-watermark bento-watermark-dial" alt="" />
<img src="/images/dial-logo-short-1-${dial_color_slug}.png" class="bento-watermark bento-watermark-dial bento-watermark-1" alt="" />

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
