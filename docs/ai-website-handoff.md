# Ink & Drink website handoff

Current branch `codex/ai-readable-html`, existing PR https://github.com/null-saurabh/custom_label_water_bottle/pull/1, base `master`. All public pages and forms are conventional HTML. Source: `marketing/`; build `npm run build`; checks `npm test`. Current design and owner facts are documented in [professional-site-workflow.md](professional-site-workflow.md); review evidence and release boundary in [ink-drink-review.md](ink-drink-review.md).

Firebase project/site is `custom-label-bottle`, collection `enquiries`. Never touch separate CRM `custom-label-bottle-crm`. Preserve schema: businessName, contactName, phone, email, businessType, monthlyQuantity, bottleSizes, city, state, deliveryLocation, notes, status=new, createdAt=serverTimestamp(). Contact name maps to businessName; unrelated fields empty. Quantity typo now 500 packs; supplied optional email validates. Contact resets on success; enquiry retains inputs; selection order is retained.

Preview channel `html-review` has the real production adapter: only invalid submissions can be tested there. Use loopback `scripts/serve_site.py --mock` and fake-SDK tests for success/failure. No real enquiry records should be created for review. Script-blocking fixture uses `--no-scripts`. Original Dart is historical reference; exact parity and dummy contact preservation are superseded.

Production merge/deploy requires owner's review decision. Only Hosting preview is authorized now. Revalidate live release rollback before any approved production release; Git revert alone does not roll back Hosting.

Current AI website extension is implemented and preview-verified: [ai-assistant-review.md](ai-assistant-review.md). Architecture [ai-assistant-architecture.md](ai-assistant-architecture.md); historical plan [ai-assistant-blueprint.md](ai-assistant-blueprint.md). Owner authorized implementation on return; old pause/planning-only notes are historical. Functional checkpoint 114b8de, polished local review 33b788e, latest refined deployed build 19f998d. Preview version da5cf4c61975b623, expires 16 October 02:24:01 IST. All 48 files and 15 routes verified; actual latest website screenshots saved.

Next: owner reviews the exact preview, then explicit production approval and refreshed rollback reference before Hosting release/merge. Do not restart implementation/migration or imply the assistant product was built. Website extension stateless; one custom conceptual SVG; no new dependencies/backend/CRM integration. Owner-reported prototype features remain uninspected; Claude/business flow/pilot remain planned.

Resume entry point: [START-HERE.md](START-HERE.md); owner discussion [owner-discussion-checkpoint.md](owner-discussion-checkpoint.md). Git docs preserve continuity across accounts.
