<#--
    waitlist.ftl — Formspree-backed early-access signup form.

    <@renderWaitlistForm
        formspree_url="https://formspree.io/f/xxxxxxxx"
        product_tag="forensics-local"
        heading="Get notified when Asymm Forensics is available"
        body="Asymm Forensics — the JVM diagnostic forensics platform — is in active development. Join the early access list."
        submit_label="Get notified at launch" />

    Uses the sitewide .form-group / .form-control / .form-submit pattern
    from the contact form (see /content/about.html) so all forms render
    identically across the site. No inline styles.
-->

<#macro renderWaitlistForm formspree_url product_tag heading body submit_label="Get notified" product_label=""><#local label = product_label?has_content?then(product_label, product_tag)>
<div class="waitlist-form callout-box">
    <h3>${heading}</h3>
    <p>${body}</p>

    <form action="${formspree_url}" method="POST" class="contact-form">
        <input type="hidden" name="product_tag" value="${product_tag}">
        <input type="hidden" name="_subject" value="Waitlist signup: ${product_tag}">

        <div class="form-group">
            <label for="waitlist-email-${product_tag}">
                Email <span aria-hidden="true">*</span>
                <span class="visually-hidden">(required)</span>
            </label>
            <input type="email" id="waitlist-email-${product_tag}" name="email" required
                   autocomplete="email" class="form-control"
                   placeholder="you@company.com">
        </div>

        <div class="form-group">
            <label for="waitlist-usecase-${product_tag}">
                Tell us about your use case
                <span class="optional">(optional)</span>
            </label>
            <textarea id="waitlist-usecase-${product_tag}" name="use_case" rows="3"
                      class="form-control"
                      placeholder="What are you building?"></textarea>
        </div>

        <div class="form-group checkbox-group">
            <input type="checkbox" id="waitlist-consent-${product_tag}" name="consent" required>
            <label for="waitlist-consent-${product_tag}" class="checkbox-label">
                I agree to receive product-launch notifications and quarterly progress updates
                about ${label}. I understand I can unsubscribe at any time via the link
                in every email.
            </label>
        </div>

        <button type="submit" class="form-submit">
            <span class="org-link org-link--internal">${submit_label}</span>
        </button>

        <p class="form-note">
            We'll only email you about <strong>${label}</strong> progress.
            One-click unsubscribe in every email; we never share your data.
            See <a href="/privacy.html" class="org-link org-link--inline org-link--internal">privacy</a>.
        </p>
    </form>
</div>
</#macro>
