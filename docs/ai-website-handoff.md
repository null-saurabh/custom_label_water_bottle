# Full HTML website handoff — 2026-10-09

This current handoff supersedes the earlier hybrid architecture. Read [migration-checkpoint.md](migration-checkpoint.md) and [html-migration.md](html-migration.md) for current implementation/evidence. The public website and both forms are already conventional HTML/CSS; do not restart migration or install Flutter for the public build.

## Scope and constraints

The owner wants the whole actual public UI, images, layout and content directly inspectable as HTML, beyond metadata or fallback summaries. Preserve original design/content/assets/contact placeholders and form behavior. Remove only unused Admin. No architecture guarantees every AI crawler's rendering or Anthropic approval; do not invent business/AI claims.

Repository: `null-saurabh/custom_label_water_bottle`; PR https://github.com/null-saurabh/custom_label_water_bottle/pull/1; base `master`; branch `codex/ai-readable-html`. Existing checkout: `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle`. Inspect current status/history and instructions; preserve subsequent edits and use normal pushes. Current execution used the explicitly requested 6.1 Sol medium.

Only public Home, Contact, Inquiry and Firebase Hosting project/site `custom-label-bottle` are in scope. Production https://sauravcloud.online/ remains pending final owner preview approval. **Never target `custom-label-bottle-crm`, read customer records, submit real test enquiries, or deploy Firestore/rules/Storage.** Preview forms still use production DB.

Exact original details: `+91 8112552320`, `tel:+918112552320`, `support@yourwater.com`, `mailto:support@yourwater.com`, `123, Business Complex, Bengaluru, India`, map `https://www.google.com/maps/search/?api=1&query=Patna%2C%20India`, Monday–Friday 9 AM – 6 PM (IST), 2024 contact copyright. The map/address discrepancy and placeholders are intentionally retained. No WhatsApp URL was found; do not infer one. Social icons have no original destinations.

Both forms write `enquiries` with `businessName, contactName, phone, email, businessType, monthlyQuantity, bottleSizes, city, state, deliveryLocation, notes, status='new', createdAt=serverTimestamp()`. Contact name maps to businessName; unrelated fields remain empty. Preserve optional fields, original options (including `5x00 packs`), trim, validation messages, failure/success copy, Contact reset, Inquiry retention and bottle-size selection order.

## Current architecture and verification

`marketing/*.html` + `site.css` render all real UI; `marketing/js/` handles forms and the official Firebase SDK adapter. Original assets/self-hosted licensed fonts are copied; no generated replacements. `npm run build` generates `build/site` without iframe or Flutter bootstrap. Dart remains the parity reference. Admin alone is removed from the Dart router/source.

`site.js` handles legacy hashes and old worker caches. The retirement worker ships at `/flutter_service_worker.js`, removes only the three Flutter caches, unregisters and navigates old controlled windows. Clean routes and old Admin/internal form redirects are in Hosting config; unknown routes are 404.

Build + nine fake-adapter/DOM tests + static + legacy checks pass. Responsive screenshots, actual script-blocked rendering, navigation/history/deep links, safe local form success/failure and a returning-cache update fixture were checked. See current checkpoint for differences and precise limits. Visual fidelity is close, not pixel identity. Small-phone hero overlap from original is retained. Global JS-disable capability was unavailable; CSP script blocking was inspected accurately instead.

## Tools and resumption

```sh
npm run build
npm test
python3 scripts/serve_site.py --port 8081 --mock
python3 scripts/serve_site.py --port 8082 --no-scripts
```

Check existing ports first. Mock server never forwards payloads to Firebase. `work/cache-server.py` is an ignored isolated cache test fixture, not deployed. Browser controls use documented `mcp__cua_repl`; rediscover tabs/capabilities and verify actual viewport sizes. Numeric handles from older notes are stale. Reset temporary viewport at the end. Screenshots are review artifacts in this chat's outputs folder.

Firebase CLI uses existing login via `/opt/homebrew/bin/npx -y firebase-tools@latest`. Verify access using supported login/channel reads, never print credentials. Preview command: `hosting:channel:deploy html-review --project custom-label-bottle --expires 7d --no-authorized-domains`. This deploys Hosting preview only and avoids unrelated Auth-domain changes. Capture URL/version/expiry and verify hosted HTTP + browser rendering before reporting ready.

Production rollback currently remains release `1768839261178000`, version `1d3468f820f8ce2c`, January 19, 2026. Refresh immediately before any approved production release. Production is LAST after concrete owner preview review, never inferred from this handoff. Restore through Hosting release history if required; a Git revert is not Hosting rollback.
