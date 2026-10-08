# AI assistant website blueprint — 9 October 2026

Planning only. This document authorizes no HTML implementation, assistant integration, repository inspection outside the website, merge or deployment. The assistant page and links do not yet exist.

## Scope and public identity

Propose a dedicated conventional HTML page at `/ai-assistant`, matching the professional Ink & Drink website's typography, colours, spacing, accessible controls and responsive layout. Add an “AI assistant” header link, a short homepage introduction linking to the page and a footer link. Keep Home, Label designs, Contact and the existing enquiry route useful; adapt navigation spacing/wrapping to fit narrow phones rather than introducing cramped or clipped links.

Use the generic public working name **AI operations assistant**. Final branding is optional before implementation because this generic name can be retained. Do not use Jarvis publicly. Identify it as a separate project in development; do not invent a shared corporate entity or describe it as an Ink & Drink product already in service. Ink & Drink is the intended future internal pilot, not an active client. The longer-term aim is to support other businesses after the pilot; do not guarantee applicability to every business.

Website content only: no access to or changes in the separate assistant or CRM repositories, no new backend, signup system, live demo or data collection flow.

## Proposed page structure and copy direction

1. **Introduction and stage.** “AI operations assistant” with a clear “Prototype in development” status. Explain the aim: help people turn enquiries into organised drafts and follow-up work while keeping decisions with a human. A short homepage introduction should use the same stage and project separation.
2. **Purpose and problems.** Describe the intended reduction in repeated order interpretation, scattered requirements, manual production/delivery summaries and follow-up drafting. Frame these as goals, not proven savings or capabilities. No metrics, performance claims or every-business promise.
3. **Current prototype progress.** Attribute the frontend HUD, Hermes setup/custom skills, Gemini Live voice integration and some MCP connections to the owner's report. These have not been independently inspected. Label them prototype progress; do not imply production readiness, completed business workflows, live customer use or verified reliability.
4. **Planned business workflow.** Display the following sequence with a prominent “Planned workflow — not yet integrated” label:

   Customer enquiry → structured draft → human review → approved order → production/delivery summary → reminder draft → human approval.

   Approval gates must be explicit text, including before an order is approved and before any reminder is sent. This is proposed future behaviour, not a claim that the prototype already runs it or authorization for autonomous communications.
5. **Planned Claude evaluation.** Explain the intended evaluation of Claude for request interpretation, order drafting and workflow reasoning alongside the current stack. Claude is not currently integrated. Do not imply it automatically replaces Hermes or Gemini Live or that model/provider selection is final.
6. **Development roadmap.** Separate “Current: prototype work (owner-reported)”, “Next: integration, evaluation and internal Ink & Drink pilot” and “Later: consider expansion to other businesses after pilot learning”. No fabricated dates, completion percentages or commitments.
7. **Discuss the project.** Use real CTAs to `/contact` and confirmed WhatsApp `https://wa.me/918597788095`. The enquiry/contact form remains the existing general business contact flow; clearly contextualise the project discussion. No “Start now”, demo, signup, trial or download CTA for an unbuilt product. Do not publish `support@sauravcloud.online` while its inbox is inactive.

Do not add fabricated actual-product screenshots, testimonials, customer logos, endorsements or metrics. Optional interface concept mockups are permitted only under the explicit labelling and quality rules below. A simple accessible HTML/SVG workflow with real text labels is appropriate; it depicts the planned process, not fabricated product UI. Screenshots can be considered only when the owner supplies real, safe prototype screenshots. Public screenshots must exclude credentials/customer data; requesting or receiving them does not grant access to other repositories.

## Visual design, graphics and motion

Use a restrained professional hero compatible with Ink & Drink's navy/blue palette, typography, generous spacing and rounded panels. Give the separate project its own clear title and prototype-status label rather than inventing a logo or corporate relationship. Pair concise copy with a labelled conceptual workflow illustration, not a simulated product dashboard. Keep the Contact/WhatsApp CTA clear and subordinate to the page's development status.

Build the workflow directly in semantic HTML and, where helpful, sharp scalable SVG. Show draft stages and human approval gates distinctly with text labels; include “Conceptual illustration — planned workflow”. Keep an equivalent readable ordered text sequence, meaningful SVG title/description where necessary and accessible contrast. Desktop can use a horizontal sequence; mobile should stack it in reading order with no clipped arrows or reliance on colour alone. The diagram must remain understandable without animation or JavaScript.

