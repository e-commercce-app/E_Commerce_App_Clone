// ignore_for_file: flutter_style_todos

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseServices {
  // ! Firebase instance .
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get fireStore => FirebaseFirestore.instance;
  static FirebaseStorage get storage => FirebaseStorage.instance;
  // ! Current User ID .
  static User? get currentUser => auth.currentUser;
  // ! Date and Time .
  static String get dateAndTime =>
      DateTime.now().microsecondsSinceEpoch.toString();

  // ! Tab Bar Grid View All Collection and Data Receive Firebase FireStore .
  static CollectionReference<Map<String, dynamic>> get currentUserCollection =>
      fireStore.collection('UserDetails'); //Todo=> Current User Collections .
  static CollectionReference<Map<String, dynamic>> get nikeShoesCollection =>
      fireStore.collection('NikeShoes'); //Todo=> NikeShoes .
  static CollectionReference<Map<String, dynamic>> get productsCollection =>
      fireStore.collection('products'); //Todo=> Product  .

  // ! My Cart Collection .
  static CollectionReference<Map<String, dynamic>> get myCartCollection =>
      fireStore.collection('MyPersonalCart'); //Todo=> My Cart
  static CollectionReference<Map<String, dynamic>> get categoryCollection =>
      fireStore.collection('categories');
}
