<#--
    release.ftl - single source of truth for Eliya release coordinates.

    Update `eliyaVersion` on each Eliya CPU release. All pages that reference
    the latest GA download URL pull from here, so one edit per quarter
    propagates everywhere. See asymm-jdk/task/wire-release-url-property.md
    for the full update procedure (also covers checksum/signature URLs).

    Artefact naming per ADR-00013 (asymm-jdk repo):
        - Release tag  = eliya-jdk-${VERSION}                 (path component in URL)
        - Tarball stem = eliya-jdk-${VERSION}-${PLATFORM}
        - SDKman ID    = ${VERSION}-eliya                     (used by `sdk install java ...`)

    Usage:
        <#include "/macro/release.ftl">
        <p>Latest: ${eliyaVersion}</p>
        <@renderInlineTerminal command=eliyaCurlCommand max_width="100%" />

    Variables exposed (all FTL strings):
        eliyaVersion         - semver (e.g. "25.0.3")
        eliyaSdkmanId        - SDKman vendor ID (e.g. "25.0.3-eliya")
        eliyaReleaseTag      - GitHub Release tag (e.g. "eliya-jdk-25.0.3")
        eliyaReleaseBase     - GitHub Releases base URL up to (not incl.) the tag
        eliyaTagBaseUrl      - base URL through the release tag
        eliyaLinuxX64Url     - direct tarball URL (linux-x64)
        eliyaShaUrl          - SHA256SUMS.txt URL
        eliyaShaAscUrl       - SHA256SUMS.txt.asc URL (signed)
        eliyaCurlCommand     - copy-paste-ready curl invocation
-->

<#assign eliyaVersion        = "25.0.3">
<#assign eliyaSdkmanId       = "${eliyaVersion}-eliya">
<#assign eliyaReleaseTag     = "eliya-jdk-${eliyaVersion}">
<#assign eliyaReleaseBase    = "https://github.com/asymmsystems/eliya-jdk/releases/download">
<#assign eliyaTagBaseUrl     = "${eliyaReleaseBase}/${eliyaReleaseTag}">
<#assign eliyaLinuxX64Url    = "${eliyaTagBaseUrl}/eliya-jdk-${eliyaVersion}-linux-x64.tar.gz">
<#assign eliyaShaUrl         = "${eliyaTagBaseUrl}/SHA256SUMS.txt">
<#assign eliyaShaAscUrl      = "${eliyaTagBaseUrl}/SHA256SUMS.txt.asc">
<#assign eliyaCurlCommand    = "curl -LO ${eliyaLinuxX64Url}">
