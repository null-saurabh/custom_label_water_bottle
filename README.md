# Ink & Drink website

Public Home, Contact, Inquiry and AI assistant pages rendered as semantic HTML/CSS with the original assets and a professional responsive design. Both forms retain the original Firebase enquiry contract. Dart source remains as a design/behavior reference; the public build contains no Flutter runtime or iframe.

## Build and verification

```sh
npm ci
npm run build
npm test
python3 scripts/serve_site.py --port 8081 --mock
python3 scripts/serve_site.py --port 8082 --no-scripts
```

Node and Python 3 are required; Flutter is not required for the public site. The mock server never forwards requests to Firebase. The second server blocks page scripts with CSP for rendering checks. Production submission still requires JavaScript.

See [HTML migration](docs/html-migration.md), [current review](docs/ink-drink-review.md), and [handoff](docs/ai-website-handoff.md). Only Firebase Hosting site/project `custom-label-bottle` is in scope. Owner-authorized production publication is complete at https://sauravcloud.online/ ; confirmed email founder@sauravcloud.online. Read [production release](docs/production-release.md). Do not deploy databases, rules, Storage or CRM.

AI assistant page implementation and review history: [AI website review](docs/ai-assistant-review.md).