Give current owner-reported prototype progress and planned integration/pilot work distinct headings and explicit status text. Use clean cards or a simple roadmap to show current/next/later rather than a fabricated percentage bar or completion timeline. Graphics must not imply that planned business capabilities already work.

Optional motion should support understanding: a brief restrained CSS/SVG transition or sequence emphasis can guide attention through the planned workflow. Avoid continuous animation, autoplay video, distracting GIF loops, flashing effects or motion that obscures approval gates. Honour `prefers-reduced-motion`, provide a fully static fallback and keep all labels/content visible before and without scripts. The page should feel polished while remaining fast and responsive.

Use images, GIFs or other media only when they explain something the text/diagram cannot explain as well. There is no need to use every offered format; prefer lightweight scalable diagrams and restrained motion. Real prototype screenshots must be supplied from the actual assistant project and have private information redacted before publication. They must carry an accurate prototype caption and cannot establish production readiness by themselves. Generated images, if useful, must be clearly conceptual illustrations, never fake product screenshots or purported evidence of working features. Apply the relevant imagegen skill/tool during later implementation only if artwork genuinely improves the page. No image generation or asset production is required for this planning checkpoint.

Later visual acceptance: inspect hierarchy, status labels, diagram reading order/approval gates, image captions, media weight/loading and keyboard behaviour at all target widths. Verify reduced-motion and script-blocked/static views preserve the complete explanation. Prefer existing fonts and small local assets; avoid adding heavy animation libraries solely for decorative effects.

## Implementation and release workflow, after copy review

1. Review exact page, homepage-introduction, navigation and CTA copy with the owner. Confirm accurate stage, separate-project relationship and human approval boundaries. Retain generic name if no final name is chosen. Approval of this blueprint alone does not equal approval to implement.
2. Once implementation is authorized, add the static page, header/home/footer links, metadata, canonical URL and sitemap entry. Ensure build includes the new HTML file and clean `/ai-assistant` route, route fallback/404 behaviour and legacy links remain valid. The build already copies the marketing directory recursively; update its hard-coded page-count message, extend the static checker and loopback clean-route mapping, and verify the Hosting clean-URL behaviour. No assistant/backend integration is required.
3. Build and run appropriate static/link/route checks and existing meaningful enquiry tests. Keep project `custom-label-bottle`, collection `enquiries`, schema, server timestamp, Contact reset, enquiry retention and selection order unchanged. Test success/failure only with local mocks/fake SDK; no real records.
4. Inspect all affected pages at 1280/768/390/320px, keyboard focus/navigation and actual CSP-script-blocked rendering. Verify mobile header, readable workflow sequence/approval gates, CTA destinations, visible prototype labels and absence of unsupported claims. The page's primary content must be in initial HTML without requiring scripts.
5. Commit and normal-push a recoverable checkpoint; update only the existing `html-review` Hosting preview. Verify hosted HTTP/route/metadata/sitemap responses, links, assets and layout against the reviewed build; capture review evidence. Preview forms use the real enquiry adapter, so do not submit valid test enquiries there.
6. Owner reviews the exact preview. Revalidate rollback and agreed revision before any approved production release. Production deployment is last, followed by public route/content/asset/form-loading verification without creating real enquiry records.

## Decisions and risks

- Final public name remains open; generic AI operations assistant is sufficient. Jarvis must not be public branding.
- Stage and features must remain accurate: current prototype work is owner-reported; business workflow/pilot/Claude evaluation are planned. No completed-feature implication through copy, graphics or CTA labels.
- Human review/approval should remain visible even when the workflow wraps on mobile. No autonomous order/payment/reminder action is implied.
- Additional header link can overcrowd 320px screens; adapt the existing responsive layout and check keyboard order.
- A separate project must not be mistaken for an active Ink & Drink service/client relationship or a shared legal entity.
- Business email remains inactive and omitted. Phone/WhatsApp are +91 8597788095. Existing hours remain an assumption: Monday–Saturday 9 AM–6 PM IST, Sunday closed.
- Preserve the website enquiry contract and separate CRM boundary. No changes to `custom-label-bottle-crm`, assistant repositories, credentials or account permissions.

