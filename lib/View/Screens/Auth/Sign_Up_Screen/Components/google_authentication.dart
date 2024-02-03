// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:e_commerce/Models/user_details.dart';

import '../../../../../Components/Navigator_Service/navigator_services.dart';
import '../../../../../Controller/Routes/routes_method.dart';
import '../../../../../Export/e_commerce_export.dart';

class GoogleSignInMethod {
  static UserDetails userInfo = UserDetails();
// ! Google Sign In All Process .
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");
      // Trigger the authentication flow  means ka end user ko ak dialog view
      // ho ga js pr end user apne email select kr skta ha aur agr hmra user
      // apne current email select krta ha to hmy authentication check krne prte ha
      // aur agr hmra user (Google Dialog) ko bnd krta ha to (GoogleSignInAccount)
      // Object return ma (null) bhjta haa . jo Future<UserCredential> ko mlta ha
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request means ka GoogleSignIn hona ka
      // bd hmy ab Two thing ki zarort ha (AccessToken, IdToken) ya dono hmy
      // hmra email ma majod data tk rasiye daty ha
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential means ka Firebase ka Credential (conditions) ko
      // check krta ha aur asy ya sb kuch krna ka laya (accessToken , IdToken) ki
      // zarort hote ha .
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      debugPrint("Google User : $googleUser");
      debugPrint("Google User : ${googleUser?.id.toString()}");
      debugPrint("Google User Email : ${googleUser!.email.toString()}");
      debugPrint("Google User DisPlayName : ${googleUser.displayName}");
      log("Google User : ${googleUser.photoUrl.toString()}");
      // Once signed in, return the UserCredential
      return await FirebaseServices.auth
          .signInWithCredential(credential)
          .then((value) async {
        log("Successfully Google SignUp");
        CustomDialog.toastMessage(message: "Successfully Google SignUp");
        debugPrint("Successfully ");
        // ** pass this current user data .
        userInfo.id = googleUser.id.toString();
        userInfo.name = googleUser.displayName.toString();
        userInfo.emailAddress = googleUser.email.toString();
        userInfo.userImage = googleUser.photoUrl.toString();
        // !create user help of Using Google process store data fireStore Database .
        await FirebaseServices.fireStore
            .collection("UserDetails")
            .doc(FirebaseServices.currentUser.uid)
            .set(userInfo.toJson())
            .then((value) {
          log("store data");
          // Correctly (Google SignUp) Push HomePage Screen
          NavigatorService.pushNamed(RoutesName.homeScreen);
        }).onError((error, stackTrace) {
          log("Error : $error");
        });
        return FirebaseServices.auth.signInWithCredential(credential);
      });
    } catch (error) {
      log("\n signInWithGoogle : $error ");
      CustomDialog.toastMessage(
          message: '$error : Something Went Wrong (Check Internet!)');
      return null;
    }
  }
}
