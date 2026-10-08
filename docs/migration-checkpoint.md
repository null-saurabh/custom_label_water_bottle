# Recovery checkpoint — 2026-10-08

## User's final scope
Preserve the original UI, inquiry functionality and ALL original business/contact details, even placeholders. Remove only the unused Admin page. Build HTML/CSS marketing pages; keep production available. Prepare a preview and updated PR before the final production merge/deployment. Do not touch the separate CRM or customer records.

## Completed
- Existing PR branch `codex/ai-readable-html`, PR #1 against `master`.
- Semantic HTML Home and Contact with original assets, self-hosted Inter/Playfair fonts, exact contact details and map target.
- Original Flutter inquiry form retained. Original contact form widget embedded at internal `/contact-form` with noindex metadata.
- No changes to either form implementation, Firestore service, model or collection.
- Removed Admin source/route; Hosting redirects `/admin` and descendants home. Legacy hash bookmarks handled.
- Added Hosting-only config, reproducible assembly/build, local preview server, static checks and local form/schema tests.
- Flutter release build passed.
- Three Flutter form/schema tests passed; no inquiries submitted.
- Static metadata/assets/links/contact parity checks passed.
- Legacy hash-link tests passed.
- Local HTTP: Home/Contact/Inquiry 200; Admin 301 to Home; unknown route 404.
- Compared production and local desktop homepage at 1280px; closely matching.
- Compared production and local mobile Home/Contact at 390px; corrected title wrapping and contact spacing. Inquiry renders at mobile width.

## Still required before release
- Finish desktop Contact and Inquiry comparison and complete browser navigation/back/deep-link checks.
- Verify JavaScript-disabled rendering in a browser (not yet done); capture final desktop/mobile screenshots.
- Verify contact form validation in browser (local widget tests already pass), without creating records.
- Check 320px/tablet widths for overflow.
- Review final diff, improve formatting if needed, and rerun checks affected by any edits.
- Deploy Firebase preview channel only, verify real Hosting routes/headers/content, capture preview URL/version.
- Update PR title/body around final scope and attach verification evidence.
- Re-read production release reference before final release; do not merge or deploy live in this execution chat.

## Commands / locations
Repository: `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle`
Flutter: `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter`

```sh
python3 scripts/build_site.py --flutter /Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter
python3 scripts/build_site.py --assemble-only # only for HTML/CSS-only changes after Dart build
python3 scripts/check_site.py
node scripts/check_legacy_links.cjs
/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter --no-version-check test --no-pub test/migration_forms_test.dart
python3 scripts/serve_site.py --port 8080
```

Local server was running on http://127.0.0.1:8080 (exec session 29464); verify before restarting. Browser testing uses `mcp__cua_repl` only. Browser handles may not survive a usage interruption; reconnect through documented APIs. Reset the temporary 390×844 viewport when finished. Current in-app-browser preview tab is 2, production reference tab is 1.

Existing production version: `projects/custom-label-bottle/sites/custom-label-bottle/versions/1d3468f820f8ce2c`; release `1768839261178000`, timestamp `2026-01-19T16:14:21.178Z`. Full CLI channel output is ignored at `work/hosting-channels-before.json`. Roll back through Firebase Hosting release history if needed. Only project/site `custom-label-bottle` is in scope.

Firebase CLI authentication worked. `hosting:channel:list` requires this repository's firebase.json. A custom internal-API release read returned 403; the supported CLI command succeeded and supplied the reference above. Build requires sandbox escalation for Flutter's local cache/telemetry state; local HTTP serving/network calls also needed normal escalation. Do not print or read authentication tokens.

No Firebase preview deployment or production change has occurred. PR metadata has not yet been rewritten. First code checkpoint: `ecc7495`.