## Acceptance checklist for later implementation

- [ ] Owner approves exact copy and explicitly authorizes implementation.
- [ ] `/ai-assistant` exists as conventional HTML with matching professional design, title/description/canonical and sitemap entry.
- [ ] Header “AI assistant”, homepage introduction and footer link resolve correctly; existing gallery/contact/enquiry navigation still works.
- [ ] Generic or owner-approved name used; no Jarvis public naming.
- [ ] Separate project, prototype status, owner-reported progress and future internal pilot are clear.
- [ ] Entire business workflow is labelled planned, with visible human approval gates.
- [ ] Claude is presented only as planned evaluation alongside the current stack.
- [ ] Roadmap distinguishes current/next/later without invented dates, percentages or universal claims.
- [ ] CTAs reach real Contact/WhatsApp destinations; inactive email and unbuilt product actions absent.
- [ ] No fabricated actual-product evidence, customer logos, testimonials, endorsements or metrics; optional interface concepts are visibly labelled as planned.
- [ ] Professional hero and clearly labelled conceptual HTML/SVG workflow fit the existing visual style; current versus planned hierarchy is explicit.
- [ ] Any motion is purposeful, restrained and honours reduced-motion/static fallbacks; media remains fast and accessible, with no autoplay distraction.
- [ ] 320/390/768/1280px, keyboard and script-blocked checks pass; no clipped mobile header or workflow labels.
- [ ] Build/static/route/link checks and safe existing-form tests pass; backend/schema/CRM unchanged.
- [ ] Preview matches reviewed build and owner approves it; production remains untouched until release approval.

## Current checkpoints and rollback reference

Discussion checkpoint: `d457bdc`; preceding website evidence checkpoint: `adad3d1`; reviewed/deployed website build: `34fdb2b`. Existing PR: https://github.com/null-saurabh/custom_label_water_bottle/pull/1 . Preview: https://custom-label-bottle--html-review-xew97p5g.web.app , version `d9410eacec54d3fa`, expires 16 October 2026 at 01:06:45 IST.

At the last website preview verification, production remained release `1768839261178000`, version `1d3468f820f8ce2c` (19 January 2026, 16:14:21.178 UTC). These are recorded references, not a fresh live check for this planning-only task. Refresh them before a later approved production release. See [website review](ink-drink-review.md), [owner discussion](owner-discussion-checkpoint.md) and [handoff](ai-website-handoff.md).

## Executable start-to-finish runbook

**Current state: planning complete; implementation pending.** Real assistant product screenshots will take time and are not required or a blocker. A serious, authentic page can be built from accurate copy, restrained typography and a labelled conceptual HTML/SVG workflow. Screenshots captured for website review show the actual newly implemented website; they are distinct from optional screenshots of the assistant prototype.

### Phases, checkpoints and review gates

| Phase | Work and output | Gate and recoverable checkpoint |
| --- | --- | --- |
| 0 — Resume and baseline | Read this blueprint/current handoff, applicable AGENTS instructions, current Git status/history/diff. Confirm checkout/branch/PR and existing website build/config. Inventory existing preview/live references; inspect supported project-level channel output when access is available. Do not restart the HTML migration. | Record starting source hash, clean/dirty state, preview expiry/version and any access limitation. Preserve user edits. Checkpoint A is this complete planning documentation, committed locally and normally pushed. |
| 1 — Facts and exact copy | Use the factual inventory below; review concrete draft copy with owner. No assistant/CRM repo inspection. Prepare page, homepage intro, header/footer wording, stage labels, diagram labels and CTAs. | Owner reviews exact copy and authorizes website implementation. Generic public name is acceptable; lack of screenshots is not a reason to stop. Carry forward any already explicit authorization instead of asking twice. |
| 2 — Functional HTML | Add `/ai-assistant`, initial HTML content, shared navigation/home/footer links, metadata/social fields/sitemap, local route support and build/static checks. Use current stack; no new backend or assistant integration. | Initial-HTML and route/link checks, build, existing safe form tests pass. Checkpoint B: one meaningful local commit and normal push of functional content/routes/build changes. Record hash and clean status. |
| 3 — Professional visuals | Polish hero/layout/status hierarchy and concept workflow; optional light motion/static fallback. Inspect all affected pages, accessibility, responsive layouts, resource loading and form regressions. | Evidence matrix below complete; fix actual defects. Checkpoint C: meaningful local commit and normal push with polished visuals and regression evidence/docs. No fabricated actual-product screenshots. |
| 4 — Exact hosted preview | Build from committed source; deploy only existing html-review channel. Verify public bytes/hashes, routes, links/metadata/layout; capture fresh website screenshots. Update existing PR/review/handoff with build hash, preview version/expiry and limits. | Hosted evidence corresponds to exact latest build, no stale screenshots. Checkpoint D: local commit and normal push of reviewed preview docs/PR evidence. Owner reviews actual preview; production remains unchanged. |
| 5 — Approved production, last | After explicit release authorization, revalidate live rollback/current agreed revision and release the exact reviewed Hosting artifact/version using a supported Hosting-only path. Merge only if authorized. Check public routes/content/assets/forms loading and indexing intent; no customer test records. | Confirm production version/release, public checks and recovery reference. Checkpoint E: commit/push release/postrelease documentation once release actually succeeds. If blocked/failing, report actual state, never mark released. |

