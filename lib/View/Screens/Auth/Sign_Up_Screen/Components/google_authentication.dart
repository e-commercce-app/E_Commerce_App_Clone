// Todo : Google Auth In Flutter Help With Firebase
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../Export/e_commerce_export.dart';

Future<UserCredential> signInWithGoogle() async {
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
  //  zarort hote ha .
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  debugPrint("Google User : $googleUser");
  debugPrint("Google User Email : ${googleUser!.email.toString()}");
  debugPrint("Google User DisPlayName : ${googleUser.displayName}");
  // Once signed in, return the UserCredential
  return await FirebaseServices.auth
      .signInWithCredential(credential)
      .then((value) {
    debugPrint("Google Button Login");
    // Utils().toast("Google Login");

    /// AGr hmra current user GoogleSign Ka process complete kr lata ha to hm
    /// asy HomePage Pr Navigate kr raha ha aur navigationScreen .
    debugPrint("Successfully ");
    // Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
    return FirebaseServices.auth.signInWithCredential(credential);
  });
}
