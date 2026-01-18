import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwbl_website/models/enquiry_form_model.dart';

class EnquiryService {
  static final _db = FirebaseFirestore.instance;


  static Future<void> submitEnquiry(EnquiryFormDataModel data) async {
    // print("In Submit Service A");
    await _db.collection('enquiries').add(data.toMap());
  }
}
