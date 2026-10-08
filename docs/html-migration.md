# Full HTML public website

Home (`/`), Contact (`/contact`) and Inquiry (`/inquiry`) are conventional HTML/CSS, including both actual forms. Initial HTTP HTML contains visible business content, images, labels, inputs, options and links. There is no iframe or Flutter runtime in `build/site`; Dart forms remain as the original parity reference.

The original content, assets, colors and contact details are retained, including `+91 8112552320`, `support@yourwater.com`, the displayed Bengaluru address and original Patna map destination. Social icons remain decorative. The previously inactive “View Sample Bottles” button now jumps to the samples section. Browser fonts/native controls and wrapping differ slightly from Flutter; 320px hero artwork still overlaps the copy as in the original.

Both forms use the official Firebase browser SDK, project `custom-label-bottle`, collection `enquiries`, original payload fields and `createdAt: serverTimestamp()`. Optional fields, original validation/error/success/failure messages, contact reset, inquiry retention and bottle-size selection order are preserved. There is no new backend, rules deployment or CRM change.

Clean links work without scripts. Known old `/#/` bookmarks migrate when scripts run. `/admin` and descendants redirect home; `/contact-form` redirects to `/contact#message-form`. Unknown paths return 404. All pages remain visible with scripts blocked; sending requires JavaScript, with disabled submit buttons and phone/email alternatives. Actual CSP `script-src 'none'` rendering was verified, not a browser-global JavaScript toggle.

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

Current review evidence and release reference: [migration-checkpoint.md](migration-checkpoint.md).
