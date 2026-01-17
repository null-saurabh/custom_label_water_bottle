import 'package:flutter/material.dart';

class EnquiryFormSection extends StatelessWidget {
  const EnquiryFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 30,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
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
                "Fill this form and we’ll get back within 24 business hours.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5A6B85),
                ),
              ),
              SizedBox(height: 32),

              // Placeholders – fields next step
              Text("Form fields coming next…",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
