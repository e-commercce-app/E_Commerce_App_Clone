import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/core/Components/Helper/notification_server.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// 🔹 Firebase Authentication ka instance banaya (isse Firebase me login/logout hota hai)
FirebaseAuth auth = FirebaseAuth.instance;

class GoogleSignInMethod {
  static UserDetails userInfo = UserDetails();

  // 🔹 Google Sign-In function jo Firebase ke sath integrate hoga
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // 🌐 Internet check karna (agar internet hi nahi hoga to login fail hoga)
      await InternetAddress.lookup('google.com');

      // ✅ GoogleSignIn ka ek instance get kiya (singleton hota hai)
      final googleSignIn = GoogleSignIn.instance;

      // ✅ Google Sign-In ko initialize kiya
      // ⚠️ Ye step GoogleSignIn v7+ me zaroori hai
      // clientId: Android/iOS specific client ID (Firebase Console se milta hai)
      // serverClientId: Web Client ID (Firebase Console → Web OAuth 2.0)
      await googleSignIn.initialize(
        clientId:
            '218715767603-2mjh0k57jboiko5c2m369b71f2qjlnh9.apps.googleusercontent.com',
        serverClientId:
            'firebase-adminsdk-365lh@flutter-e-commerce-14c75.iam.gserviceaccount.com',
      );

      // ✅ User ko Google ka account picker dialog show hoga
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.authenticate();

      // Agar user cancel kar deta hai to yahan null return hoga
      if (googleSignInAccount == null) {
        log('❌ Google Sign-In cancelled by user');
        await CustomDialog.toastMessage(message: 'Google Sign-In cancelled');
        return null;
      }

      // ✅ User ka authentication tokens (idToken, accessToken) fetch kiya
      final googleAuth = await googleSignInAccount.authentication;

      // ⚠️ GoogleSignIn v7 me accessToken mostly null hota hai
      // Firebase ko sirf idToken chahiye hota hai
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // ✅ Firebase Authentication ke through user ko login/signup karaya
      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // 🔹 Notification token fetch karne ke liye custom class use kiya
      final notificationServer = NotificationServer();
      final token = await notificationServer.getEndUserToken();

      // ✅ Firebase se current user object fetch kiya
      final currentUser = userCred.user;

      // 📝 User ki details apne custom model me save ki
      userInfo.id = currentUser?.uid;
      userInfo.name = currentUser?.displayName ?? '';
      userInfo.emailAddress = currentUser?.email ?? '';
      userInfo.password = ''; // ❌ Password ko kabhi store nahi karna
      userInfo.phoneNumber = currentUser?.phoneNumber ?? '';
      userInfo.createdOn = DateTime.now().toString();
      userInfo.role = 'isUser';
      userInfo.token = token;

      // ✅ User ki details Firestore database me save ki
      await FirebaseServices.currentUserCollection
          .doc(currentUser?.uid)
          .set(userInfo.toJson());

      // ✅ Log aur success message
      log('✅ Successfully Google SignUp');
      await CustomDialog.toastMessage(message: 'Successfully Google SignUp');

      // ✅ User ko Home/Dashboard screen pe navigate karaya
      await NavigatorService.pushReplacementsNamed(RoutesName.bottomBarScreen);

      return userCred; // 🔹 UserCredential object return kiya
    } catch (error, stack) {
      // ❌ Agar koi error aata hai to log aur toast show hoga
      log('❌ signInWithGoogle error: $error');
      await CustomDialog.toastMessage(
        message: '$error : Something Went Wrong (Check Internet!)',
      );
      return null;
    }
  }
}

// import 'dart:developer';
// import 'dart:io';

// import 'package:e_commerce/Export/e_commerce_export.dart';
// import 'package:e_commerce/Models/user_details.dart';
// import 'package:e_commerce/core/Components/Helper/notification_server.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// FirebaseAuth auth = FirebaseAuth.instance;

// class GoogleSignInMethod {
//   static UserDetails userInfo = UserDetails();
// // ! Google Sign In All Process .
//   static Future<UserCredential?> signInWithGoogle() async {
//     try {
//       await InternetAddress.lookup('google.com');
//       // Trigger the authentication flow  means ka end user ko ak dialog view
//       // ho ga js pr end user apne email select kr skta ha aur agr hmra user
//       // apne current email select krta ha to hmy authentication check krne prte ha
//       // aur agr hmra user (Google Dialog) ko bnd krta ha to (GoogleSignInAccount)
//       // Object return ma (null) bhjta haa . jo Future<UserCredential> ko mlta ha
//       final googleUser = await GoogleSignIn().signIn();
//       // Obtain the auth details from the request means ka GoogleSignIn hona ka
//       // bd hmy ab Two thing ki zarort ha (AccessToken, IdToken) ya dono hmy
//       // hmra email ma majod data tk rasiye daty ha
//       final googleAuth = await googleUser?.authentication;
//       // Create a new credential means ka Firebase ka Credential (conditions) ko
//       // check krta ha aur asy ya sb kuch krna ka laya (accessToken , IdToken) ki
//       // zarort hote ha .
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//       // log("Google User : $googleUser");
//       // log("Google User : ${googleUser?.id.toString()}");
//       // log("Google User Email : ${googleUser!.email.toString()}");
//       // log("Google User DisPlayName : ${FirebaseServices.currentUser.displayName.toString()}");
//       // log("Google User : ${googleUser.photoUrl.toString()}");
//       // Once signed in, return the UserCredential
//       return await auth.signInWithCredential(credential).then((value) async {
//         final notificationServer = NotificationServer();
//         log('Successfully Google SignUp');
//         await CustomDialog.toastMessage(message: 'Successfully Google SignUp');

//         final token = await notificationServer.getEndUserToken();
//         debugPrint('Successfully ');
//         // ** pass this current user data .
//         userInfo.id = FirebaseServices.currentUser?.uid;
//         userInfo.name = FirebaseServices.currentUser?.displayName.toString();
//         userInfo.emailAddress = FirebaseServices.currentUser?.email.toString();
//         userInfo.password = '12464567';
//         userInfo.phoneNumber = '+92032467346';
//         userInfo.createdOn = DateTime.now().toString();
//         userInfo.role = 'isUser';
//         userInfo.token = token;
//         // !create user help of Using Google process store data fireStore Database .
//         await FirebaseServices.currentUserCollection
//             .doc(FirebaseServices.currentUser?.uid)
//             .set(userInfo.toJson())
//             .then((value) {
//           log('store data');
//           // Correctly (Google SignUp) Push HomePage Screen
//           NavigatorService.pushReplacementsNamed(RoutesName.bottomBarScreen);
//         }).onError((error, stackTrace) {
//           log('Error : $error');
//         });
//         return FirebaseServices.auth.signInWithCredential(credential);
//       });
//     } on Exception catch (error) {
//       log('\n signInWithGoogle : $error ');
//       await CustomDialog.toastMessage(
//         message: '$error : Something Went Wrong (Check Internet!)',
//       );
//       return null;
//     }
//   }
// }
