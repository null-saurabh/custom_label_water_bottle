import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/bottle_size_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_info_section_inquiry.dart' show BusinessInfoSection;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/business_type_chips_inquiry.dart' show BusinessTypeChips;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/delivery_into_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/montly_quantity_inquiry.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/widgets/trust_footer_inquiry.dart';
import 'package:cwbl_website/widgets/premium_button.dart';
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

  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController notesController = TextEditingController();


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

            const SizedBox(height: 20),

            MonthlyQuantitySection(
              value: formData.monthlyQuantity,
              onChanged: (val) {
                setState(() {
                  formData.monthlyQuantity = val;
                });
              },
            ),

            SizedBox(height: 20),

            BottleSizeSection(
              selected: formData.bottleSizes,
              onToggle: (size) {
                setState(() {
                  if (formData.bottleSizes.contains(size)) {
                    formData.bottleSizes.remove(size);
                  } else {
                    formData.bottleSizes.add(size);
                  }
                });
              },
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

            const Divider(
              color: DT.border,
              thickness: 1,
              height: 24,
            ),

            Center(child: const _SubmitSection()),

            const Divider(
              color: DT.border,
              thickness: 1,
              height: 24,
            ),
            const TrustFooter(),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _businessCtrl.dispose();
    _contactCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    cityController.dispose();
    stateController.dispose();
    deliveryController.dispose();
    notesController.dispose();
    super.dispose();
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
        PremiumButton(
          text: 'Submit Bulk Enquiry',
          onTap: () {},
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.lock_outline,
              size: 16,
              color: Color(0xFF5A6B85),
            ),
            SizedBox(width: 6),
            Text(
              "We’ll contact you within 24 business hours. No spam. No obligation.",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF5A6B85),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


