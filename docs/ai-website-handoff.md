# Ink & Drink website handoff

Current branch `codex/ai-readable-html`, existing PR https://github.com/null-saurabh/custom_label_water_bottle/pull/1, base `master`. All public pages and forms are conventional HTML. Source: `marketing/`; build `npm run build`; checks `npm test`. Current design and owner facts are documented in [professional-site-workflow.md](professional-site-workflow.md); review evidence and release boundary in [ink-drink-review.md](ink-drink-review.md).

Firebase project/site is `custom-label-bottle`, collection `enquiries`. Never touch separate CRM `custom-label-bottle-crm`. Preserve schema: businessName, contactName, phone, email, businessType, monthlyQuantity, bottleSizes, city, state, deliveryLocation, notes, status=new, createdAt=serverTimestamp(). Contact name maps to businessName; unrelated fields empty. Quantity typo now 500 packs; supplied optional email validates. Contact resets on success; enquiry retains inputs; selection order is retained.

Preview channel `html-review` has the real production adapter: only invalid submissions can be tested there. Use loopback `scripts/serve_site.py --mock` and fake-SDK tests for success/failure. No real enquiry records should be created for review. Script-blocking fixture uses `--no-scripts`. Original Dart is historical reference; exact parity and dummy contact preservation are superseded.

Production merge/deploy requires owner's review decision. Only Hosting preview is authorized now. Revalidate live release rollback before any approved production release; Git revert alone does not roll back Hosting.

Latest owner discussion and remaining steps: [owner-discussion-checkpoint.md](owner-discussion-checkpoint.md). The proposed separate AI assistant page is not built or approved for implementation.

Planning-only page blueprint: [ai-assistant-blueprint.md](ai-assistant-blueprint.md). Saved page/content/review plan; HTML implementation and deployment remain unapproved and have not occurred.

Account-switch checkpoint: the AI blueprint now includes an executable phased runbook, checkpoints A–E, evidence/release gates and exact resume steps. Planning is complete; implementation is pending. Next: inspect existing state and review exact Phase 1 copy, then proceed only with owner-authorized implementation. Real assistant screenshots are optional, not a blocker.

Resume entry point: [START-HERE.md](START-HERE.md). Owner paused implementation until returning with another account; finish documentation backup only now. Repository docs preserve continuity even if chat history is unavailable.