Checkpoint discipline: commit/push meaningful batches, not every tiny edit. Review diff, stage intended files only, use normal pushes, record hashes and verify local HEAD equals the remote branch. Require a clean status or explicitly document preserved user changes. Optional recovery tags can point at actual commits if useful; no force-push, hard reset, destructive cleanup or credentials in artifacts. A failed push leaves a local checkpoint, not a successfully backed-up remote checkpoint.

### Phase 0: exact starting inventory

Work in the existing checkout:

`/Users/saurav/Documents/Codex/2026-10-08/realtime-voice-chat-3/work/custom_label_water_bottle`

Read `docs/ai-website-handoff.md`, `docs/ink-drink-review.md`, `docs/owner-discussion-checkpoint.md`, this file, README and applicable instructions first. Inspect `git status --short`, recent log, diff, branch, remotes and PR. Do not overwrite uncommitted changes or infer migration needs from older historical docs.

Inspect `marketing/*.html`, `marketing/site.css`, `marketing/sitemap.xml`, `marketing/robots.txt`, `scripts/build.mjs`, `scripts/check_site.py`, `scripts/serve_site.py`, tests and `firebase.json`. Known extension points, verified while planning:

- Build recursively copies `marketing/` into `build/site` and bundles existing forms; its “three HTML pages” log is hard-coded and needs correction when adding a page.
- Static checks enumerate index/contact/inquiry; extend them to cover ai-assistant without removing existing assertions.
- Loopback server maps only `/contact` and `/inquiry` to HTML; add the new clean route when implementing.
- Hosting serves `build/site` with clean URLs and trailing slashes removed; retain Admin/contact-form redirects, cache headers and retired Flutter worker. No catchall SPA rewrite should hide a missing page or replace 404.
- Existing `npm run build` and `npm test` remain the normal build/check entry points. Ten tests passed at the last website checkpoint; re-run for the implementation, not merely because planning docs changed.

Do not read auth configuration or print tokens. Validate only supported non-secret project/account status and channel summaries as needed. Use existing available Node/Python tooling; if dependencies are absent, use the project lockfile with `npm ci`. No Flutter install is needed for the public site.

### Phase 1: factual inventory and concrete draft copy

| Item | Accurate status and public treatment |
| --- | --- |
| Frontend HUD, Hermes/custom skills, Gemini Live voice, some MCP connections | Owner-reported prototype progress; not independently inspected. Attribute progress and avoid verified-completion/production-readiness wording. |
| Enquiry/order/production/delivery/reminder business flow | Entirely planned, not integrated. Human approval before an order is approved and before a reminder is sent. |
| Claude | Planned evaluation for interpretation/drafting/workflow reasoning alongside existing stack; not currently integrated or automatically replacing Hermes/Gemini. |
| Ink & Drink relationship | Separate assistant project; planned future internal pilot, not active client/service or invented shared corporate entity. |
| Audience/expansion | Intended for teams handling customer enquiries and operational follow-up; aim to consider other businesses after pilot learning, no universal guarantee. |
| Brand/stage/time | Generic AI operations assistant; prototype in development. Owner described about one week of work at discussion time, not a launch date. Prefer current/next/later stages; no fabricated calendar promises/percentages. |
| Contact | +91 8597788095, confirmed WhatsApp same number; existing Patna address/map consistent. Email/Zoho inactive, omit public email. Existing hours assumed Mon–Sat 9 AM–6 PM IST, Sunday closed. |

