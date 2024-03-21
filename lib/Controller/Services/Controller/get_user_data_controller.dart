import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

class GetUserDataController {
  // Check This Current User Data .
  static Future<List<QueryDocumentSnapshot<Object?>>> getUserData(
      {required String userUid}) async {
    final QuerySnapshot userData = await FirebaseServices.currentUserCollection
        .where("id", isEqualTo: userUid)
        .get();
    return userData.docs;
  }
}
