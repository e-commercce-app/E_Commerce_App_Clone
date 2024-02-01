// ignore_for_file: depend_on_referenced_packages, unnecessary_import, invalid_use_of_visible_for_testing_member
import 'package:e_commerce/Components/Widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';

import '../../../../../Controller/Routes/Services/firebase_services.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpState> {
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  SignUpBloc() : super(SignUpInitialState()) {
    // ! Call this Initial Value .
    loadedState;
    // Process this button Click .
    on<SignUpClickEvent>((event, emit) {
      if (_key.currentState!.validate()) {
        loadedState;
        // ! Crate A User .
        FirebaseServices.auth
            .createUserWithEmailAndPassword(
                email: emailController.text.toString(),
                password: passwordController.text.toString())
            .then((value) {
          toastMessage(message: "Successfully Sign Up");
          // clear TextEditing Controller .
          nameController.clear();
          emailController.clear();
          passwordController.clear();

          NavigatorService.pushNamed(
            RoutesName.splashScreen,
          );
        }).onError((error, stackTrace) {
          debugPrint("Error : $error");
          toastMessage(message: "Error : $error");
        });
      }
    });
  }
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

