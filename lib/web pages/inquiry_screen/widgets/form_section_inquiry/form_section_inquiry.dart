import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/bottle_size_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_info_section_inquiry.dart'
    show BusinessInfoSection;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_type_chips_inquiry.dart'
    show BusinessTypeChips;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/delivery_into_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/montly_quantity_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/trust_footer_inquiry.dart';
import 'package:cwbl_website/widgets/premium_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive.dart';
import '../../../../core/theme/design_token.dart' show DT;
import '../../../../models/enquiry_form_model.dart';
import '../../../../services/enquiry_service.dart';

class EnquiryFormSection extends StatefulWidget {
  const EnquiryFormSection({super.key});

  @override
  State<EnquiryFormSection> createState() => _EnquiryFormSectionState();
}

class _EnquiryFormSectionState extends State<EnquiryFormSection> {
  final EnquiryFormDataModel formData = EnquiryFormDataModel();

  final _businessCtrl = TextEditingController();
  final _contactCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  String? businessNameError;
  String? phoneError;
  String? businessTypeError;
  String? monthlyQtyError;
  String? bottleSizeError;

  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    // print("In Submit A");
    _syncControllersToModel();

    if (!_validateForm(formData)) {
      // print("In Submit b");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      // print("In Submit c");

      return;
    }
    // print("Pressed Submit cc");

    setState(() => _isSubmitting = true);
    // print("Pressed Submit dd");

    try {
      //       print("Pressed Submit d");
      // print(formData.businessName);
      // print(formData.bottleSizes);
      // print(formData.businessType);
      await EnquiryService.submitEnquiry(formData);
      //       print("Pressed Submit e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enquiry submitted successfully')),
      );

      // Optional: reset form or navigate
      // context.go('/thank-you');
    } catch (e) {
      // print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Try again.')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  void _syncControllersToModel() {
    formData.businessName = _businessCtrl.text.trim();
    formData.contactName = _contactCtrl.text.trim();
    formData.phone = _phoneCtrl.text.trim();
    formData.email = _emailCtrl.text.trim();

    formData.city = cityController.text.trim();
    formData.state = stateController.text.trim();
    formData.deliveryLocation = deliveryController.text.trim();
    formData.notes = notesController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 60),
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 16 : 40,
          vertical: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 40,
              offset: const Offset(0, 24),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FormHeader(),
            const SizedBox(height: 16),
            const Divider(color: DT.border, thickness: 1, height: 24),
            const SizedBox(height: 16),

            BusinessInfoSection(
              businessCtrl: _businessCtrl,
              contactCtrl: _contactCtrl,
              phoneCtrl: _phoneCtrl,
              emailCtrl: _emailCtrl,
              businessNameError: businessNameError,
              phoneError: phoneError,
            ),
            const SizedBox(height: 28),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BusinessTypeChips(
                  selected: formData.businessType,
                  onChanged: (value) {
                    setState(() {
                      formData.businessType = value;
                      businessTypeError = null; // clear error on change
                    });
                  },
                ),

                if (businessTypeError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 4),
                    child: Text(
                      businessTypeError!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MonthlyQuantitySection(
                  value: formData.monthlyQuantity,
                  onChanged: (val) {
                    setState(() {
                      formData.monthlyQuantity = val;
                      monthlyQtyError = null;
                    });
                  },
                ),

                if (monthlyQtyError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 4),
                    child: Text(
                      monthlyQtyError!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottleSizeSection(
                  selected: formData.bottleSizes,
                  onChanged: (val) {
                    setState(() {
                      formData.bottleSizes = val;
                      bottleSizeError = null;
                    });
                  },
                ),

                if (bottleSizeError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 4),
                    child: Text(
                      bottleSizeError!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
              ],
            ),

            //
            SizedBox(height: 12),

            DeliveryInfoSection(
              cityController: cityController,
              stateController: stateController,
              deliveryController: deliveryController,
              notesController: notesController,
            ),
            const SizedBox(height: 12),

            const Divider(color: DT.border, thickness: 1, height: 24),

            Center(child: _SubmitSection(_handleSubmit, _isSubmitting)),

            const Divider(color: DT.border, thickness: 1, height: 24),
            const TrustFooter(),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _businessCtrl.dispose();
  //   _contactCtrl.dispose();
  //   _phoneCtrl.dispose();
  //   _emailCtrl.dispose();
  //   cityController.dispose();
  //   stateController.dispose();
  //   deliveryController.dispose();
  //   notesController.dispose();
  //   super.dispose();
  // }

  bool _validateForm(EnquiryFormDataModel data) {
    bool isValid = true;

    setState(() {
      businessNameError = null;
      phoneError = null;
      businessTypeError = null;
      monthlyQtyError = null;
      bottleSizeError = null;

      if (data.businessName.isEmpty) {
        businessNameError = "Business name is required";
        isValid = false;
      }

      if (data.phone.isEmpty) {
        phoneError = "Phone number is required";
        isValid = false;
      }

      if (data.phone.isEmpty) {
        phoneError = "Mobile number is required";
        isValid = false;
      } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(data.phone)) {
        phoneError = "Enter a valid 10-digit mobile number";
        isValid = false;
      }

      if (data.monthlyQuantity.isEmpty) {
        monthlyQtyError = "Please select monthly quantity";
        isValid = false;
      }

      if (data.bottleSizes.isEmpty) {
        bottleSizeError = "Select at least one bottle size";
        isValid = false;
      }
    });

    return isValid;
  }
}

class _FormHeader extends StatelessWidget {
  const _FormHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Bulk Order Enquiry",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2A44),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Fill out the form below to get a quote for custom-labeled water bottles.\nWe’ll get back to you within 24 business hours.",
          style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF5A6B85)),
        ),
      ],
    );
  }
}

class _SubmitSection extends StatelessWidget {
  final VoidCallback onSubmit;
  final bool isLoading;

  const _SubmitSection(this.onSubmit, this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PremiumButton(
          text: 'Submit Bulk Enquiry',
          onTap: onSubmit,
          isLoading: isLoading,
        ),
        const SizedBox(height: 12),
        Responsive.isMobile(context)
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.lock_outline,
                        size: 16,
                        color: Color(0xFF5A6B85),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "We’ll contact you within 24 business hours.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF5A6B85),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "No spam. No obligation.",
                    style: TextStyle(fontSize: 13, color: Color(0xFF5A6B85)),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline, size: 16, color: Color(0xFF5A6B85)),
                  SizedBox(width: 6),
                  Text(
                    "We’ll contact you within 24 business hours.No spam. No obligation.",
                    style: TextStyle(fontSize: 13, color: Color(0xFF5A6B85)),
                  ),
                ],
              ),
      ],
    );
  }
}
