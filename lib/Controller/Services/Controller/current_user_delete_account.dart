import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Export/e_commerce_export.dart';

class DeleteCurrentUser {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static Future<void> deleteCurrentUser() async {
    // ! UserInfo Delete Collection
    return await FirebaseServices.currentUserCollection
        .doc(FirebaseServices.currentUser?.uid)
        .delete()
        .then((value) async {
      log("FireStore UserInfo Delete Data");
      CustomDialog.toastMessage(
          message: "FireStore UserInfo  Delete Successfully!");
      // ! Cart Delete Information
      await fireStore
          .collection("UserDetails")
          .doc(FirebaseServices.currentUser!.uid)
          .collection("MyPersonalCart")
          .doc(FirebaseServices.currentUser?.uid)
          .delete()
          .then((value) {
        log("FireStore Cart Delete Data");
        CustomDialog.toastMessage(message: "FireStore Cart Delete Data ");
      }).onError((error, stackTrace) {
        log("Cart Error ${error.toString()}");
        CustomDialog.toastMessage(message: "Cart Error ${error.toString()}");
      });

      // ! Authentication Delete Account Info .
      await FirebaseServices.currentUser?.delete().then((value) {
        CustomDialog.toastMessage(message: "Delete Sign In User");

        NavigatorService.pushReplacementsNamed(RoutesName.signInScreen);
      }).catchError((error) {
        CustomDialog.toastMessage(message: "Error : ${error.toString()}");
        log(error.toString());
      });
    }).onError((error, stackTrace) {
      log("FireStore Error");
      CustomDialog.toastMessage(message: "FireStore Error ${error.toString()}");
    });
  }
}
