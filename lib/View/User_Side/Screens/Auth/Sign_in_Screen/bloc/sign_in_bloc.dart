// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:e_commerce/Controller/Services/Controller/get_user_data_controller.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

import '../../Sign_Up_Screen/Components/google_authentication.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // TextEditingController
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  // Form Global Key .
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInBloc() : super(SignInInitialState()) {
    // initial State .
    loadingState;
    on<SignInClickEvent>((event, emit) {
      if (formKey.currentState!.validate()) {
        loadingState;
        // Already Login Users
        auth
            .signInWithEmailAndPassword(
                email: emailAddress.text.toString(),
                password: password.text.toString())
            .then((value) async {
          var userData = await GetUserDataController.getUserData(
              userUid: FirebaseServices.currentUser!.uid);
          if (userData[0]['isAdmin'] == true) {
            NavigatorService.pushReplacementsNamed(RoutesName.adminPanel);

            CustomDialog.toastMessage(message: "Successfully Admin Panel ");
            // clear TextEditingController .
            emailAddress.clear();
            password.clear();
          } else {
            CustomDialog.toastMessage(message: "SignIn Successfully");
            NavigatorService.pushNamedAndRemoveUntil(
                RoutesName.bottomBarScreen);
            // clear TextEditingController .
            emailAddress.clear();
            password.clear();
          }
        }).onError((error, stackTrace) {
          log("Error SignIn : $error");
          // ** show toast
          CustomDialog.toastMessage(message: "Error SignIn : $error");
        });
      }
    });

    // Google Button .
    on<SignInGoogleEvent>((event, emit) {
      GoogleSignInMethod.signInWithGoogle();
    });
  }

  get loadingState => emit(SignInClickState(
      emailAddress: emailAddress, password: password, formKey: formKey));

  @override
  Future<void> close() {
    // Clean up the controller when this widget is disposed of.
    emailAddress.dispose();
    password.dispose();
    return super.close();
  }
}
