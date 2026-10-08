# Quota pause checkpoint — 2026-10-09

Work is paused at the user's request to conserve quota. No implementation changes were made after the previous checkpoint. Repository status was verified clean at commit `18504630c2cd7f7b8e01e170eb5c0b32e72c6692` before writing this checkpoint.

Repository: `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle`
Branch: `codex/ai-readable-html`
Existing PR: https://github.com/null-saurabh/custom_label_water_bottle/pull/1

The full HTML implementation and prior validation are saved. Remaining work is browser comparison and navigation/cache/no-script verification, final documentation and checks, Firebase preview deployment, and PR update. Production has not been deployed or merged. No preview deployment has been completed. Previous test results below are historical; no new tests were run during this pause.

Resume from the remaining-work list below. Rediscover browser handles and check local server availability before using them. Do not reinstall Flutter or restart the migration. Do not submit real inquiries, touch the CRM, merge, or deploy production. The next work should finish the outstanding verification and prepare a reviewable preview.

---

# Full HTML recovery checkpoint — 2026-10-08

Read this before the older handoff: it updates the intermediate hybrid state described in `ai-website-handoff.md`.

## Current implementation
- All three public pages (Home, Contact, Inquiry) are now conventional HTML/CSS, including both actual forms. No iframe or Flutter runtime is copied into `build/site`.
- Original form fields, options (including `5x00 packs`), optional business type/email behavior, validation messages, trimming, success/failure copy, contact reset and inquiry retention are implemented in `marketing/js/`.
- Firebase adapter uses the official Firebase 13.0.0 browser SDK, Firestore Lite, the existing public config, `enquiries` collection and `createdAt: serverTimestamp()`. No new backend, rules changes or CRM work.
- Pure payload/controller/adapter modules permit tests without real records. The loopback mock server intercepts `/js/forms.js` with `scripts/mock-preview.mjs`, posting only to its own local mock endpoint. This adapter is not packaged into Hosting.
- Admin remains removed. Clean URLs and legacy hash routing remain. `/contact-form` now redirects to `/contact#message-form`. The worker retirement script clears only Flutter's named caches and refreshes old controlled windows; actual returning-worker browser behavior still needs testing.
- Dart source is retained as the parity reference; hybrid-only Dart routing/dependency changes were reverted. The static website build no longer needs Flutter.
- New build: `npm run build`; old `python3 scripts/build_site.py` delegates to it. `--assemble-only`/`--flutter` are no longer required.
- Firebase's transitive Node gRPC dependency was flagged by npm audit, so a compatible-major override pins `@grpc/grpc-js` to 1.14.6. `npm audit --omit=dev` then reported 0 vulnerabilities. The public site is a browser bundle, not a Node server.

## Verified in this phase
- Clean starting HEAD was `679e82174309a1eedc9cf2e731b67ac60ab3d927`.
- New implementation checkpoint `dc752e4` contains the full HTML forms and blueprint.
- Static build passed; initial HTML contains actual forms, and there is no `main.dart.js`/Flutter bootstrap/iframe in deployed pages.
- Seven Node tests passed: payload/schema, contact mapping, original validation, real DOM controller pending/success/failure/retry/duplicate suppression for both forms, option parity, Firebase target/timestamp contract. Tests use JSDOM/fake adapters with no network.
- Legacy route unit tests and static HTML/link/asset/contact parity checks passed. Original Dart reference forms/service/model still match their baseline.
- Browser tests on loopback mock port 8081: Contact empty validation, success/reset, failure; Inquiry empty validation, success/retention, failure all observed. No production records submitted.
- Desktop Inquiry and Contact compared visually against live production. Fields/heights and column widths were adjusted. Typography/native controls have small rendering differences; do not claim pixel identity.
- Captured new Home/Contact/Inquiry at widths 1280, 768, 390, 320 (844px viewport height). No horizontal page overflow measured. Initial matrix transiently reported one lazy-loaded Home icon as incomplete at 768; repeat inspection after loading showed no broken images.
- Screenshots saved in `/Users/saurav/Documents/Codex/2026-10-08/custom-label-bottle-html/outputs/verification/`. Includes full-page new screenshots, desktop original references and responsive-results.json. The JSON still contains the initial transient image observation; do not treat it as final failure or silently claim it never happened.
- Viewed the new mobile Contact, tablet Inquiry and small-phone Home screenshots. Original small-phone/tablet comparison matrix is NOT complete.
- Revalidated Firebase CLI login and Hosting project/site `custom-label-bottle`; PR #1 open/mergeable, base master, prior head 679e821. Production still at version `1d3468f820f8ce2c`, release `1768839261178000` (2026-01-19T16:14:21.178Z). CLI output in ignored `work/hosting-channels-resume.json`.

## Remaining work — do not skip
1. Finish all visual comparisons against original, especially 320px/tablet and lower-page sections. At 320px hero artwork and copy overlap as in the original design; assess legibility while respecting visual parity. Compare fonts/native controls and document differences.
2. Finish no-JavaScript execution verification. A loopback server at port 8082 uses CSP `script-src 'none'` to block all page scripts, but the pages have NOT yet been inspected there. The available in-app browser advertised viewport/visibility only, not a global JS toggle. CSP blocking is a useful actual-rendering test, but report accurately that it is not the browser's global JS-disabled setting. Fields remain HTML; initially-disabled send buttons and help copy prevent accidental no-JS submission.
3. Complete browser navigation/back/refresh/deep links, retired routes, keyboard and returning cached-worker checks. Test server status/headers and bundle asset paths; improve edge cases if found.
4. Review final diff, update stale hybrid docs/readme and test descriptions, run final build/tests after edits. Consider stronger adapter mock coverage and bottle-selection ordering parity if needed.
5. Deploy Firebase PREVIEW ONLY after checks; verify actual HTTP status/redirects/content/assets/canonical/robots/sitemap/headers, save version/URL/expiry and screenshots. No preview has been deployed yet.
6. Update existing PR title/body from obsolete metadata-only scope. Present concrete evidence and READY FOR PRODUCTION REVIEW to coordinator. Do not merge or deploy production here. Revalidate rollback reference before any later approved production deployment.

## Resume commands

```sh
cd /Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle
git status --short --branch
npm run build
npm test
python3 scripts/serve_site.py --port 8081 --mock
python3 scripts/serve_site.py --port 8082 --no-scripts
```

The two servers were already started (exec sessions 52561 and 5755); inspect port availability before restarting. Old server 8080 may also exist. Ports bind only loopback. Current browser handles: `original` tab 3 and `current` tab 4; globals may not survive a reset. Last `current` navigation was production `https://sauravcloud.online/#/` at 390px. A batched original-reference capture stopped because the Flutter “Home” accessibility button was not ready; it did NOT finish that matrix. Inspect current state and enable accessibility through the supported UI if needed. Do not repeat timed-out selectors blindly.

Current browser control is `mcp__cua_repl`. Screenshots were saved using its screenshot API plus filesystem writes. A temporary viewport override may remain; reset it at handoff. Discover supported APIs if handles are gone. Do not claim source checks are visual checks.

User constraints remain: preserve original content/contact placeholders/UI/assets; remove only unused Admin; full actual public presentation must be HTML, not metadata/fallback summaries; never touch separate CRM or customer records; commit recoverable checkpoints, normal pushes, preview before production, production last after review.
