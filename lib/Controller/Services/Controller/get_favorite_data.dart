import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Export/e_commerce_export.dart';
import '../../../Models/add_to_favorite_item.dart';

class MyFavoriteGetItem {
  // ! Get All Item add To Cart .
  FavorIteItemModelClass favoriteItem = FavorIteItemModelClass();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<FavorIteItemModelClass> favoriteItemList = [];

  // ** GetData Details Screen and Show favorite Item Screen .
  Future<List<FavorIteItemModelClass>> getFavoriteItemData() async {
    List<FavorIteItemModelClass> newList = [];
    var getData = await fireStore
        .collection("UserDetails")
        .doc(FirebaseServices.currentUser!.uid)
        .collection("addToFavorite")
        .get();
    for (var element in getData.docs) {
      favoriteItem = FavorIteItemModelClass.fromJson(element.data());
      newList.add(favoriteItem);
      debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>....  $newList");
    }
    favoriteItemList = newList;
    debugPrint("....................${favoriteItemList.length}");

    return favoriteItemList;
  }
}
