import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartProductManagePrice {
  double totalPrice = 0.0;
  User? currentUser = FirebaseAuth.instance.currentUser;
  void fetchProductPrice() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseServices
        .currentUserCollection
        .doc(currentUser?.uid)
        .collection("MyPersonalCart")
        .get();

    double sum = 0.0;
    for (final element in snapshot.docs) {
      Map<String, dynamic> data = element.data();
      if (data.containsKey("productPrice")) {
        sum += (data["productPrice"] as num).toDouble();
      }
    }

    totalPrice = sum;
  }
}
