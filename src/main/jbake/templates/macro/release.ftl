<#--
    release.ftl - single source of truth for Eliya release coordinates.

    Update the three primary version tokens (eliyaVersion, eliyaVnum,
    eliyaDockerTag) together on each Eliya CPU release. All pages that
    reference release coordinates pull from here, so one edit per quarter
    propagates everywhere. See asymm-jdk/task/wire-release-url-property.md
    for the full update procedure.

    Version-identity scheme per ADR-00029 (asymm-jdk repo):
        Canonical Eliya version = <VNUM>+<upstream-build>-r<eliya-revision>
        Example: 25.0.4+7-r1

    Three projections are needed across the four ADR-00029 section 2.3
    packaging exceptions:

        eliyaVersion    - canonical, verbatim. Example: "25.0.4+7-r1".
                          Used for: tarball URLs, GitHub Release tag, DEB
                          filename, banner sample, java.runtime.version.

        eliyaVnum       - VNUM only. Example: "25.0.4".
                          Used for: SDKMAN vendor ID suffix, JSON-LD
                          softwareVersion, java.vendor.version.

        eliyaDockerTag  - drops the upstream-build, keeps r-suffix.
                          Example: "25.0.4-r1".
                          Used for: Docker per-build immutable tag, RPM
                          filename (charset-forced deviations).

    25.0.3 note: the pre-ADR-00029 release used a single flat version
    ("25.0.3"). All three primary tokens below are set equal to "25.0.3"
    so no page rendering changes when this file first ships with the
    three-variable split. When 25.0.4 lands, all three flip together
    (25.0.4+7-r1 / 25.0.4 / 25.0.4-r1) and every page picks up the right
    projection through its variable reference.

    Artefact naming per ADR-00013:
        Release tag  = eliya-jdk-${eliyaVersion}
        Tarball stem = eliya-jdk-${eliyaVersion}-${PLATFORM}
        SDKMAN ID    = ${eliyaVnum}-eliya

    Usage:
        <#include "/macro/release.ftl">
        <p>Latest: ${eliyaVersion}</p>
        <@renderInlineTerminal command=eliyaCurlCommand max_width="100%" />

    Variables exposed (all FTL strings):
        eliyaVersion         canonical version (e.g. "25.0.4+7-r1")
        eliyaVnum            VNUM only (e.g. "25.0.4")
        eliyaDockerTag       Docker/RPM projection (e.g. "25.0.4-r1")
        eliyaSdkmanId        SDKMAN vendor ID (e.g. "25.0.4-eliya",
                             derived from eliyaVnum)
        eliyaReleaseTag      GitHub Release tag
                             (e.g. "eliya-jdk-25.0.4+7-r1")
        eliyaReleaseBase     GitHub Releases base URL up to (not incl.)
                             the tag
        eliyaTagBaseUrl      base URL through the release tag
        eliyaLinuxX64Url     direct tarball URL (linux-x64)
        eliyaShaUrl          SHA256SUMS.txt URL
        eliyaShaAscUrl       SHA256SUMS.txt.asc URL (signed)
        eliyaCurlCommand     copy-paste-ready curl invocation
-->

<#-- Primary version tokens: update these three together on each release. -->
<#assign eliyaVersion        = "25.0.3">
<#assign eliyaVnum           = "25.0.3">
<#assign eliyaDockerTag      = "25.0.3">

<#-- Derived variables. Do not edit; they compose from the primary tokens. -->
<#assign eliyaSdkmanId       = "${eliyaVnum}-eliya">
<#assign eliyaReleaseTag     = "eliya-jdk-${eliyaVersion}">
<#assign eliyaReleaseBase    = "https://github.com/asymmsystems/eliya-jdk/releases/download">
<#assign eliyaTagBaseUrl     = "${eliyaReleaseBase}/${eliyaReleaseTag}">
<#assign eliyaLinuxX64Url    = "${eliyaTagBaseUrl}/eliya-jdk-${eliyaVersion}-linux-x64.tar.gz">
<#assign eliyaShaUrl         = "${eliyaTagBaseUrl}/SHA256SUMS.txt">
<#assign eliyaShaAscUrl      = "${eliyaTagBaseUrl}/SHA256SUMS.txt.asc">
<#assign eliyaCurlCommand    = "curl -LO ${eliyaLinuxX64Url}">