Draft copy below is review-ready direction, not approved published content:

- Hero status: **Prototype in development**. Title: **AI operations assistant**. Lead: “A separate project exploring how AI can help teams organise customer enquiries, prepare order drafts and plan follow-up work with human review.” CTA: **Discuss the project** → `/contact`; secondary **Chat on WhatsApp** → confirmed number.
- Purpose: “From scattered requirements to organised drafts.” Body: “The aim is to help teams interpret enquiries, capture requirements and prepare useful summaries, while people remain responsible for approval and customer communication.”
- Prototype progress: “Current prototype work, reported by the project owner.” Body: “The owner reports a frontend HUD, Hermes setup and custom skills, Gemini Live voice integration and some MCP connections. This progress has not been independently inspected and does not establish production readiness.” Prefer brief plain-language explanations of HUD/MCP alongside the technical names if necessary for a general visitor; do not infer which systems are connected.
- Workflow: “Planned workflow — not yet integrated.” Use exact sequence above. Supporting line: “Drafts would be reviewed before an order is approved, and reminder drafts would require human approval before sending.”
- Claude: “Planned Claude evaluation.” Body: “Claude is being considered for request interpretation, order drafting and workflow reasoning alongside the current stack. This integration is planned and is not currently in place.”
- Roadmap: “Current: prototype development. Next: integration, evaluation and a future internal Ink & Drink pilot. Later: consider support for other businesses based on what the pilot teaches us.” No dates or progress bars.
- Homepage introduction: “An AI operations assistant, in development.” Body: “Explore a separate project focused on organised drafts and human-reviewed workflows. Ink & Drink is the intended future internal pilot.” Link: **Explore the project** → `/ai-assistant`.
- Contact purpose: “Use the existing contact form to share your project question and contact details so we can discuss it.” This describes the existing form purpose only. Do not invent retention, encryption, privacy compliance or confidentiality promises, legal terms or a dead privacy-policy link.

Owner review gate: assess exact copy for factual status, project separation, audience, terminology, proposed human approval and honest CTAs. Save accepted edits in the same blueprint/copy reference. If owner requests changes, incorporate them before dependent implementation. Optional name/media choices can use the generic name and conceptual illustration as already proposed.

### Phase 2: implementation specification after authorization

Use `marketing/ai-assistant.html` with lang, viewport, descriptive title/meta description, a verified production canonical `https://sauravcloud.online/ai-assistant`, consistent Open Graph/social metadata and suitable robots intent. Do not use an image claiming to show assistant UI; social-image metadata can use approved existing artwork only when relevant, or omit an unapproved image. Add canonical sitemap entry; retain existing robots/sitemap links. Ensure page is copied to build and initial response contains actual headings, paragraphs, diagram labels and CTA links.

Reuse shared header/footer pattern across Home, Contact, Inquiry, AI page and 404, with active-page state. Header text “AI assistant”; page title “AI operations assistant”. Add a short clearly separated Home introduction after primary bottle content so the business remains understandable. Footer link reaches the real page. Keep `/#samples` as the gallery destination. Use correct spelling consistently: Ink & Drink, AI operations assistant, prototype, enquiry, Claude, Hermes and Gemini Live.

Layout states: desktop hero text plus concept panel; tablet comfortable widths/wrapping; mobile stacked hero/cards/workflow, explicit status first and CTA not hiding main purpose. Section order follows the seven-part content plan. Give current/next/later status cards equal clarity but distinct labels, not artificial completion values. Workflow HTML retains the full ordered text; SVG is decorative or has accessible title/description without duplicating confusing labels. Arrow/checkpoint styling cannot imply live processing.

Existing backend contract remains exactly the fields/project/collection documented in handoff. Do not prepopulate extra backend fields for assistant enquiries or silently add product telemetry. Page introduces contact discussion only. Do not send actual WhatsApp messages, call the phone or submit real customer/test enquiry records. Opening/link-verifying a public destination is distinct from sending a message.

