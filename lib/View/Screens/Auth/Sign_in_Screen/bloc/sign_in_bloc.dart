// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/Components/google_authentication.dart';

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
        FirebaseServices.auth
            .signInWithEmailAndPassword(
                email: emailAddress.text.toString(),
                password: password.text.toString())
            .then((value) {
          CustomDialog.toastMessage(message: "SignIn Successfully");
          NavigatorService.pushNamed(RoutesName.splashScreen);
          // clear TextEditingController .
          emailAddress.clear();
          password.clear();
        }).onError((error, stackTrace) {
          debugPrint("Error SignIn : $error");
          // show toast
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
}
