> Historical migration record. The owner subsequently authorized a professional Ink & Drink redesign. Current scope and facts: [professional-site-workflow.md](professional-site-workflow.md). Current review: [ink-drink-review.md](ink-drink-review.md). Earlier placeholder-preservation and exact-parity requirements are superseded.

# Custom Label Water Bottles — preview review

Prepared 9 October 2026 (IST). Ready for owner preview review; production remains unchanged.

- Preview: https://custom-label-bottle--html-review-xew97p5g.web.app
- Hosting site/project: `custom-label-bottle`; channel `html-review`.
- Exact release build commit: `3370506965ecc31ed4aa6b1cd363732727ccfacf`.
- Preview Hosting version: `dba86ae826e7f10e`.
- Expiry: **16 October 2026, 12:33:47 AM IST** (`2026-10-15T19:03:47.983949536Z`).
- PR: https://github.com/null-saurabh/custom_label_water_bottle/pull/1 (base `master`).

## Result and test evidence

All three public pages and both real forms are conventional HTML/CSS. There is no Flutter runtime or iframe in the 45-file Hosting build. Original assets/content/contact placeholders, `enquiries` schema/project/timestamp and original options/messages remain. Only unused Admin is removed. The previously inactive sample button now jumps to the samples section.

| Check | Result and evidence |
| --- | --- |
| Build and tests | Build passes; **9 tests pass**: payload/trim/validation, option parity, DOM pending/success/failure/retry/duplicate suppression, contact reset/inquiry retention, bottle-size click order, actual production adapter with fake SDK. Static and legacy checks pass. |
| Local responsive UI | Home/Contact/Inquiry at **1280×844, 768×844, 390×844, 320×844**; no horizontal page overflow. `responsive-evidence.json`. Hidden desktop-only mobile images can remain unfetched; visible images rendered. |
| Original comparison | All three original pages at 320px, 390px and 768px, with lower-section screenshots; desktop Home plus Contact/Inquiry top and lower sections. Original desktop Contact/Inquiry captures were 1280×720, Home 1280×844. HTML full-page captures extend beyond their 844px viewport. |
| Scripts blocked | Actual Home/Contact/Inquiry rendering inspected under loopback CSP `script-src 'none'`; content/images/actual forms visible. Navigation and sample anchor work. Submit buttons disabled with explanation and phone/email alternatives. This is **CSP-blocked page scripts**, not a global browser JS toggle. |
| Navigation | Browser back/forward/refresh, deep links, legacy Inquiry/Contact/Admin hash bookmarks, query retention, retired Admin descendants and internal form route. `navigation-evidence.json`. Legacy migration requires scripts. |
| Safe browser forms | Loopback mock only: empty/invalid input, focus on first invalid field, keyboard submit, pending, failure, retry and success; Contact resets; Inquiry retains values. Four mock-result screenshots. No real enquiries submitted. |
| Returning worker/cache | Isolated local cached-shell fixture updated to actual retirement worker: window refreshed into HTML, three Flutter caches removed, worker unregistered, unrelated cache retained. `cache-retirement-evidence.json` and before/after screenshots. This simulates worker update, not every production visitor profile. |
| Final hosted HTTP | All **45 files byte-for-byte match** final reviewed build; three routes 200; retired routes/HTML/trailing slash redirects 301; missing path 404. CSS/fonts/images/JS/worker verified. `hosting-http-evidence.json` contains SHA-256 and headers. |
| Hosted browser | Home/Contact/Inquiry desktop rendered and safe empty-form validation passed before the final tint/card-width correction. Final Home 1280×844 recaptured with loaded fonts and all visible images, no overflow: `hosted-home-final.json`, `home-preview-1280.jpg`. Final CSS corrections were checked locally and their hosted bytes verified. |
| Hosted capture limit | Full final hosted tablet/390px/320px matrix **did not finish**. Repeated browser `Page.navigate`, navigation, and network-idle timeouts interrupted it; recovery saved final desktop Home. Partial hosted screenshots are retained with earlier captures; they are not a claimed full final matrix pass. |
| Research fetcher | Coordinator's separate web research fetcher attempt reported **“URL is not accessible via this tool”** for all three preview pages. HTTP/raw HTML and browser evidence pass, but that specific research fetcher access remains unverified. Anthropic access/approval remains unverified. |

## Visible differences and practical limits

Fonts/weights, native checkbox/select styling, field truncation, some text/button wrapping and vertical spacing differ from Flutter. At 320px the original artwork overlaps Home/Inquiry/Contact copy; that arrangement is retained and reduces legibility. HTML fits the phone/email/footer more cleanly than the original 320px Contact view. Tablet contact cards now retain the original 550px cap. Blue icon tints were restored with CSS approximations; trust-strip wrapping can still differ.

The original desktop lifestyle image appeared blank in this browser reference. Its production resource returned 200 and matched the repository asset byte-for-byte; the HTML renders that same original image. Treat the blank reference as a rendering observation, not proof the original design omits the image.

Preview returns `X-Robots-Tag: noindex` from Firebase preview hosting. **Production config does not globally set noindex**: actual documents are indexable, robots allows public routes, sitemap/canonical target `https://sauravcloud.online`. The standalone 404 intentionally uses noindex. Preview noindex must not be described as a production crawler restriction. No promise is made about every AI browser/crawler or benefits approval.

Preview forms still use the production database adapter. Valid success/failure submissions were tested only on the loopback mock/fake SDK; hosted empty submissions stop before Firebase calls. Live Firestore success was intentionally not tested with real records.

## Release plan and rollback

**Stop before production merge/deploy.** Owner reviews the preview, gallery and disclosed differences/capture limit. If desired, finish the final hosted tablet/phone screenshots when browser transport is stable; no implementation rebuild is needed unless a defect is found.

After explicit production approval: refresh live rollback reference; confirm the reviewed revision/version still matches; merge agreed PR; build the exact approved release source (currently `3370506965ecc31ed4aa6b1cd363732727ccfacf`) and deploy **Hosting only** to `custom-label-bottle`, or promote only the pinned reviewed preview version after confirming its identity. Then verify production HTTP/assets/rendering/form initialization without real test enquiries. Never deploy Firestore/rules/Storage/CRM.

Live rollback revalidated after preview deployment: release `1768839261178000`, version `1d3468f820f8ce2c`, January 19 2026 16:14:21.178 UTC, catch-all rewrite to `/index.html`. `production-rollback.json` records full resource identifiers. Restore that Hosting version through release history if needed; a Git revert alone is not Hosting rollback.

## Artifact index

- `comparison-gallery.html`: original/local side-by-side screenshots and hosted review captures, explicitly labeled.
- `screenshots/`: original top/lower sections, local responsive pages, script-blocked rendering, mock outcomes, cached-shell evidence, and available hosted captures. File names identify route/width/source.
- `hosting-http-evidence.json`, `preview-release.json`, `production-rollback.json`: final Hosting evidence.
- `responsive-evidence.json`, `navigation-evidence.json`, `cache-retirement-evidence.json`, `hosted-home-final.json`: measurements and behavioral records.
- `review-package.zip`: portable gallery/report/evidence/screenshot bundle.
