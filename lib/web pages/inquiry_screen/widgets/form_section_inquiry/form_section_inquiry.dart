import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_info_section_inquiry.dart' show BusinessInfoSection;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_type_chips_inquiry.dart' show BusinessTypeChips;
import 'package:flutter/material.dart';

import '../../../../core/theme/design_token.dart' show DT;
import '../../../../models/enquiry_form_model.dart';

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


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 60),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
            const Divider(
              color: DT.border,
              thickness: 1,
              height: 24,
            ),
            const SizedBox(height: 16),

            BusinessInfoSection(
              businessCtrl: _businessCtrl,
              contactCtrl: _contactCtrl,
              phoneCtrl: _phoneCtrl,
              emailCtrl: _emailCtrl,
            ),
            const SizedBox(height: 28),

            BusinessTypeChips(
              selected: formData.businessType,
              onChanged: (value) {
                setState(() {
                  formData.businessType = value;
                });
              },
            ),

            const SizedBox(height: 28),

            // _QuantitySection(),
            // SizedBox(height: 28),
            //
            // _BottleAndLabelSection(),
            // SizedBox(height: 28),
            //
            // _LocationSection(),
            // SizedBox(height: 28),
            //
            // _NotesSection(),
            // SizedBox(height: 36),

            const _SubmitSection(),
            const SizedBox(height: 28),

            const _TrustFooter(),
          ],
        ),
      ),
    );
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
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF5A6B85),
          ),
        ),
      ],
    );
  }
}

class _SubmitSection extends StatelessWidget {
  const _SubmitSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3558C9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 12,
            ),
            child: const Text(
              "Submit Bulk Enquiry",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "We’ll contact you within 24 business hours. No spam. No obligation.",
          style: TextStyle(fontSize: 13, color: Color(0xFF5A6B85)),
        ),
      ],
    );
  }
}

class _TrustFooter extends StatelessWidget {
  const _TrustFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _TrustItem("Quality Certified"),
        SizedBox(width: 24),
        _TrustItem("Food-Grade Packaging"),
        SizedBox(width: 24),
        _TrustItem("Bulk Supply Ready"),
      ],
    );
  }
}

class _TrustItem extends StatelessWidget {
  final String text;
  const _TrustItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.verified, size: 18, color: Color(0xFF3558C9)),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFF1F2A44)),
        ),
      ],
    );
  }
}

