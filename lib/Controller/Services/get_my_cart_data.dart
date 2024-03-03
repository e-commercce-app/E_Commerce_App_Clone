import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';

import 'package:e_commerce/Models/my_cart_model_class.dart';

import '../../Export/e_commerce_export.dart';

class MyCartFetchDataMethod {
  MyCartModelClass cartModelClass = MyCartModelClass();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<MyCartModelClass> addToCartList = [];

  // ** GetData Details Screen and Show AddToCart Screen .
  Future<List<MyCartModelClass>> getAddToCartData() async {
    List<MyCartModelClass> newList = [];
    var getData = await fireStore
        .collection("UserDetails")
        .doc(FirebaseServices.currentUser!.uid)
        .collection("MyPersonalCart")
        .get();
    for (var element in getData.docs) {
      cartModelClass = MyCartModelClass.fromJson(element.data());
      newList.add(cartModelClass);
      debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>....  $newList");
    }
    addToCartList = newList;
    debugPrint("....................${addToCartList.length}");

    return addToCartList;
  }
}
