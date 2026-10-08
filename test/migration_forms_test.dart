import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwbl_website/models/enquiry_form_model.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_left/widgets/contact_form_card.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry/form_section_inquiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('contact payload keeps the existing enquiries schema and server timestamp', () {
    final payload = EnquiryFormDataModel(
      businessName: 'Local validation fixture', phone: '9000000000',
      email: 'fixture@example.invalid', notes: 'Never submitted',
    ).toMap();
    expect(payload.keys.toSet(), {
      'businessName', 'contactName', 'phone', 'email', 'businessType',
      'monthlyQuantity', 'bottleSizes', 'city', 'state', 'deliveryLocation',
      'notes', 'status', 'createdAt',
    });
    expect(payload['businessName'], 'Local validation fixture');
    expect(payload['contactName'], '');
    expect(payload['status'], 'new');
    expect(payload['bottleSizes'], isEmpty);
    expect(payload['createdAt'], isA<FieldValue>());
  });

  testWidgets('embedded contact form rejects missing and invalid details locally', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(
      body: SingleChildScrollView(child: ContactFormCard()),
    )));
    await tester.tap(find.text('Send Message'));
    await tester.pump();
    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Mobile number is required'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Local fixture');
    await tester.enterText(find.byType(TextFormField).at(2), '123');
    await tester.ensureVisible(find.text('Send Message'));
    await tester.tap(find.text('Send Message'));
    await tester.pump();
    expect(find.text('Name is required'), findsNothing);
    expect(find.text('Enter a valid 10-digit number'), findsOneWidget);
    expect(find.text('Message sent successfully'), findsNothing);
  });

  testWidgets('original inquiry form blocks an empty submission before Firestore', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: Scaffold(
      body: SingleChildScrollView(child: EnquiryFormSection()),
    )));
    final submit = find.text('Submit Bulk Enquiry');
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pump();
    expect(find.text('Please fill all required fields'), findsOneWidget);
    expect(find.text('Enquiry submitted successfully'), findsNothing);
  });
}
