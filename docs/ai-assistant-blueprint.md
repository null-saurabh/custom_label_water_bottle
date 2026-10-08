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

Do not add fake screenshots, testimonials, customer logos, endorsements, metrics or UI demonstrations. A simple accessible HTML/SVG workflow with real text labels is appropriate; it depicts the planned process, not fabricated product UI. Screenshots can be considered only when the owner supplies real, safe prototype screenshots. Public screenshots must exclude credentials/customer data; requesting or receiving them does not grant access to other repositories.

## Implementation and release workflow, after copy review

1. Review exact page, homepage-introduction, navigation and CTA copy with the owner. Confirm accurate stage, separate-project relationship and human approval boundaries. Retain generic name if no final name is chosen. Approval of this blueprint alone does not equal approval to implement.
2. Once implementation is authorized, add the static page, header/home/footer links, metadata, canonical URL and sitemap entry. Ensure build includes the new HTML file and clean `/ai-assistant` route, route fallback/404 behaviour and legacy links remain valid. Current build was written for three public pages, so inspect build/static checks before extending. No assistant/backend integration is required.
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
- [ ] No fake UI, screenshots, customer logos, testimonials, endorsements or metrics.
- [ ] 320/390/768/1280px, keyboard and script-blocked checks pass; no clipped mobile header or workflow labels.
- [ ] Build/static/route/link checks and safe existing-form tests pass; backend/schema/CRM unchanged.
- [ ] Preview matches reviewed build and owner approves it; production remains untouched until release approval.

## Current checkpoints and rollback reference

Discussion checkpoint: `d457bdc`; preceding website evidence checkpoint: `adad3d1`; reviewed/deployed website build: `34fdb2b`. Existing PR: https://github.com/null-saurabh/custom_label_water_bottle/pull/1 . Preview: https://custom-label-bottle--html-review-xew97p5g.web.app , version `d9410eacec54d3fa`, expires 16 October 2026 at 01:06:45 IST.

At the last website preview verification, production remained release `1768839261178000`, version `1d3468f820f8ce2c` (19 January 2026, 16:14:21.178 UTC). These are recorded references, not a fresh live check for this planning-only task. Refresh them before a later approved production release. See [website review](ink-drink-review.md), [owner discussion](owner-discussion-checkpoint.md) and [handoff](ai-website-handoff.md).
