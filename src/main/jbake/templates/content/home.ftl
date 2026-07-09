<#-- Home page content: bento product grid + methodology + OSS banner.
     Macros live in /macro/; brand visuals in /partial/brand/. -->
<#include "/macro/cards.ftl">
<#include "/macro/release.ftl">

<!-- Products: Dial + Eliya bento cards -->
<section class="products-bento fade-in">
    <div class="container">
        <div class="section-intro">
            <span class="section-kicker">Compliance-by-Compilation</span>
            <h2>Fail the build, not the audit.</h2>
            <p>Compliance and conformance are usually found late, in integration, certification, or an audit. Asymm Systems makes them part of the build: a non-conforming architecture does not ship, because it does not compile.</p>
        </div>
        <div class="bento-grid">

            <@renderBentoCard
                cardClass="bento-dial"
                badge="ODA-Native"
                title="Build-Time Compliance Verification"
                text="The developer ecosystem that understands TMFC components, eTOM processes, and Open APIs natively. Non-compliant architecture and spec violations fail the build, not the integration round."
                status="Prototype complete. Launching 2026."
                cta_label="Explore Dial"
                cta_href="/product/dial.html">
                <#assign dial_color = "#e6e6e6">
                <#include "/partial/brand/dial-brand.ftl">
            </@renderBentoCard>

            <@renderBentoCard
                cardClass="bento-eliya eliya-trigger-parent"
                badge="Platform Foundation"
                title="The JDK Built for Telecom"
                text="OpenJDK for compliance-conscious industries. Operational-readiness defaults out of the box (heap dump on OOM, NMT, crash log path, JFR one flag away). Diagnostic data stays inside your perimeter. Coming to SDKMAN."
                install_cmd="sdk install java ${eliyaVersion}-eliya"
                cta_label="Download"
                cta_href="/product/eliya.html">
                <div class="bento-watermark bento-watermark-eliya">
                    <#assign eliya_theme = "watermark">
                    <#assign eliya_trigger = "hover">
                    <#assign eliya_rounds = "1">
                    <#include "/partial/brand/eliya-brand.ftl">
                </div>
            </@renderBentoCard>
        </div>

        <p class="bento-industries">Eliya is tuned for regulated industries:
            <a href="/product/eliya/industries/telecom" class="org-link org-link--inline org-link--internal">telecom</a>,
            <a href="/product/eliya/industries/financial-services" class="org-link org-link--inline org-link--internal">financial services</a>,
            <a href="/product/eliya/industries/healthcare" class="org-link org-link--inline org-link--internal">healthcare</a>, and
            <a href="/product/eliya/industries/government" class="org-link org-link--inline org-link--internal">government</a>.</p>

        <!-- Market context -->
        <div class="market-context">
            <p>Dial serves the <strong>TMF Open Digital Architecture</strong> ecosystem - the global standard for telecom digital transformation. We started with telecom because that's where we have 15 years of domain expertise. The approach is designed to extend to any industry with formal specifications.</p>

            <div class="market-image-wrapper">
                <img src="/images/oda-simplified.png" alt="ODA Simplified Mapping" class="market-img" />
            </div>

            <div class="stats-grid stats-grid--inline">
                <div class="stat-item">
                    <span class="stat-number">186</span>
                    <span class="stat-label">ODA Signatories</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">18</span>
                    <span class="stat-label">CSPs on ODA</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">2B+</span>
                    <span class="stat-label">Subscribers</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">1,700+</span>
                    <span class="stat-label">API Deployments</span>
                </div>
            </div>
            <p class="stats-source">Source: <a href="https://www.tmforum.org/oda" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">TM Forum</a></p>
        </div>
    </div>
</section>

<!-- Methodology -->
<section class="pipeline-section fade-in">
    <div class="container">
        <div class="section-intro">
            <span class="section-kicker">The Methodology</span>
            <h2>Rethinking Compliance</h2>
            <p>We believe true compliance isn't verified manually before deployment - it's enforced automatically during the development process.</p>
        </div>
        <div class="pipeline-grid">
            <@renderPipelineStep
                number="01"
                title="ODA-Native Development"
                text="Build components using ODA standards as first-class developer constructs in a specification-aware ecosystem." />
            <div class="pipeline-connector"></div>
            <@renderPipelineStep
                number="02"
                title="Build-Time Compliance"
                text="Shift TMF compliance validation entirely to the left. Violations are caught during the build, not during expensive integration rounds." />
            <div class="pipeline-connector"></div>
            <@renderPipelineStep
                number="03"
                title="Production-Ready Execution"
                text="Deploy standard, compliant TMF components on Eliya, with operational-readiness and observability defaults built in for demanding production workloads." />
        </div>
    </div>
</section>

<!-- OSS Banner -->
<section class="oss-banner fade-in">
    <div class="container">
        <div class="oss-content">
            <div>
                <p>Our founder is a contributor to <a href="https://spring.io/projects/spring-cloud-netflix" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">Spring Cloud Netflix</a>, <a href="https://spring.io/projects/spring-boot" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">Spring Boot</a>, and <a href="https://debezium.io/" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">Debezium</a>. We believe in giving back to the JVM ecosystem that powers our products.</p>
            </div>
        </div>
    </div>
</section>
