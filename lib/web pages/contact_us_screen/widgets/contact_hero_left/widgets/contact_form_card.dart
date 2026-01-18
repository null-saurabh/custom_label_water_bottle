import 'package:flutter/material.dart';

import '../../../../../core/theme/design_token.dart';
import '../../../../../models/enquiry_form_model.dart';
import '../../../../../services/enquiry_service.dart';
import '../../../../../widgets/premium_button.dart';

class ContactFormCard extends StatefulWidget {
  const ContactFormCard({super.key});

  @override
  State<ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<ContactFormCard> {

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  String? _nameError;
  String? _phoneError;
  bool _isSubmitting = false;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // important
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            _ContactInput(errorText: _nameError,hint: "Your Name*", icon: Icons.person, controller: _nameCtrl,validator: (v) =>
            v == null || v.trim().isEmpty ? "Required" : null,),
            const SizedBox(height: 16),
            _ContactInput(hint: "Your Email", icon: Icons.email, controller: _emailCtrl),
            const SizedBox(height: 16),
            _ContactInput(validator: (v) {
              if (v == null || v.trim().isEmpty) return "Required";
              if (!RegExp(r'^[6-9]\d{9}$').hasMatch(v)) {
                return "Invalid number";
              }
              return null;
            },
                errorText: _phoneError,
                hint: "Mobile Number*", icon: Icons.phone, controller: _phoneCtrl),
            const SizedBox(height: 16),
            _ContactInput(
            controller: _messageCtrl,
              hint: "Your Message",
              icon: Icons.message,
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            PremiumButton(
              text: _isSubmitting ? "Sending..." : "Send Message",
              onTap:_handleSend,
            ),

            const SizedBox(height: 12),

            const Text(
                "We’ll respond within 24 business hours",
                style: TextStyle(fontSize: 13, color: Colors.grey,)
            ),
          ],
        ),
      ),
    );
  }


  bool _validate() {
    setState(() {
      _nameError = null;
      _phoneError = null;
    });

    if (_nameCtrl.text.trim().isEmpty) {
      _nameError = "Name is required";
    }

    final phone = _phoneCtrl.text.trim();
    if (phone.isEmpty) {
      _phoneError = "Mobile number is required";
    } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
      _phoneError = "Enter a valid 10-digit number";
    }

    return _nameError == null && _phoneError == null;
  }


  Future<void> _handleSend() async {
    if (!_validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final data = EnquiryFormDataModel(
        businessName: _nameCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        notes: _messageCtrl.text.trim(),

        // Everything else intentionally empty
        businessType: "",
        monthlyQuantity: "",
        bottleSizes: [],
        city: "",
        state: "",
        deliveryLocation: "",
      );

      await EnquiryService.submitEnquiry(data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message sent successfully")),
      );

      _nameCtrl.clear();
      _emailCtrl.clear();
      _phoneCtrl.clear();
      _messageCtrl.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong")),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }



}



class _ContactInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextEditingController controller;
  final String? errorText;
  final String? Function(String?)? validator;


  const _ContactInput({
    this.validator,
    required this.hint,
    required this.icon,
    this.maxLines = 1, required this.controller, this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        errorText: errorText,
        suffixIcon: Icon(icon, color: Colors.grey),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: DT.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: DT.border),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }
}
