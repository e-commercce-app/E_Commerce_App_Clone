// ignore_for_file: depend_on_referenced_packages, unnecessary_import, invalid_use_of_visible_for_testing_member
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Components/Widgets/custom_toast.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/Components/google_authentication.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';

import '../../../../../Controller/Services/firebase_services.dart';
import '../../../../../Export/e_commerce_export.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpState> {
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // GlobalKey
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // !UserDetails Model Class
  UserDetails userInfo = UserDetails();

  SignUpBloc() : super(SignUpInitialState()) {
    // ! Call this Initial Value .
    loadedState;
    //  Process this button Click and TextEditingController.
    on<SignUpClickEvent>((event, emit) {
      if (_key.currentState!.validate()) {
        loadedState;
        // ! Crate A User .
        FirebaseServices.auth
            .createUserWithEmailAndPassword(
                email: emailController.text.toString(),
                password: passwordController.text.toString())
            .then((value) {
          CustomDialog.toastMessage(message: "Successfully Sign Up");

          userInfo.id = FirebaseServices.currentUser?.uid;
          userInfo.name = nameController.text.toString();
          userInfo.emailAddress = emailController.text.toString();
          userInfo.userImage =
              "https://firebasestorage.googleapis.com/v0/b/flutter-e-commerce-14c75.appspot.com/o/NikeShoes%2Fnike11.png?alt=media&token=bd143004-213f-439c-bfa3-3be73f769193";
          // ! store Data on Firebase Firestore .
          FirebaseServices.currentUserCollection
              .doc(FirebaseServices.currentUser?.uid)
              .set(userInfo.toJson())
              .then((value) {
            log("Store successfully");
            CustomDialog.toastMessage(
                message: "Successfully UserDetails Data .");
          }).onError((error, stackTrace) {
            log("Error : $error");
            CustomDialog.toastMessage(message: "Error : $error");
          });

          // ! clear TextEditing Controller .
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          // Next Screen Implements .
          NavigatorService.pushNamed(
            RoutesName.bottomBarScreen,
          );
        }).onError((error, stackTrace) {
          debugPrint("Error : $error");
          CustomDialog.toastMessage(message: "Error : $error");
        });
      }
    });

    // Google Button
    on<SignUpGoogleEvent>((event, emit) {
      GoogleSignInMethod.signInWithGoogle();
    });

    // password Obscure Check Bool Value.
    // on<PasswordCheckObscureEvent>((event, emit) {
    //   emit(CheckPasswordState(isChecked: !event.obscure));
    //   if (event.obscure == false) {
    //     emit(CheckPasswordState(isChecked: event.obscure));
    //   } else if (event.obscure == true) {
    //     emit(CheckPasswordState(isChecked: event.obscure));
    //   }
    // });
  }
  //
  get loadedState => emit(SignUpClickState(
      nameController: nameController,
      emailController: emailController,
      passwordController: passwordController,
      // checkPassword: true,
      key: _key));

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
