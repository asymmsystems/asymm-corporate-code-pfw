#!/bin/sh
# clean-urls.sh — Production-only clean URL transform for Cloudflare Pages
#
# Strips .html from all internal href links in generated HTML files.
# Cloudflare Pages natively serves /page -> page.html, so no directory
# restructuring is needed.
#
# Source files keep .html in hrefs so jbake:inline dev server works as-is.
# This script runs only when the "production" Maven profile is active:
#   ./mvnw -Pproduction clean process-resources
# Default builds (./mvnw clean process-resources, no profile) keep .html so
# target/site/ is browsable with a plain local file server.
#
# Usage: ./scripts/clean-urls.sh [output-dir]
#   Default output-dir: target/site

set -e

SITE_DIR="${1:-target/site}"

if [ ! -d "$SITE_DIR" ]; then
    echo "Error: Site directory '$SITE_DIR' not found. Run jbake:generate first."
    exit 1
fi

echo "=== Clean URLs: stripping .html from href links ==="
find "$SITE_DIR" -name '*.html' -exec \
    sed -i 's|href="\(/[^"]*\)\.html"|href="\1"|g' {} +

# Cache-bust CSS/JS. Cloudflare serves these with max-age=14400, and the asset
# URLs never changed, so a returning visitor kept the stale stylesheet for four
# hours after a deploy. Stamp each reference with a short hash of the asset's
# own contents: the URL only changes when the asset does, so caching still
# works but a changed asset is fetched immediately.
echo "=== Cache-bust: stamping asset hashes onto css/js references ==="
for asset in $(cd "$SITE_DIR" && find css js -type f \( -name '*.css' -o -name '*.js' \) 2>/dev/null); do
    hash=$(md5sum "$SITE_DIR/$asset" | cut -c1-8)
    # Escape dots so the pattern matches the literal filename only.
    pattern=$(printf '%s' "$asset" | sed 's/\./\\./g')
    # Matches any prefix (rootpath-relative links like ../../css/style.css too).
    # Already-stamped refs end in ?v=..., so re-running is a no-op.
    find "$SITE_DIR" -name '*.html' -exec \
        sed -i "s|${pattern}\"|${asset}?v=${hash}\"|g" {} +
    echo "    ${asset} -> ?v=${hash}"
done
echo "=== Done ==="
