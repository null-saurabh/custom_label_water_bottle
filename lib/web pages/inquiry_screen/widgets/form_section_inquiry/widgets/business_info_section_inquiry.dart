import 'package:flutter/material.dart';

import '../../../../../core/theme/design_token.dart';

class BusinessInfoSection extends StatelessWidget {
  final TextEditingController businessCtrl;
  final TextEditingController contactCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController emailCtrl;
  final String? businessNameError;
  final String? phoneError;



  const BusinessInfoSection({
    super.key,
    required this.businessCtrl,
    required this.contactCtrl,
    required this.phoneCtrl,
    required this.emailCtrl, this.businessNameError,this.phoneError,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Business",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2A44),
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _InputField(
                controller: businessCtrl,
                hint: "Business / Brand Name*",
                errorText: businessNameError,
                suffixIcon: const Icon(Icons.business_center_rounded, color: Colors.grey),
                validator: (v) =>
                v == null || v.trim().isEmpty ? "Required" : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _InputField(
                controller: contactCtrl,
                hint: "Contact Person Name",
                suffixIcon: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _InputField(
                controller: phoneCtrl,
                hint: "Mobile Number*",
                errorText: phoneError,
                keyboardType: TextInputType.phone,
                suffixIcon: const Icon(Icons.local_phone_rounded, color: Colors.grey),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return "Required";
                  if (!RegExp(r'^[6-9]\d{9}$').hasMatch(v)) {
                    return "Invalid number";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _InputField(
                controller: emailCtrl,
                hint: "Email Address",
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email, color: Colors.grey),
                validator: (v) {
                  if (v == null || v.isEmpty) return null;
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class _InputField extends StatelessWidget {
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? errorText;



  const _InputField({
    required this.hint,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.red,
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        // fillColor: const Color(0xFFF8FAFC),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: DT.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E6EF)),
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

