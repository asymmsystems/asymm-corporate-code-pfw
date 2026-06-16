title=Eliya is coming to SDKMAN
date=2026-06-12
type=post
status=published
kicker=Project Milestone
description=Eliya's SDKMAN vendor registration is in progress. Once it lands, installing Eliya is a single command.
~~~~~~

We want installing Eliya to be a single command, and for most developers that means SDKMAN. Our vendor registration is in progress: sdkman-db-migrations [PR #783](https://github.com/sdkman/sdkman-db-migrations/pull/783). Once it merges and our credentials are issued, this works on any shell with SDKMAN installed:

<div class="inline-terminal" style="margin: 2rem 0; background: var(--color-base); padding: 1rem; border: 1px dashed var(--border-normal); border-radius: 4px; font-family: var(--font-code); font-size: 0.9rem;">
    <code>sdk install java 25.0.3-eliya</code>
</div>

Until then, install Eliya directly from the [downloads page](/product/eliya/downloads.html) (tar.gz, `.deb`, `.rpm`, or the multi-arch Docker image) and use `update-alternatives` for side-by-side coexistence with your current JDK. We'll post here when registration is live.

<a href="/registry.html" class="org-link org-link--inline org-link--internal org-link--back">Back to Registry</a>
