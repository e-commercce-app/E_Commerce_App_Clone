import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  // ! Firebase instance .
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get fireStore => FirebaseFirestore.instance;
  // ! Current User ID .
  static User? get currentUser => auth.currentUser;

  // ! Tab Bar Grid View All Collection and Data Receive Firebase FireStore .
  static CollectionReference<Map<String, dynamic>> get currentUserCollection =>
      fireStore.collection("UserDetails"); // Current User Collections .
  static CollectionReference<Map<String, dynamic>> get nikeShoesCollection =>
      fireStore.collection("NikeShoes"); // NikeShoes .
  static CollectionReference<Map<String, dynamic>> get pumaShoesCollection =>
      fireStore.collection("PumaShoes"); // AdidasShoes .
  static CollectionReference<Map<String, dynamic>> get bataShoesCollection =>
      fireStore.collection("BataShoes"); // BataShoes .
  static CollectionReference<Map<String, dynamic>> get reebokShoesCollection =>
      fireStore.collection("ReebokShoes"); // Rebook Shoes .
}
