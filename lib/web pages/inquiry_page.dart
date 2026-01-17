import 'package:cwbl_website/widgets/premium_button.dart' show PremiumButton;
import 'package:flutter/material.dart';

class InquiryPage extends StatefulWidget {
  const InquiryPage({super.key});

  @override
  State<InquiryPage> createState() => _InquiryPageState();
}

class _InquiryPageState extends State<InquiryPage> {
  final formKey = GlobalKey<FormState>();
  final businessController = TextEditingController();
  final phoneController = TextEditingController();

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    // await FireStoreService.submitInquiry(
    //   businessName: businessController.text,
    //   phone: phoneController.text,
    // );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Our team will contact you shortly")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bulk Order Inquiry")),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: businessController,
                decoration: const InputDecoration(labelText: "Business Name"),
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 30),
              PremiumButton(text: "Submit Inquiry", onTap: submit),
            ],
          ),
        ),
      ),
    );
  }
}
