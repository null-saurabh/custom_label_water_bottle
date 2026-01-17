// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FireStoreService {
//   static final _db = FirebaseFirestore.instance;
//
//   static Future<void> submitInquiry({
//     required String businessName,
//     required String phone,
//   }) async {
//     await _db.collection('inquiries').add({
//       'businessName': businessName,
//       'phone': phone,
//       'status': 'new',
//       'createdAt': Timestamp.now(),
//     });
//   }
// }
