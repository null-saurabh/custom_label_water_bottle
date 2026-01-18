import 'package:flutter/material.dart';

class DeliveryInfoSection extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController deliveryController;
  final TextEditingController notesController;

  const DeliveryInfoSection({super.key,
    required this.cityController,
    required this.stateController,
    required this.deliveryController,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _InputField(
                hint: "City",
                controller: cityController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _InputField(
                hint: "State",
                controller: stateController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// Expected delivery location with helper INSIDE field
        _InputField(
          controller: deliveryController,
          maxLines: 2,
          hintWidget: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Expected Delivery Location\n",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                TextSpan(
                  text: "Helps us calculate logistics & timelines",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A94A6),
                  ),
                ),
              ],
            ),
          ),
        ),


        const SizedBox(height: 16),

        _InputField(
          controller: notesController,
          maxLines: 2,
          hintWidget: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Anything specific you'd like us to know?\n",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                TextSpan(
                  text:
                  "Events, timelines, premium packaging, cap color, etc.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A94A6),
                  ),
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}




class _InputField extends StatelessWidget {
  final String? hint;
  final Widget? hintWidget;
  final TextEditingController? controller;
  final int maxLines;
  final String? helperText;
  final Widget? suffixIcon;

  const _InputField({
     this.hint,
    this.hintWidget,
    this.controller,
    this.maxLines = 1, this.helperText, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintWidget == null ? hint : null,
        hint: hintWidget,
        helperText: helperText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.green),

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E6EF)),
        ),

      ),
    );
  }
}