### Phase 3–4: evidence matrix and failure handling

| Review area | How to verify; required evidence |
| --- | --- |
| Truthful professional content | Read complete copy/captions/CTAs. Clear purpose/audience; owner-reported current prototype vs planned flow/pilot/Claude; no fake metrics/certificates/customer testimonials/logos/unsupported privacy promises/date guarantees. Real contact details/map consistent; no inactive email, dead link or unbuilt product action. |
| Initial HTML/crawlability | Read built and hosted response HTML: actual content/labels/anchors, metadata/canonical/social fields and sitemap entry. No iframe/Flutter/JS-only content or effects hiding text. |
| Routes/resources | Check `/`, `/contact`, `/inquiry`, `/ai-assistant` return intended HTML; redirects for trailing slash/HTML forms/legacy routes remain as intended, unknown path returns genuine 404. Check all local assets and internal links; HTTP status/redirect target evidence. |
| Navigation/history | Click header/home/footer AI links and gallery from each applicable route; direct load, refresh, back/forward and known legacy deep links. Verify active state and anchor reaches gallery; no confusing separate Samples screen. |
| Responsive/visual | Inspect affected pages at 320/390/768/1280 widths: text legibility, no horizontal overflow/clipping/overlap, mobile header fit, readable ordered workflow/approval gates and CTA targets. Save desktop/mobile screenshots of actual latest website, labelled with route/viewport/build version. |
| Resource loading/performance | Confirm intended images/fonts finished loading before screenshot; inspect console/network for site errors/failed resources. Note any unrelated environment issue accurately. Record added asset sizes and total change; reuse existing fonts, optimise necessary images, dimensions to prevent jumps, lazy-load lower images only, eager-load critical hero if present. No heavy libraries/GIFs solely for decoration. |
| Accessibility/keyboard | Real headings/landmarks/ordered text, proper SVG semantics/contrast, visible focus, logical Tab order, skip link, descriptive links and existing form labels/errors. Test keyboard navigation/submission locally. No content conveyed solely by colour or animation. |
| Script-blocked and reduced-motion | Actual CSP `script-src 'none'` fixture: content/navigation/workflow remain readable; existing form submit stays disabled with phone/WhatsApp alternatives. Verify reduced-motion using a supported browser capability if available; otherwise document method/limitation and inspect static CSS fallback, never claim emulation was tested when unavailable. No hidden content/continuous effects. |
| Form regression | Run existing meaningful tests and loopback mock success/failure/retry/pending/duplicate/reset/retention/selection order and validation checks as appropriate. Use fake Firebase SDK/mock adapter only, preserving original schema and server timestamp. Hosted checks limited to rendering and invalid submissions that cannot write. |
| Exact hosted review | Record committed source hash and output file SHA-256 manifest; verify hosted response bytes/hash against each built file, including new page/assets. Record preview version/release/expiry, HTTP headers and real 404. Capture fresh screenshots after deployment/assets load; do not reuse earlier screenshots as latest proof. |

Fix actual defects before moving to next gate. Review relevant tests once after changes; repeat only when new changes/failures justify it. Missing tool capabilities or network/access failures must be recorded as unverified, not fabricated passes. An expired preview can be renewed only in the authorized preview phase; it does not authorize production.

For loopback review, inspect existing ports first; reuse suitable running servers or start them with current source/build:

```sh
npm ci
npm run build
npm test
python3 scripts/serve_site.py --port 8081 --mock
python3 scripts/serve_site.py --port 8082 --no-scripts
```

Run server commands in separate persistent sessions, not as a single blocking sequence. Mock requests never forward/store enquiry payloads. Use available documented browser controls for UI; no arbitrary browser script mutations for testing. Keep intermediate work in ignored `work/`; user-facing evidence in the output directory below.

In the authorized preview phase, after validating project/site and committed build, use the supported CLI:

```sh
firebase hosting:channel:deploy html-review --project custom-label-bottle --expires 7d --no-authorized-domains --json
```

