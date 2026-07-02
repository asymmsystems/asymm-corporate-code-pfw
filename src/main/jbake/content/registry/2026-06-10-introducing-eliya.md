title=Introducing Eliya: OpenJDK for compliance-conscious industries
date=2026-06-10
type=post
status=published
kicker=Launch
description=Eliya 25 LTS is here: an OpenJDK distribution that keeps the diagnostic evidence on disk when production breaks, with data that never leaves your perimeter.
~~~~~~

Today we're releasing **Eliya 25 LTS**, the first general-availability build of our OpenJDK distribution.

Eliya is OpenJDK for compliance-conscious industries. It is the same Java you already run, built from the upstream OpenJDK 25 source tree under GPLv2 with the Classpath Exception, with no API changes. The difference shows up when something fails in production: the diagnostic evidence is already on disk.

One flag, `-XX:EliyaProfile=Production`, turns the JVM into a forensic recorder. Heap dump on OOM with a structured path, native memory tracking, a predictable crash-log location, container support reinforced, and the diagnostic options unlocked so Flight Recorder and async-profiler are one step away. Everything lands in a per-service, per-replica directory you can hand to an auditor, and none of it leaves your hardware. No SaaS, no telemetry, no phone-home.

The positioning is deliberate. Eliya does not tune your garbage collector or rewrite `java.security`; JDK 25's defaults are already correct, and duplicating them would tell you nothing. What Eliya adds is operational readiness, the forensic data that compliance audits and incident response need, in the environments where shipping it to a third-party analyzer is not an option: BFSI, healthcare, government, telecom.

Eliya ships in phases. Phase 1, today, is the observability-defaults foundation. Later phases add continuous recording by default, bundled local diagnostic tooling, a FIPS-validated variant, the Asymm Forensics cross-correlation platform, and compliance-aligned profiles, each one shipped when customer demand calls for it. The full phase-by-phase feature set is on the [roadmap](/product/eliya/roadmap.html).

If you are evaluating, we would rather you pick the right JDK than ours. We wrote a vendor-by-vendor [guide to choosing a JDK in 2026](/research/choosing-a-jdk-2026.html) that tells you when *not* to use Eliya.

[Download Eliya](/product/eliya.html) · [What is Eliya?](/product/eliya/user-guide/what-is-eliya.html)
