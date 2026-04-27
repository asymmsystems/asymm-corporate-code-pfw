title=Eliya: The Server-First JDK for Telecom
date=2026-04-10
type=post
status=published
kicker=Official Announcement
description=Introducing Eliya - an OpenJDK distribution optimized for the world's most demanding telecom workloads.
~~~~~~

We are proud to announce the launch of **Eliya**, our specialised distribution of OpenJDK. 

### Why Eliya?
In telecom, we don't just need speed; we need predictability and extreme resilience. Eliya is built on the philosophy that the runtime should understand the workload. By fine-tuning JVM defaults for long-running, high-throughput server environments, we reduce the "tuning tax" that architects usually pay.

### Key Features
- **Server-Native Defaults**: Optimised for low-latency, high-concurrency telecom applications.
- **Enhanced Security**: Hardened patches specifically for enterprise deployments.
- **ODA-Aligned**: Designed to power the next generation of Open Digital Architecture components.

You can install the latest release via SDKman:
<div class="inline-terminal" style="margin: 2rem 0; background: var(--color-base); padding: 1rem; border: 1px dashed var(--border-normal); border-radius: 4px; font-family: var(--font-code); font-size: 0.9rem;">
    <code>sdk install java 25.0.2-eliya</code>
</div>

Read the full deep-dive on the philosophy behind Eliya: <a href="https://www.fahimfarook.me/why-asymm-jdk" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">Why We Built Our Own JDK</a>