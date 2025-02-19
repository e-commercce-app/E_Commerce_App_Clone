import 'package:e_commerce/core/Components/Helper/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartProductManagePrice {
  double totalPrice = 0;
  User? currentUser = FirebaseAuth.instance.currentUser;
  Future<void> fetchProductPrice() async {
    final snapshot = await FirebaseServices.currentUserCollection
        .doc(currentUser?.uid)
        .collection('MyPersonalCart')
        .get();

    var sum = 0.0;
    for (final element in snapshot.docs) {
      final data = element.data();
      if (data.containsKey('productPrice')) {
        sum += (data['productPrice'] as num).toDouble();
      }
    }

    totalPrice = sum;
  }
}
