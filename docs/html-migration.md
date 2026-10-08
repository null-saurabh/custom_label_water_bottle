# Full HTML public website

Home (`/`), Contact (`/contact`) and Inquiry (`/inquiry`) are conventional HTML/CSS, including both actual forms. Initial HTTP HTML contains visible business content, images, labels, inputs, options and links. There is no iframe or Flutter runtime in `build/site`; Dart forms remain as the original parity reference.

The professional Ink & Drink redesign uses confirmed phone/WhatsApp and Patna address, a typography-based I&D monogram, corrected copy, labelled design examples and responsive layouts. Unsupported certification/customer claims and inactive business email are omitted. Hours are an owner-authorized assumption: Monday–Saturday 9 AM–6 PM IST, Sunday closed. The original raster assets and licensed fonts remain in use; the lifestyle artwork is displayed in full.

Both forms use the official Firebase browser SDK, project `custom-label-bottle`, collection `enquiries`, original payload fields and `createdAt: serverTimestamp()`. Optional fields, contact reset, inquiry retention and bottle-size selection order remain. The quantity typo is corrected to `500 packs`; supplied optional email is validated. No backend, rules or CRM change.

Clean links work without scripts. Known old `/#/` bookmarks migrate when scripts run. `/admin` and descendants redirect home; `/contact-form` redirects to `/contact#message-form`. Unknown paths return 404. All pages remain visible with scripts blocked; sending requires JavaScript, with disabled submit buttons and phone/WhatsApp alternatives. Actual CSP `script-src 'none'` rendering was verified, not a browser-global JavaScript toggle.

## Build and safe preview

```sh
npm ci
npm run build
npm test
python3 scripts/serve_site.py --port 8081 --mock
python3 scripts/serve_site.py --port 8082 --no-scripts
```

The Node build copies original assets/fonts and bundles form code into `build/site`. It does not need Flutter. `scripts/build_site.py` is a compatibility wrapper. Public Firebase web identifiers are tracked in `config/firebase-web.json`; credentials are not. Mock adapters are served only by the loopback mock server and never packaged into Hosting.

Hosting config targets only `custom-label-bottle`, with clean URLs, retired-route redirects, revalidation headers and a replacement worker at the old Flutter worker URL. The worker removes only Flutter's named caches, unregisters and refreshes old controlled windows. An isolated browser cache fixture verified this behavior while retaining an unrelated cache.

## Release boundary

Preview channels use the real production database adapter. Do not send valid test submissions there. Record the preview version/build and live rollback version, then obtain the owner's release decision. Only after approval, refresh rollback information, merge the agreed revision and release the exact reviewed Hosting version. Never run a broad deployment involving Firestore, rules, Storage or CRM. A Git revert does not itself roll back Hosting.

Current review evidence and release reference: [ink-drink-review.md](ink-drink-review.md).
