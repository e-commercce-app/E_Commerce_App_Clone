import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';

class DeleteCurrentUser {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static Future<void> deleteCurrentUser() async {
    // ! UserInfo Delete Collection
    return FirebaseServices.currentUserCollection
        .doc(FirebaseServices.currentUser?.uid)
        .delete()
        .then((value) async {
      log('FireStore UserInfo Delete Data');
      await CustomDialog.toastMessage(
        message: 'FireStore UserInfo  Delete Successfully!',
      );
      // ! Cart Delete Information
      await fireStore
          .collection('UserDetails')
          .doc(FirebaseServices.currentUser!.uid)
          .collection('MyPersonalCart')
          .doc(FirebaseServices.currentUser?.uid)
          .delete()
          .then((value) {
        log('FireStore Cart Delete Data');
        CustomDialog.toastMessage(message: 'FireStore Cart Delete Data ');
      }).onError((error, stackTrace) {
        log('Cart Error $error');
        CustomDialog.toastMessage(message: 'Cart Error $error');
      });

      // ! Authentication Delete Account Info .
      await FirebaseServices.currentUser?.delete().then((value) {
        CustomDialog.toastMessage(message: 'Delete Sign In User');

        NavigatorService.pushReplacementsNamed(RoutesName.signInScreen);
      }).catchError((error) {
        CustomDialog.toastMessage(message: 'Error : $error');
        log(error.toString());
      });
    }).onError((error, stackTrace) {
      log('FireStore Error');
      CustomDialog.toastMessage(message: 'FireStore Error $error');
    });
  }
}
