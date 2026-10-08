# Full HTML review checkpoint — 2026-10-09 (India time)

The former hybrid/iframe checkpoint is superseded. All three public pages and both forms are now real HTML/CSS. No Flutter runtime or iframe ships in the static build. Existing branch `codex/ai-readable-html`, PR #1 against `master`.

## Current verification

- Static build and nine Node tests pass, including original payload/validation/options/messages, real DOM pending/success/failure/retry, duplicate suppression, contact reset/inquiry retention, selection-order parity and real production adapter exercised with a fake Firebase SDK.
- Static asset/contact/metadata/link checks and legacy-route tests pass. Original Dart forms/service/model remain unchanged. Only unused Admin Dart route/source is removed.
- All three HTML pages captured at actual 1280×844, 768×844, 390×844 and 320×844. No horizontal page overflow measured. Lazy desktop-only Home images below the mobile breakpoint can remain unfetched because that section is hidden; this is not a broken visible image.
- Original desktop Contact and Inquiry top/lower sections compared, plus all three pages at 320px and 768px. HTML font weights, native controls, some wrapping/spacing differ. Small-screen hero artwork overlaps copy in both versions. Original 320px Contact phone/email/footer wrap or clip more severely; HTML fits them better. Tablet Contact cards now retain the original 550px width cap; trust-strip wrapping still differs slightly. Original explicit blue icon tints have been restored with CSS.
- Actual browser rendering with CSP blocking all page scripts inspected on Home, Contact and Inquiry; actual content/images/forms remain visible. Navigation and sample anchor work; sending is disabled with explanation/contact alternatives. This was not a global browser JavaScript toggle. Legacy hash migration needs scripts.
- Browser back/forward/refresh, deep links, old Inquiry/Contact/Admin hash links (including query preservation), Admin descendants, internal form redirect and trailing slash tested.
- Local mock browser forms: empty/invalid validation, focus on first error, keyboard submission, pending, failure/retry/success, Contact reset and Inquiry retention verified. No real test enquiries submitted.
- Isolated local returning-cache fixture: old worker controls a cached root shell, upgrade to actual retirement worker refreshes the window into HTML; Flutter's three named caches are removed, worker unregistered, unrelated fixture cache retained. This simulates the update lifecycle rather than modifying a real returning production user's storage.

Screenshots and JSON evidence are in `/Users/saurav/Documents/Codex/2026-10-09/custom-label-bottle-preview-review/outputs/`. See final preview report there and the forthcoming Hosting record below. Historical checkpoints remain for provenance, not current instructions to pause.

## Production boundary

No production merge/deploy is authorized here. Firebase access and project/site identity `custom-label-bottle` were revalidated. Live release remains `1768839261178000`, version `1d3468f820f8ce2c`, time `2026-01-19T16:14:21.178Z`; catch-all rewrite to `/index.html`. Refresh this reference immediately before an approved release. The separate CRM/customer records/rules/Storage were not touched.

Final release sequence: owner reviews concrete preview and differences → refresh live rollback reference → merge agreed PR revision → release exact reviewed Hosting version/build to `live` → verify public routes/assets/forms initialization → if needed restore the previous version through Hosting release history. Do not submit real test enquiries as verification.
