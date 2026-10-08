# HTML marketing pages

The three public pages are Home (`/`), Contact (`/contact`) and Inquiry (`/inquiry`). The unused Admin heading was removed at the owner's request. `/admin` and nested admin paths redirect home. Legacy `/#/`, `/#/contact`, `/#/inquiry` and `/#/admin` bookmarks are handled by `marketing/site.js` when JavaScript runs.

Home and the Contact page's business information are normal semantic HTML/CSS. The existing Dart inquiry form runs at `/inquiry`. The original contact form widget is embedded at the internal, noindex `/contact-form` route. No form service, model, validation or Firestore collection changed; both still use `enquiries` in `custom-label-bottle`. The separate CRM is outside this change. With JavaScript disabled, Home and Contact remain readable with real images and telephone/email links; Inquiry and the message form explain the requirement and offer those contact options. Forms still require JavaScript.

Original copy, imagery, colors, fonts and contact details are retained, including `support@yourwater.com`, the displayed Bengaluru address, and its original Patna map destination. These were explicitly retained at the owner's request. No WhatsApp URL exists in the source; no new number or contact channel is inferred. The previous inactive “View Sample Bottles” button now links to its on-page sample section. Social icons remain decorative because the original has no social URLs.

## Build and local preview

Requires Python 3 and Flutter compatible with the lockfile. This implementation was built with the already installed Flutter SDK. Run:

```sh
python3 scripts/build_site.py --flutter /path/to/flutter/bin/flutter
python3 scripts/serve_site.py --port 8080
```

The script resolves packages offline, builds Flutter, and assembles `build/site`. On a fresh machine, run `flutter pub get` once with network access first. `--assemble-only` is for HTML/CSS-only edits after a Flutter build. Do not use it after Dart changes.

`config/firebase-web.json` contains the public Firebase web client identifiers (not service account credentials). The build temporarily generates missing `lib/firebase_options.dart`, preserves a pre-existing file, and removes only the file it generated. Firestore rules remain the access control; they are not deployed or modified by this repository's Hosting configuration.

`firebase.json` targets only `custom-label-bottle` Hosting. Clean URLs resolve the three pages and the internal form view; unknown routes return 404. The static documents never bootstrap Flutter. Fonts are self-hosted with their OFL licenses. The old Flutter service worker and only its named caches are retired so returning visitors can receive the HTML pages.

## Release boundary

Build, checks and a Firebase preview channel must succeed before production release. Do not merge or deploy to `live` until final approval. Record the preview version and the current production release immediately before release. Deploy only Hosting, never Firestore, Storage or the separate CRM project.

Existing production reference captured 2026-10-08:
- Release: `projects/custom-label-bottle/sites/custom-label-bottle/channels/live/releases/1768839261178000`
- Version: `projects/custom-label-bottle/sites/custom-label-bottle/versions/1d3468f820f8ce2c`
- Release time: `2026-01-19T16:14:21.178Z`
- Existing config: catch-all rewrite to `/index.html`.

Use the Firebase Hosting console's release history to roll back to this version if needed. Recheck the live reference before releasing, since another person may deploy meanwhile.
