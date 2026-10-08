// Keep this contract aligned with lib/models/enquiry_form_model.dart and the
// original form handlers. Optional email/type/delivery fields stay optional.
export const BUSINESS_TYPES = ['Restaurant', 'Café', 'Hotel / Resort', 'Banquet Hall', 'Other'];
export const QUANTITIES = ['100 packs', '5x00 packs', '1,000 packs', '5,000 packs', '10,000+ packs', 'Not sure'];
export const BOTTLE_SIZES = ['250 ml', '500 ml', '1 L', 'Not sure'];
export const COLLECTION = 'enquiries';
const trim = value => String(value ?? '').trim();
export function createPayload(values, kind) {
  const contact = kind === 'contact';
  return {
    businessName: trim(contact ? values.name : values.businessName),
    contactName: contact ? '' : trim(values.contactName),
    phone: trim(values.phone), email: trim(values.email),
    businessType: contact ? '' : (values.businessType || ''),
    monthlyQuantity: contact ? '' : (values.monthlyQuantity || ''),
    bottleSizes: contact ? [] : [...(values.bottleSizes || [])],
    city: contact ? '' : trim(values.city), state: contact ? '' : trim(values.state),
    deliveryLocation: contact ? '' : trim(values.deliveryLocation),
    notes: trim(contact ? values.message : values.notes), status: 'new',
  };
}
export function validate(payload, kind) {
  const contact = kind === 'contact';
  const errors = {};
  if (!payload.businessName) errors[contact ? 'name' : 'businessName'] = contact ? 'Name is required' : 'Business name is required';
  if (!payload.phone) errors.phone = 'Mobile number is required';
  else if (!/^[6-9]\d{9}$/.test(payload.phone)) errors.phone = contact ? 'Enter a valid 10-digit number' : 'Enter a valid 10-digit mobile number';
  if (!contact) {
    if (!payload.monthlyQuantity) errors.monthlyQuantity = 'Please select monthly quantity';
    if (!payload.bottleSizes.length) errors.bottleSizes = 'Select at least one bottle size';
  }
  return errors;
}
export const messages = {
  contact: { success: 'Message sent successfully', failure: 'Something went wrong', pending: 'Sending...' },
  inquiry: { success: 'Enquiry submitted successfully', failure: 'Something went wrong. Try again.', pending: 'Submitting...' },
};
