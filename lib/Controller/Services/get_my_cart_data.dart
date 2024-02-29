import 'package:e_commerce/Controller/Services/firebase_services.dart';

import 'package:e_commerce/Models/my_cart_model_class.dart';

import '../../Export/e_commerce_export.dart';

class MyCartFetchDataMethod {
  MyCartModelClass cartModelClass = MyCartModelClass();

  List<MyCartModelClass> addToCartList = [];

  // ** GetData Details Screen and Show AddToCart Screen .
  Future<List<MyCartModelClass>> getAddToCartData() async {
    List<MyCartModelClass> newList = [];
    var getData = await FirebaseServices.myCartCollection.get();

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
