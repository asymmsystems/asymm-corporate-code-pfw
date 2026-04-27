<#include "header.ftl">

<div class="container">
    <nav style="padding-top: 3rem;">
        <div class="nav-brand"><#include "brand.ftl"></div>
    </nav>
</div>

<div class="container container--wide">
    <article class="product-page">
        ${content.body}
    </article>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.install-tab');
    const panels = document.querySelectorAll('.install-panel');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const target = tab.getAttribute('data-tab');

            tabs.forEach(t => t.classList.remove('active'));
            panels.forEach(p => p.classList.remove('active'));

            tab.classList.add('active');
            document.getElementById(target).classList.add('active');
        });
    });
});
</script>

<#include "menu.ftl">
</body>
</html>
