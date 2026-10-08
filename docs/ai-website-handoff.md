# Website migration handoff for Codex in VS Code

Updated 2026-10-08 (India time). This document is self-contained for a new session/account. Read it before modifying files. It records unfinished work, not a completed migration or release approval.

## 1. The actual goal and acceptance boundary

The owner supplies custom-labelled drinking-water bottles to restaurants, hotels and food businesses. Labels carry clients' names, logos and contact information. The owner wants AI/browser tools to inspect the **actual whole public website: its real UI, images, layout and meaningful HTML content**, while checking the business for a Claude startup-benefits application.

This is **not** a request merely to add metadata, hidden text or a `noscript` summary. Standard HTML/CSS should expose the real public presentation directly. Flutter is not universally invisible to AI: JavaScript-capable browsers can render it (the previous executor inspected production that way), but raw HTML fetchers received very little business content. No architecture guarantees access, rendering or screenshots for every AI tool, and no website change guarantees Anthropic approval. Do not invent AI features, testimonials, business claims or application outcomes.

**The existing hybrid implementation is an intermediate state.** It gives Home and Contact business information real HTML, but the Inquiry UI is still Flutter and Contact embeds a Flutter form. That was the earlier smallest-change proposal. The user's clarified ultimate goal covers the whole public presentation. The next executor must assess whether those remaining Flutter surfaces prevent full-site machine readability/visual inspection and, if so, migrate their actual rendered UI to conventional HTML while preserving the same behavior and data contract. Do not declare the full goal met by the current inquiry/contact-form fallback summaries. Rendering a real form in HTML is separate from whether its submission needs JavaScript; no new server endpoint or backend is automatically authorized or required.

## 2. User constraints — retain these across sessions

- Keep the original UI, design, imagery, content, inquiry behavior and **all original business/contact details**, even entries that look like placeholders. Do not ask for replacement contact information or silently correct it.
- Remove only the unused Admin placeholder. It had an `Admin Panel` heading; its Firestore listing was commented out. Do not build an admin backend.
- Originally four router pages: Home, Inquiry, Contact, Admin. There should now be three public business pages. `/contact-form` is an internal implementation view, not a fourth business page.
- Preserve historical hash links and direct/deep links appropriately; retired Admin URLs should resolve sensibly.
- Preserve genuine working order/inquiry, telephone, email and map links. Do not infer a WhatsApp number: the business uses WhatsApp according to the owner, but no WhatsApp URL was found in this repository.
- The separate CRM repository/project is completely out of scope.
- Do not submit real test inquiries, read customer records for this redesign or alter production business records. Use local validation, mocks or appropriately isolated emulation.
- Keep production available. Build and meaningful verification come first, save recoverable commits, show a concrete preview, and make production deployment the **last** step after the owner reviews the result. No production release is authorized by this handoff.
- The user prefers **Astra for coding**. Use it if the new account/session offers it; do not claim model selection that the environment does not support.

## 3. Repository, branch and current state

