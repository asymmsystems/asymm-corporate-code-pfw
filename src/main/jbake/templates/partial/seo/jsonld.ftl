<#--
  JSON-LD structured data. Included from header.ftl, so pageUri / canonicalUrl /
  metaDescription assigned there are in scope here.

  Emits, by page:
    Organization        every page (sitewide entity)
    WebSite             home only
    SoftwareApplication /product/eliya.html (the Eliya JDK entity)
    TechArticle         registry posts, research projects, /research/* pages

  FAQPage is authored inline on faq.html (co-located with the Q&A markup).
  All dynamic strings pass through ?json_string for valid JSON escaping.
-->
<#-- Organization: sitewide. sameAs fuses the company's controlled profiles into
     one Knowledge-Graph node; add LinkedIn company / Crunchbase / Wikidata (QID)
     / X URLs here as they are created (see delivery/asymm-entity-profiles-pack). -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "${config.site_host}/#organization",
  "name": "Asymm Systems",
  "alternateName": "Asymm",
  "legalName": "Asymm (Pvt) Ltd",
  "url": "${config.site_host}/",
  "logo": "${config.site_host}/images/asymm-mark.png",
  "description": "Asymm Systems builds Organization-as-Code: a framework for expressing an organization's compliance, governance, operational, and functional architecture as code, so conformance is validated at build time rather than discovered at audit time. We call the approach Compliance-by-Compilation. The runtime foundation is Eliya, an OpenJDK 25 LTS distribution for compliance-conscious industries. Dial is the first industry profile, a TMF ODA-native developer ecosystem that makes telecom architecture conform by construction, with similar profiles planned for other regulated industries: financial services, healthcare, and government.",
  "slogan": "Compliance by Compilation",
  "knowsAbout": [
    "Organization-as-Code",
    "Compliance-by-Compilation",
    "OpenJDK",
    "Java Virtual Machine",
    "TMF Open Digital Architecture",
    "regulatory compliance"
  ],
  "foundingDate": "2025",
  "foundingLocation": { "@type": "Place", "name": "Sri Lanka" },
  "founder": {
    "@type": "Person",
    "name": "Fahim Farook",
    "jobTitle": "Founder and Principal Architect",
    "url": "https://fahimfarook.me/",
    "sameAs": [
      "https://github.com/fahimfarookme",
      "https://linkedin.com/in/fahimfarookme",
      "https://www.wikidata.org/wiki/Q140406496"
    ]
  },
  "sameAs": [
    "https://github.com/asymmsystems",
    "https://www.wikidata.org/wiki/Q140406273",
    "https://www.crunchbase.com/organization/asymm-systems",
    "https://x.com/asymmsystems",
    "https://www.youtube.com/@asymmsystems",
    "https://www.linkedin.com/company/asymmsystems"
  ]
}
</script>
<#if pageUri == "">
<#-- WebSite: home only -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "@id": "${config.site_host}/#website",
  "name": "Asymm Systems",
  "url": "${config.site_host}/",
  "publisher": { "@id": "${config.site_host}/#organization" }
}
</script>
</#if>
<#if (content.uri)! == "product/eliya.html">
<#-- SoftwareApplication: the Eliya JDK entity -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "@id": "${config.site_host}/product/eliya#software",
  "name": "Eliya JDK",
  "applicationCategory": "DeveloperApplication",
  "operatingSystem": "Linux x86_64, Linux aarch64",
  "softwareVersion": "${eliyaVnum}",
  "url": "${config.site_host}/product/eliya",
  "downloadUrl": "${config.site_host}/product/eliya/downloads",
  "license": "https://www.gnu.org/licenses/old-licenses/gpl-2.0.html",
  "isBasedOn": "https://openjdk.org/projects/jdk/25/",
  "sameAs": "https://www.wikidata.org/wiki/Q140406475",
  "publisher": { "@id": "${config.site_host}/#organization" },
  "offers": { "@type": "Offer", "price": "0", "priceCurrency": "USD" },
  "description": "Eliya JDK is an OpenJDK 25 LTS distribution from Asymm Systems that places a named policy point inside the JVM, the -XX:EliyaProfile flag, shipping production-evidence and compliance behaviour as defaults instead of leaving them to external wrappers. Built for compliance-conscious industries: telecom, financial services, healthcare, and government; Linux x86_64 and aarch64; GPLv2 with Classpath Exception; signed and reproducible."
}
</script>
</#if>
<#if (content.type)! == "post" || (content.type)! == "project" || ((content.uri)!"")?starts_with("research/")>
<#-- TechArticle: posts, research projects, and research pages -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "${((content.title)!"")?json_string}",
  "description": "${metaDescription?json_string}",
  "url": "${canonicalUrl}",
<#if (content.date)??>
  "datePublished": "${content.date?string('yyyy-MM-dd')}",
</#if>
  "author": {
    "@type": "Person",
    "name": "${((content.author)!'Fahim Farook')?json_string}",
    "jobTitle": "Chief Architect of Eliya"
  },
  "publisher": { "@id": "${config.site_host}/#organization" },
  "mainEntityOfPage": "${canonicalUrl}"
}
</script>
</#if>
