# Ink & Drink professional site review — 9 October 2026

Ready for owner preview review; production remains unchanged. Preview: https://custom-label-bottle--html-review-xew97p5g.web.app . Existing PR: https://github.com/null-saurabh/custom_label_water_bottle/pull/1 .

## Changes

Professional Home, Contact, Bulk enquiry and 404 with real initial HTML; clear typography, product gallery, responsive layouts, visible form labels, consistent navigation/footer and I&D text monogram/favicon. Label designs links to the existing /#samples gallery. Original lifestyle image appears in full without clipping its embedded text. Placeholder contact details, inactive email, decorative social links, unsupported certification/customer claims and response promises removed. Confirmed phone/WhatsApp and Patna address published; map matches. 500 packs typo corrected; supplied optional email validates. Enquiry project, collection and field schema unchanged.

## Verification

Build, ten Node fake-adapter/DOM tests, static checks and legacy-link checks pass. All three pages measured at 1280, 768, 390 and 320 pixels without horizontal overflow. Desktop Home/Contact and small-phone Home/Inquiry visually inspected; screenshots saved. Lazy lifestyle image loaded after scrolling and fully visible at desktop and 320px. Local contact mock failure/retry/success/reset and enquiry keyboard success/retention observed; no real records submitted. Unit tests cover pending/duplicate suppression, failure/retry and selection order for both forms, plus actual Firebase adapter with fake SDK. Contact script-blocked via CSP remains readable, submit disabled and phone/WhatsApp alternatives visible. Gallery link from Inquiry navigated to the actual Home anchor. Earlier cache-retirement fixture verification remains applicable because worker is unchanged.

## Review assumptions and limits

Hours are an owner-authorized assumption: Monday–Saturday 9 AM–6 PM IST; Sunday closed. Business email is inactive and omitted. The monogram is a new typography treatment, not an official supplied logo. Existing artwork is shown as design examples, not endorsements; permissions remain an owner review item. Pack contents/MOQ, stock sizes, coverage, lead times and certificates remain unconfirmed; no promises added. WhatsApp href uses owner-confirmed number; account availability not independently confirmed. Anthropic access remains unverified as authorized. Success/failure tested only with local mocks/fake SDK, never live Firestore.

## Release boundary

Only Hosting channel html-review may be updated. No live deployment/merge, rules/database/Storage changes, CRM operations or real customer test data. Hosted byte verification, deployed build/version, preview expiry and rollback reference are appended after deployment.
