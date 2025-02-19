import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/my_cart_model_class.dart';

class MyCartFetchDataMethod {
  // ! Get All Item add To Cart .
  MyCartModelClass cartModelClass = MyCartModelClass();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<MyCartModelClass> addToCartList = [];

  // ** GetData Details Screen and Show AddToCart Screen .
  Future<List<MyCartModelClass>> getAddToCartData() async {
    List<MyCartModelClass> newList = [];
    final getData = await fireStore
        .collection('UserDetails')
        .doc(FirebaseServices.currentUser!.uid)
        .collection('MyPersonalCart')
        .get();
    for (final element in getData.docs) {
      cartModelClass = MyCartModelClass.fromJson(element.data());
      newList.add(cartModelClass);
      debugPrint('>>>>>>>>>>>>>>>>>>>>>>>>>....  $newList');
    }
    addToCartList = newList;
    debugPrint('....................${addToCartList.length}');

    return addToCartList;
  }

  // ! Delete (MyAddToCart) add Product Item's .
  Future<void> deleteCartProduct({String? itemID}) async {
    await fireStore
        .collection('UserDetails')
        .doc(FirebaseServices.currentUser?.uid)
        .collection('MyPersonalCart')
        .doc(itemID)
        .delete();
  }
}