If `firebase` is not available directly, use the already available official firebase-tools package runner as in the existing workflow. Do not install unrelated software, deploy Firestore/rules/Storage/CRM or broaden Auth domains. Save only deployment/release/project-level output without secrets. Update the existing PR description around final implementation and actual validation; attach that PR in the chat when continuing its work.

### Phase 5: release and recovery

Owner must review the exact current preview before the final release step. Revalidate live release/version and agreed source/build after approval. The recorded original rollback version is `1d3468f820f8ce2c`, release `1768839261178000`; verify whether live changed since the last check and preserve that latest before-release reference too. Do not assume an old source checkout alone is a Hosting rollback.

Release only the exact reviewed Hosting artifact/version through a supported Hosting-only operation after checking its config and applicable permissions. Do not invent a version-promotion command or run a broad deploy. If a fresh build is required, compare it to the reviewed manifest before release; changed bytes require renewed verification/review of material changes. Keep PR merge and Hosting release distinct and perform each only within explicit authorization.

Postrelease: record live release/version/time and compare production files/routes/assets against the reviewed artifact; verify public nav/canonical/sitemap/robots/indexing intent, real 404 and forms loading without creating records. Preview-only noindex must not be accidentally copied into production headers; intended 404 noindex can remain. Monitor only within the current verification task, not a new unrequested recurring automation. If release validation fails, use a supported Hosting rollback to the verified recovery version within applicable authorization, document actual result, and do not treat a Git revert as sufficient.

### Account-switch handoff and exact next action

- Model preference for continuation: **GPT-6.1 Sol, medium**. Existing checkout above; branch `codex/ai-readable-html`; GitHub repo `null-saurabh/custom_label_water_bottle`; existing PR #1, base `master`. Do not create a new migration or duplicate PR. If the existing checkout is unavailable on another machine, use the existing repo and branch through authorized Git access, then confirm fetched state; do not assume a fresh clone carries ignored files/evidence.
- Read current docs and Git status/history first. Starting blueprint history: `d8a46c2`, visual-plan extension `6c9f123`; the complete-runbook checkpoint is the later current HEAD created for this planning request. Record/verify actual HEAD rather than hard-code a future hash. Existing website build/evidence checkpoints remain distinct from docs-only HEAD.
- Node/Python and locked project dependencies are sufficient. Check available dependencies; run `npm ci` only if needed. Build/test scripts above. Public Firebase web identifiers are already tracked; local account credentials stay in signed-in environment and are not transferable artifacts. Do not read auth config, print login token listings, paste tokens into a new chat or include secrets in Git/output archives.
- New account/session may have different connectors, permissions, GitHub/Firebase access and browser handles. Check available project-level capabilities and authorized access; recreate tool handles/loopback sessions as needed. Do not change permissions or accounts merely to avoid a legitimate access blocker. Keep all existing user authorization and release boundaries.
- Portable user-facing plan/evidence directory: `/Users/saurav/Documents/Codex/2026-10-09/custom-label-bottle-preview-review/outputs/ink-drink-review`. Git-tracked plan/current handoff are the primary resume sources; ignored work scripts and prior browser state are convenience only. Verify evidence route/build/version labels before reuse. Copy/download legitimate plan artifacts if needed; never transfer credentials.
- **Next step after switch: read/check the existing state, then present/review exact copy in Phase 1 and obtain any missing implementation authorization.** Planning is complete. No AI page has been implemented or deployed. Proceed only with the next phase the owner actually authorizes; this runbook is not blanket deployment permission. Screenshots/final product name are optional and must not block accurate copy/conceptual page work.

## Detailed visual production and QA specification

High-quality authenticity means coherent design and accurate development status, not passing created images off as implementation. The default meaningful HTML/SVG workflow is sufficient. No fake HUD is required. Optional professionally designed interface concepts are permitted if they help explain a planned action, but each must visibly say **“Concept mockup — planned interface”**. Never call one an actual prototype screenshot, demonstration of working software or evidence of completed features. No generation or asset creation occurs in this planning task.

Before creating any later asset, write a brief with purpose, exact visible text, stage/status, caption, alt/accessible description, size/weight target and desktop/mobile behaviour. Use a single coherent typography/grid/icon style, deliberate spacing and readable hierarchy rather than disconnected decorative images. Proposed asset briefs:

