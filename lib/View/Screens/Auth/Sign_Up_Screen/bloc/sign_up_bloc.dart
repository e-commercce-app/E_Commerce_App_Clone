// ignore_for_file: depend_on_referenced_packages, unnecessary_import, invalid_use_of_visible_for_testing_member
import 'dart:developer';

import 'package:e_commerce/Components/Widgets/custom_toast.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/Components/google_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';

import '../../../../../Controller/Services/firebase_services.dart';

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

          userInfo.id = FirebaseServices.currentUser.uid;
          userInfo.name = nameController.text.toString();
          userInfo.emailAddress = emailController.text.toString();
          userInfo.userImage = "xyz";
          // ! store Data .
          FirebaseServices.fireStore
              .collection("UserDetails")
              .doc(FirebaseServices.currentUser.uid)
              .set(userInfo.toJson())
              .then((value) {
            log("Store successfully");
            CustomDialog.toastMessage(
                message: "Successfully UserDetails Data .");
          }).onError((error, stackTrace) {
            log("Error : $error");
            CustomDialog.toastMessage(message: "Error : $error");
          });

          // clear TextEditing Controller .
          nameController.clear();
          emailController.clear();
          passwordController.clear();

          NavigatorService.pushNamed(
            RoutesName.splashScreen,
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
  }
  //
  get loadedState => emit(SignUpClickState(
      nameController: nameController,
      emailController: emailController,
      passwordController: passwordController,
      key: _key));
}

// import 'package:e_commerce/Export/e_commerce_export.dart';

// part 'sign_up_event.dart';
// part 'sign_up_state.dart';

// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   SignUpBloc(SignUpState signUpInitialState) : super(signUpInitialState) {
//     on<ChangePasswordVisibilityEvent>(_changePasswordVisibilityEvent);
//   }

//   // password Icon Change method
//   void _changePasswordVisibilityEvent(
//       ChangePasswordVisibilityEvent event, Emitter<SignUpState> emit) {
//     emit(state.copyWith(passwordChangeIcons: event.value));
//   }

//   // initial state of TextEditingController .
//   void _initialValue(
//       SignUpInitialEvent event, Emitter<SignUpState> emit) async {
//     emit(state.copyWith(
//         emailAddressController: TextEditingController(),
//         passwordController: TextEditingController(),
//         userNameController: TextEditingController(),
//         passwordChangeIcons: state.passwordChangeIcons));
//   }
// }
