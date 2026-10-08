import { createPayload, validate, messages } from './form-domain.mjs';

export function bindForm(form, submitEnquiry) {
  const kind = form.dataset.enquiryForm;
  const button = form.querySelector('[type="submit"]');
  const status = form.querySelector('[role="status"]');
  const buttonText = button.textContent;
  let pending = false;
  const showErrors = errors => {
    for (const node of form.querySelectorAll('[data-error-for]')) {
      const name = node.dataset.errorFor;
      node.textContent = errors[name] || '';
      for (const field of form.querySelectorAll(`[name="${name}"]`)) {
        field.setAttribute('aria-invalid', errors[name] ? 'true' : 'false');
      }
    }
  };
  const onChange = event => {
    // Original selection widgets clear their own errors immediately.
    if (['monthlyQuantity', 'bottleSizes'].includes(event.target.name)) {
      const node = form.querySelector(`[data-error-for="${event.target.name}"]`);
      if (node) node.textContent = '';
      event.target.setAttribute('aria-invalid', 'false');
    }
  };
  const onSubmit = async event => {
    event.preventDefault();
    if (pending) return;
    const data = new FormData(form);
    const values = Object.fromEntries(data);
    values.bottleSizes = data.getAll('bottleSizes');
    const payload = createPayload(values, kind);
    const errors = validate(payload, kind);
    showErrors(errors);
    status.textContent = '';
    if (Object.keys(errors).length) {
      if (kind === 'inquiry') status.textContent = 'Please fill all required fields';
      form.querySelector('[aria-invalid="true"]')?.focus();
      return;
    }
    pending = true;
    button.disabled = true;
    button.textContent = messages[kind].pending;
    form.setAttribute('aria-busy', 'true');
    try {
      await submitEnquiry(payload);
      if (kind === 'contact') form.reset();
      status.textContent = messages[kind].success;
    } catch {
      status.textContent = messages[kind].failure;
    } finally {
      pending = false;
      button.disabled = false;
      button.textContent = buttonText;
      form.removeAttribute('aria-busy');
    }
  };
  form.addEventListener('submit', onSubmit);
  form.addEventListener('change', onChange);
  button.disabled = false;
  form.querySelector('[data-script-help]')?.setAttribute('hidden', '');
  return () => {
    form.removeEventListener('submit', onSubmit);
    form.removeEventListener('change', onChange);
  };
}
