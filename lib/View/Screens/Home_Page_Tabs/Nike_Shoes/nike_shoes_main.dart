import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:flutter/material.dart';

class NikeShoesScreen extends StatefulWidget {
  const NikeShoesScreen({super.key});

  @override
  State<NikeShoesScreen> createState() => _NikeShoesScreenState();
}

class _NikeShoesScreenState extends State<NikeShoesScreen> {
  Stream getNikeShoesData() {
    return FirebaseServices.fireStore
        .collection("NikeShoes")
        .doc(FirebaseServices.currentUser?.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getNikeShoesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data();
            return Center(child: Text(data.toString()));
          } else {
            return Center(child: Text(snapshot.error.toString()));
          }
        },
      ),
    );
  }
}
