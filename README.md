# asymm.systems

Corporate website for **Asymm Systems (Pvt) Ltd**. Static site generated with JBake, deployed to
Cloudflare Pages.

Includes the Eliya JDK microsite at `/product/eliya/*` (per
[microsite-strategy.md](../../../product/microsite-strategy.md)) and Asymm Research articles at
`/research/*`.

## Prerequisites

- Java 25+
- Maven 3.9+ (a Maven Wrapper `mvnw` is included; no system Maven required)

## Build

Generate the static site (CSS minification + HTML compression). Internal hrefs keep `.html` so
`target/site/` is browsable directly with any plain local file server:

```bash
./mvnw clean process-resources
```

Production build: same pipeline plus `clean-urls.sh` (strips `.html` from internal hrefs for
Cloudflare Pages, which serves `/page` → `page.html` natively):

```bash
./mvnw -Pproduction clean process-resources
```

CI workflows (preview / production / validate) all activate `-Pproduction`. Output is always
written to `target/site/`.

For a quick unoptimised build (JBake only — skips minify / compress / clean-urls):

```bash
./mvnw jbake:generate
```

## Serve Locally

Run a local dev server with live reload:

```bash
./mvnw jbake:inline -Djbake.port=8020
```

Then open <http://localhost:8020> in the browser. Source files keep `.html` in hrefs so the dev
server resolves them as-is. If you build with `./mvnw clean process-resources` (no profile) and
serve `target/site/` via any static file server, links also work because `.html` is preserved by
default. Only `-Pproduction` strips `.html`.

## Repository Layout

```
asymm-corporate-code-pfw/
├── pom.xml                              Maven build orchestration (jbake + minify + htmlcompressor + clean-urls)
├── mvnw, .mvn/                          Maven Wrapper
├── scripts/
│   └── clean-urls.sh                    Strips .html from internal hrefs (production only)
├── src/main/jbake/
│   ├── jbake.properties                 Site-wide config + template overrides
│   ├── content/                         Page sources (HTML/Markdown with frontmatter)
│   │   ├── index.html, about.html, ...  Top-level pages
│   │   ├── product/                     Eliya microsite + Dial overview
│   │   ├── research/                    Asymm Research articles
│   │   └── news/                        News items
│   ├── templates/                       FreeMarker templates
│   │   ├── header.ftl, menu.ftl, brand.ftl
│   │   ├── home.ftl, page.ftl, news.ftl, product.ftl, research.ftl, newsitem.ftl
│   └── assets/
│       ├── css/style.css                Single source-of-truth stylesheet
│       ├── images/                      Logos, OG images, illustrations
│       └── js/                          Page-level JS
└── .github/workflows/
    ├── preview.yml                      develop branch → preview deploy
    ├── production.yml                   v* tag       → production deploy
    └── validate.yml                     PRs to develop/main → build verification
```

## Adding Content

### A new top-level page

Create `src/main/jbake/content/<slug>.html` with frontmatter:

```html
title=Page Title
description=Short description for search/OG
type=page
status=published
~~~~~~

<header class="page-header">
    <span class="section-kicker">Asymm</span>
    <h1>Page Title</h1>
</header>

<section style="margin-bottom: 5rem;">
    ...
</section>
```

### A new research article (with right-side ToC)

```html
title=Article Title
description=...
type=page
toc=true
status=published
~~~~~~

<header class="page-header">...</header>
<section>...</section>
```

`toc=true` enables the auto-generated right-side ToC component in `templates/page.ftl`.

### A new Eliya sub-page (with breadcrumb)

Create under `src/main/jbake/content/product/eliya/<slug>.html`. Include a breadcrumb at the top of
the body following the existing pattern (see `product/eliya/downloads.html` for the canonical
example). Update `product/eliya/user-guide/index.html` if it's a user-guide chapter.

### A news item

Create `src/main/jbake/content/news/YYYY-MM-<slug>.html` with `type=post`.

## Deployment (CI/CD)

CI/CD is via **GitHub Actions + Cloudflare Pages**, following [git-flow](https://nvie.com/posts/a-successful-git-branching-model/).

**Branches:**

- `develop` — integration branch. Push here triggers preview deploy.
- `main` — production. Only tagged releases (`vYYYY.MM.DD`) deploy to production.
- `feature/*` — work branches, merged into `develop` via PR.

**Workflow:**

| Trigger | Workflow | Effect |
|---|---|---|
| Push to `develop` | `preview.yml` | Builds + deploys to `https://develop.asymm-corporate-code-pfw.pages.dev` |
| PR to `develop` or `main` | `validate.yml` | Build verification only (no deploy) |
| Tag `v*` on `main` | `production.yml` | Builds + deploys to `https://asymm.systems` |

**Required GitHub Secrets** (Settings → Secrets and variables → Actions):

- `CLOUDFLARE_ACCOUNT_ID` — from Cloudflare dashboard
- `CLOUDFLARE_API_TOKEN` — Cloudflare API token with `Pages: Edit` permission

## Cutting a Production Release

```bash
# from develop, integration tested, preview deploy verified:
git checkout main
git merge develop --no-ff
git tag v$(date +%Y.%m.%d)
git push origin main --tags
# production.yml fires on the tag push
```

## Theme & Visual System

Single stylesheet at `src/main/jbake/assets/css/style.css`. Key classes:

- **Layout:** `.container`, `.container--wide`, `.page-body`, `.section-intro`
- **Page chrome:** `.page-header`, `.section-kicker`, `.section-title`
- **Eliya microsite:** `.eliya-breadcrumb`, `.page-toc`, `.eliya-terminal-panel`
- **Components:** `.product-feature-card`, `.clinical-table`, `.inline-terminal`,
  `.technical-inset`, `.org-link` (with `--internal` / `--external` / `--inline` modifiers)
- **Brand:** `.ide-status-bar` (global fixed bottom nav)

Link convention: `<a class="org-link org-link--internal">link text</a>`. The `[[`, `]]`, and `→`
are added by CSS pseudo-elements — do **not** include them in link text.

## Related Strategy Documents

- [Microsite strategy](../../../product/microsite-strategy.md) — URL pattern decisions per product
- [Corporate strategy](../../../architecture/asymm-strategy.md) — company positioning & decision log
- [Eliya JDK strategy](../../../../asymm-jdk/product/asymm-jdk-product-strategy.md)
- [Dial strategy](../../../architecture/dial-strategy.md)

---

Copyright © 2026, Asymm Systems (Pvt) Ltd.
