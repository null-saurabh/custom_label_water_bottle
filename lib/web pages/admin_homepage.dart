import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('inquiries').snapshots(),
      //   builder: (_, snapshot) {
      //     if (!snapshot.hasData) return const CircularProgressIndicator();
      //     return ListView(
      //       children: snapshot.data!.docs.map((doc) {
      //         return ListTile(
      //           title: Text(doc['businessName']),
      //           subtitle: Text(doc['phone']),
      //           trailing: Text(doc['status']),
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
    );
  }
}
