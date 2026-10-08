import { bindForm } from './form-controller.mjs';
// Load the network adapter only after local validation succeeds.
const submit = async payload => {
  const { submitEnquiry } = await import('./firebase-adapter.mjs');
  return submitEnquiry(payload);
};
for (const form of document.querySelectorAll('[data-enquiry-form]')) bindForm(form, submit);
