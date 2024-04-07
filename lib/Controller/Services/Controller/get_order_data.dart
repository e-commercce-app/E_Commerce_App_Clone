import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Export/e_commerce_export.dart';
import '../../../Models/order_model_class.dart';

class OrderNowFetchDataMethod {
  // Firebase Services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  OrderModelClass orderNowModelClass = OrderModelClass();
  // Empty List Using This View (OrderModelClass) all Data .
  List<OrderModelClass> orderNowList = [];

// ** GetData Details Screen and Show OrderNow Screen .
  Future<List<OrderModelClass>> getOrderNowData() async {
    List<OrderModelClass> newList = [];
    var getData = await firestore
        .collection("UserDetails")
        .doc(user!.uid)
        .collection("MyOrder")
        .get();

    for (var element in getData.docs) {
      orderNowModelClass = OrderModelClass.fromJson(element.data());
      newList.add(orderNowModelClass);
      debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>....  $newList");
    }
    orderNowList = newList;
    debugPrint("....................${orderNowList.length}");

    return orderNowList;
  }
}