| Item | Value |
| --- | --- |
| Repository | [null-saurabh/custom_label_water_bottle](https://github.com/null-saurabh/custom_label_water_bottle) |
| Existing PR | [#1](https://github.com/null-saurabh/custom_label_water_bottle/pull/1) |
| PR base | `master` — full Flutter source; `main` contains only a README |
| PR head branch | `codex/ai-readable-html` |
| Local checkout | `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle` |
| Last implementation/validation checkpoint | `4afd2dbb4513ed8723bcd3618c6ac10efe0e2967` |
| Earlier implementation checkpoint | `ecc7495` — HTML marketing pages with retained Flutter forms |
| Earlier metadata-only PR head | `57d26657d19ea80a0c79b356e45e456ce27964a1` |

At the start of this documentation task, local HEAD and its remote tracking branch were `4afd2dbb4513ed8723bcd3618c6ac10efe0e2967`, with a clean working tree. This handoff is committed after that checkpoint. Inspect actual status/history and remote state again before resuming; preserve any subsequent user or concurrent edits. Use normal pushes, not destructive force-pushes.

At the last checkpoint the PR was unmerged, the production website unchanged, and no Firebase preview channel had been deployed. Its title/body still described the earlier metadata/fallback work and need rewriting around the final implementation. The previously checked PR was open and mergeable; that is not a fresh remote-state guarantee.

Earlier notes remain in [migration-checkpoint.md](migration-checkpoint.md) and [html-migration.md](html-migration.md). This document's whole-site acceptance boundary supersedes the narrower hybrid completion assumption in those notes. Their descriptions of JavaScript-disabled behavior express the intended implementation; **browser verification with JavaScript disabled was not completed**.

## 4. Business and hosting facts

- Live domain: <https://sauravcloud.online/>
- Firebase project display name: **Custom Label Bottle**.
- Firebase project ID and Hosting site ID: **`custom-label-bottle`**.
- Default domains: <https://custom-label-bottle.web.app/> and <https://custom-label-bottle.firebaseapp.com/>.
- **Never target `custom-label-bottle-crm`.** That is the separate CRM project.
- The recorded production version dates to January 2026.
- Current production uses a catch-all Hosting rewrite to `/index.html` and Flutter hash routes such as `/#/contact` and `/#/inquiry`.

The owner explicitly requested retaining these exact original details:

| UI/content | Existing value or destination |
| --- | --- |
| Phone | `+91 8112552320` / `tel:+918112552320` |
| Email | `support@yourwater.com` / `mailto:support@yourwater.com` |
| Displayed address | `123, Business Complex, Bengaluru, India` |
| Map destination | `https://www.google.com/maps/search/?api=1&query=Patna%2C%20India` |
| Availability | Monday–Friday, 9 AM – 6 PM (IST) |
| Contact footer | `2024 Custom Label Water Bottles. All rights reserved.` |

The email/address appear to be placeholders and the map destination differs from the displayed address. This discrepancy was discussed; the user's final instruction was to keep them. Do not treat the discrepancy as permission to replace them. Existing social icons have no actual destination URLs and remain decorative.

## 5. What is implemented

| Path | Purpose/current behavior |
| --- | --- |
| `marketing/index.html` | Semantic Home document: original hero, bottle samples, benefits, trust strip and lifestyle CTA |
| `marketing/contact.html` | Semantic contact information and original links; iframe pointing to `/contact-form`; no-script phone/email alternative |
| `marketing/site.css` | Original blue/white presentation and responsive layouts; source breakpoint at 950px |
| `marketing/fonts/` | Self-hosted Inter 400/500/600/700 and Playfair Display 600/700, CSS and OFL licenses |
| `assets/bottles/`, `assets/icons/`, `assets/images/` | Original assets, reused and copied into output `media/`; no AI-generated replacements |
| `marketing/site.js` | Known legacy hash-route migration; retirement of only the old Flutter service worker and its named caches |
| `marketing/robots.txt`, `sitemap.xml`, `404.html` | Indexability, three public canonical routes and a genuine missing-page document |
| `web/index.html` | Flutter form shell; assembly substitutes route-specific metadata and initial fallback content |
| `lib/main.dart` | Enables Flutter path URL strategy |
| `lib/core/router.dart` | Retains inquiry and original Flutter Home/Contact components; adds internal contact-form widget view; Admin removed |
| `lib/widgets/site_header.dart` | Web Home/Contact navigation opens real HTML documents; native routing retained |
| `lib/web pages/admin_homepage.dart` | Deleted unused placeholder |
| `config/firebase-web.json` | Public web client identifiers for `custom-label-bottle`; not account credentials |
| `scripts/build_site.py` | Flutter release build plus static assembly into `build/site` |
| `scripts/serve_site.py` | Local clean-URL preview and Admin redirect |
| `firebase.json` | Only Hosting configuration, pinned to `custom-label-bottle`; clean URLs, Admin redirects and cache/noindex headers |

The original inactive “View Sample Bottles” button now links to the on-page samples section. This is a small behavior improvement already in the checkpoint; include it in the final review against the owner's parity constraint. Browser font metrics and HTML rendering can differ slightly from Flutter, so describe fidelity honestly rather than claiming pixel identity.

Inquiry and contact-form implementations, their service and their model were byte-for-byte unchanged at checkpoint. The inquiry subtree is `lib/web pages/inquiry_screen/`; contact widget is `lib/web pages/contact_us_screen/widgets/contact_hero_left/widgets/contact_form_card.dart`.

The shared service `lib/services/enquiry_service.dart` calls `FirebaseFirestore.instance.collection('enquiries').add(data.toMap())`. The collection is **`enquiries`**, not the commented-out admin example's `inquiries`. The model `lib/models/enquiry_form_model.dart` writes:

```text
businessName, contactName, phone, email, businessType, monthlyQuantity,
bottleSizes (list), city, state, deliveryLocation, notes,
status = 'new', createdAt = Firestore server timestamp
```

The contact form maps the name to `businessName`; unrelated business/delivery fields remain empty and bottle sizes remain an empty list. Preserve this contract, validation, success/failure messaging and field behavior if migrating the form UI. Do not silently “improve” the schema or redirect submissions to another project. Firestore rules, Storage and CRM were not changed or deployed.

## 6. Evidence already obtained and its limits

These checks ran before this documentation-only task; they were not rerun merely to write the handoff.

- Flutter web release build succeeded using the existing local SDK.
- `python3 scripts/check_site.py` passed: semantic structure, canonical/viewport metadata, referenced local assets/links, exact contact details, unchanged form/service/model source against `57d2665`, Admin removal and Hosting-only scope.
- `node scripts/check_legacy_links.cjs` passed: Home/Contact/Inquiry/Admin hash bookmarks, query preservation, ordinary anchors and same-origin destination handling.
- `node --check marketing/site.js` and `git diff --check` passed.
- `flutter test --no-pub test/migration_forms_test.dart`: **three tests passed** — payload/schema/server timestamp; contact missing/invalid fields; inquiry empty submission rejected before Firestore. No valid submission was sent.
- Local GET responses: `/`, `/contact`, `/inquiry` returned 200; `/admin` returned 301 to Home; an unknown route returned 404. These were local-server checks, not Firebase preview verification.
- Visually compared production and local **Home at 1280px desktop width**. The layout closely matched, with minor font/rendering differences.
- Visually compared **Home and Contact at 390×844**. Corrected heading wrapping and contact spacing. The original embedded contact form loaded; mobile Inquiry also rendered. This was not a complete end-to-end form/browser audit.
- The live Flutter site initially showed blank while loading, then rendered; do not describe the initial observation as proof that it cannot be inspected.

Not yet completed: desktop Contact/Inquiry comparisons; 320px/tablet overflow checks; complete browser navigation/back/refresh/deep-link tests; actual JavaScript-disabled browser checks; browser form validation; final screenshots saved as review artifacts; Firebase preview deployment, HTTP/header validation and production release. One browser log showed a `MutationObserver.observe` error without a source URL while the embedded form rendered; its origin was not established. Recheck actual functionality/logs rather than assuming it is either an application defect or harmless tooling noise.

The earlier session reset its temporary viewport before ending and marked its tabs for handoff. Numeric tab handles and exec session IDs in older notes are not reliable continuation identifiers. There are no final screenshot deliverables to assume are available.

## 7. Same-Mac environment and efficient resumption

Use **local execution on this same Mac** in the existing checkout/branch, not a cloud environment that lacks the SDK and Firebase login. A different ChatGPT account has separate conversation context and may expose different tools, models or permissions.

- Flutter SDK: `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter`.
- Node/npm/npx: `/opt/homebrew/bin`; Node 24 LTS was available.
- Python 3 was available (`python3`).
- Firebase CLI worked through `/opt/homebrew/bin/npx -y firebase-tools@latest`.
- Firebase login and project access were verified on this Mac. A Firebase MCP registration/local configuration also existed, but was not relied upon for execution. **Verify access in the new VS Code session**; do not assume account-connected MCP tools transfer.
- Use supported read-only CLI checks such as `firebase login:list`, `projects:list --json`, and `hosting:channel:list --project custom-label-bottle --json` as needed. `hosting:channel:list` required a directory containing `firebase.json`.
- A custom internal Firebase API read returned 403; the supported authenticated CLI succeeded. Prefer the CLI rather than repeating that internal helper.
- Never print/copy refresh tokens, credential files, service-account keys, passwords or auth codes. Use the existing login; if reauthentication is necessary, let the user complete the normal flow.
- The former sandbox required normal escalation for network, local serving and Flutter cache/telemetry state. Follow the current environment's approvals; don't work around permission failures.

Start with status and applicable `AGENTS.md` discovery. No applicable repository instructions were found in the previous inspection, but verify anew. Do not reclone or reinstall the SDK unnecessarily.

```sh
cd /Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle
git status --short --branch
git log -5 --oneline

python3 scripts/build_site.py --flutter /Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter
python3 scripts/check_site.py
/opt/homebrew/bin/node scripts/check_legacy_links.cjs
/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/flutter_sdk/bin/flutter --no-version-check test --no-pub test/migration_forms_test.dart
python3 scripts/serve_site.py --port 8080
```

Check whether port 8080 is already serving this checkout before starting another process. The former server may have stopped. Re-discover supported browser tools in VS Code, including screenshot, viewport and JavaScript-disabled capabilities. Previous UI work used `mcp__cua_repl`; that availability must not be assumed. Use only supported browser APIs and report genuine limits. Source/static checks are not visual evidence.

Build notes:

- `build_site.py` resolves packages offline, uses `--no-version-check`, runs a release web build and assembles `build/site`. The existing SDK/cache already worked. On an actually fresh environment, package download may require a normal online `flutter pub get` first.
- The repository did not contain `lib/firebase_options.dart`. The build temporarily generates a web options file from the tracked public config, preserves a pre-existing file and removes only its own generated file afterward. Some unrelated tests importing `main.dart` may need that generated config; the three migration tests do not.
- `--assemble-only` is valid only after a Flutter build when edits affect HTML/CSS/static sources. Never use it to skip compiling changed Dart code.
- Flutter may rewrite `analysis_options.yaml`; inspect incidental edits before committing. Earlier automatic analysis-file edits were restored. The lockfile updates needed by the installed SDK/direct `flutter_web_plugins` dependency are in the checkpoint.
- `--pwa-strategy=none` produced a deprecation notice but the build succeeded. The assembled output separately retires the previous Flutter worker; returning-visitor behavior still needs real browser verification.
- If the form UI is migrated as required by the whole-site assessment, update tests that currently enforce byte-for-byte Dart preservation. Replace that assertion with meaningful behavior/schema compatibility checks, rather than deleting coverage to obtain a pass.

## 8. Ordered remaining work

1. Verify environment, git state, original source and live design. Review the clarified **whole-site** goal before deciding the final architecture. Treat the current hybrid as intermediate; migrate actual remaining form UI if necessary while keeping appearance and data behavior.
2. Complete implementation and review exact content/asset/contact/link parity. Keep Admin removed, no new business pages or invented claims, and the CRM untouched. Save meaningful commits and normal pushes.
3. Build and run checks appropriate to changes. Validate both form success/failure paths with mocks or isolated tests and invalid-input browser checks; do not use valid submissions against production as tests.
4. Compare all three public pages on desktop and mobile, especially desktop Contact/Inquiry, 320px and tablet widths. Verify images, layout, overflow, keyboard interaction, buttons, refresh/back, clean paths, old hash paths and retired Admin URLs. Check cached returning visitors as well as fresh loads.
5. Disable JavaScript through supported browser controls and inspect the **real rendered public page**, not only raw source or a summary. Verify meaningful page content, images, layout and actual links remain available. Be explicit about any submission dependency on JavaScript. Also inspect initial/raw HTTP HTML, metadata, canonical URLs, robots, sitemap, status codes and missing routes.
6. Capture final desktop/mobile and JavaScript-disabled evidence. Report dimensions, routes, outcomes and any visible differences or unresolved limits honestly. Do not claim screenshots/visual checks if tools cannot perform them.
7. Revalidate Firebase identity/project. Build the exact reviewed revision and deploy **only a preview channel**, then verify real Firebase routes, redirects, content, assets, headers and indexability. Example future command (not executed during handoff):

   ```sh
   /opt/homebrew/bin/npx -y firebase-tools@latest hosting:channel:deploy html-review --project custom-label-bottle --expires 7d
   ```

   Confirm current CLI help/config first. Record the returned preview URL, Hosting version and expiry. Preview URLs can still connect forms to the real Firebase project; never create test records there. Do not assume a preview channel isolates the database.

8. Rewrite PR #1 title/body around the final scope with actual validation and limitations, removing the obsolete metadata-only framing. Include exact commit and preview links. Show the owner a concrete reviewable result and obtain the final release decision.
9. **Only after approval**, revalidate the live rollback reference, merge/release the agreed revision and deploy Hosting as the last step. One possible final command from the exact verified build is `npx -y firebase-tools@latest deploy --only hosting --project custom-label-bottle`; do not execute it merely because it appears here. Check the resulting production site and preserve the rollback reference. Never run a broad deploy that includes databases/CRM.

## 9. Production rollback record — revalidate before release

Captured via the supported Firebase CLI on 2026-10-08:

```text
Release:
projects/custom-label-bottle/sites/custom-label-bottle/channels/live/releases/1768839261178000
Version:
projects/custom-label-bottle/sites/custom-label-bottle/versions/1d3468f820f8ce2c
Release time: 2026-01-19T16:14:21.178Z
Existing rewrite: ** -> /index.html
```

Use Firebase Hosting's release history to restore that version if a future deployment requires rollback. Refresh the reference immediately before deploying because someone else may release meanwhile. The ignored local `work/hosting-channels-before.json` contains the earlier CLI result, but the identifiers above are sufficient context without copying authentication files. A git revert alone does not restore Hosting; rollback is a separate hosting action.

## 10. Pasteable starter for the new session

> Work locally on this Mac in `/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle`, using Astra for coding if available. Read `docs/ai-website-handoff.md` completely, then verify applicable instructions, git status/branch, SDK, Firebase access and supported browser tools before modifying files. Continue PR #1 on `codex/ai-readable-html` against `master`. The goal is the whole real public website's UI/images/layout/content accessible as conventional HTML, not metadata or fallback summaries; the current hybrid is unfinished. Preserve all original design/content/contact details and form behavior/schema, remove only unused Admin, and leave the separate CRM and customer records untouched. Complete meaningful tests and desktop/mobile/JavaScript-disabled visual verification, save checkpoints, prepare a Firebase preview and updated PR, and show me the concrete result before any production merge or deployment.