| Asset | Purpose and exact status/caption | Accessible treatment and responsive direction |
| --- | --- | --- |
| Hero concept illustration | Explain organised drafts with human review. Label “Conceptual illustration — planned workflow”; caption “A visual explanation of the intended process, not a working product screen.” No fabricated dashboard/customer results. | Alt/description summarises drafts moving to human review; adjacent actual HTML carries the full purpose/status. Wide panel beside hero at desktop; stacked below text on mobile; no cropping of labels. |
| Full workflow diagram | Explain exact seven-stage sequence and two human approval gates. Heading “Planned workflow — not yet integrated”; labels Customer enquiry, Structured draft, Human review, Approved order, Production/delivery summary, Reminder draft, Human approval. | Prefer ordered semantic HTML with optional SVG arrows; arrows decorative or described. Horizontal/wrapped at desktop, single reading-order column on mobile. Review text stays visible; no impossible links or implied live activity. |
| Current/next/later progress graphic | Distinguish owner-reported prototype work from planned integration/pilot/expansion. Exact headings “Current — owner-reported prototype”, “Next — planned integration and internal pilot”, “Later — possible expansion after pilot learning”. | HTML cards/list, consistent icon style optional, textual stages never colour-only. Three columns when comfortable, stack on narrow screens. No fabricated percentages/dates. |
| Optional planned interface concept | Explain a structured order draft and approval action only if it adds value beyond the diagram. Visible label “Concept mockup — planned interface”; caption “Illustrative example of a proposed draft review screen; this interface has not been implemented.” | Render exact readable copy and controls in HTML/SVG; do not make inert concept actions look like real working buttons. Desktop panel and mobile stacked layout; all important text stays readable. Include equivalent text description; no invented actual prototype claim. |
| Optional real prototype screenshot | Show only owner-supplied safe actual project image. Caption explicitly identifies prototype and what it actually shows; do not infer business-flow completion/production readiness. | Redact private information before publication, meaningful alt, preserve aspect ratio and offer readable enlargement if necessary. Include only when provided; not a dependency for page launch. |

For an optional concept screen, specify a realistic information hierarchy: planned-interface status and title first, then illustrative requirement summary, review-needed items, and the human approval gate. Use neutral text such as “Illustrative example”, “Requirements draft”, “Quantity: to be confirmed”, “Delivery location: to be confirmed” and “Human review required”. Do not invent customer identities, real enquiries, fabricated performance statistics, transaction/payment records, live feeds or customer evidence. Any illustrative sample is explicitly labelled; actions describe a planned state rather than submitting anything. Avoid pretend interactivity when no real function exists.

Exact text and diagrams should be rendered as HTML/SVG, not random lettering in image-generated screenshots. If raster artwork later genuinely helps, follow the imagegen skill/tool and label it conceptual; never substitute it for an actual working screen. Do not use raster generation for diagram labels, UI text or established code/vector elements when native HTML/SVG is clearer. No gibberish, deformed/inconsistent icons, impossible connections, unreadable diagram text, clipped edges or fake technical detail.

Asset QA before checkpoint C and again in hosted page context before D:

- Inspect every asset at full size, and at its actual desktop/mobile display size, including label/caption accuracy and clearly visible stage. Check all text against its brief character-for-character.
- Inspect the actual website with fonts/images fully loaded; no cropped text, arrows or edges, distorted proportions, missing glyphs, blurry labels or accidental unfinished areas. Check light and dark presentations if both are deliberately used; no need to introduce a dark mode.
- Check contrast, type size, line lengths, grid/spacing and consistent icons; retain accessible text/reading order and clear human approval gates. Provide descriptive alt or decorative treatment appropriate to the purpose, not redundant screen-reader repetition.
- Record dimensions/file weight; optimise compression without sacrificing legibility. Prefer SVG/native layout; preserve image dimensions/aspect ratio and lazy-load only suitable lower-page artwork. No unnecessary heavy packages, GIFs or media requests.
- Verify reduced-motion/static fallback and script-blocked content; no animation-only label, hidden critical text or autoplay distraction.
- Save fresh desktop/mobile screenshots of the actual website and label the reviewed build/version. These prove website presentation, not assistant feature completion. If an optional concept asset fails quality/truthfulness checks, improve it or remove it; the accurate text/workflow page remains sufficient.
