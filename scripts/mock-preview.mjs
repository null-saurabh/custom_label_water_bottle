// Only the loopback test server exposes this entry; never copied to build/site.
import { bindForm } from '/test-source/form-controller.mjs';
for (const form of document.querySelectorAll('[data-enquiry-form]')) {
  bindForm(form, async payload => {
    await new Promise(resolve => setTimeout(resolve, 600));
    const result = await fetch('/__mock_enquiry', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)});
    if (!result.ok) throw new Error('Local mock failure');
  });
}
