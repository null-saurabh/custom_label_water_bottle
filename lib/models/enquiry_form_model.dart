import 'package:cloud_firestore/cloud_firestore.dart';

class EnquiryFormDataModel {
  String businessName = '';
  String contactName = '';
  String phone = '';
  String email = '';
  String businessType = '';
  String monthlyQuantity = '';
  List<String> bottleSizes = [];
  String city = '';
  String state = '';
  String deliveryLocation = '';
  String notes = '';

  EnquiryFormDataModel({
    this.businessName = '',
    this.phone = '',
    this.email = '',
    this.notes = '',
    this.businessType = '',
    this.monthlyQuantity = '',
    this.bottleSizes = const [],
    this.city = '',
    this.state = '',
    this.deliveryLocation = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'businessName': businessName,
      'contactName': contactName,
      'phone': phone,
      'email': email,
      'businessType': businessType,
      'monthlyQuantity': monthlyQuantity,
      'bottleSizes': bottleSizes,
      'city': city,
      'state': state,
      'deliveryLocation': deliveryLocation,
      'notes': notes,
      'status': 'new',
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}





//  String? monthlyQuantity; // dropdown value
//
//   final Set<String> bottleSizes = {};