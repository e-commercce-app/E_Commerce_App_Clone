// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

part 'recovery_password_event.dart';
part 'recovery_password_state.dart';

class RecoveryPasswordBloc
    extends Bloc<RecoveryPasswordEvent, RecoveryPasswordState> {
  // TextEditingController
  TextEditingController emailAddress = TextEditingController();
  // Form GlobalKey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RecoveryPasswordBloc() : super(RecoveryPasswordInitial()) {
    //  initial state .
    loadingState;
    // ForgetPasswordClickEvent .
    on<ForgetPasswordClickEvent>((event, emit) {
      loadingState;
      if (formKey.currentState!.validate()) {
        FirebaseServices.auth
            .sendPasswordResetEmail(email: emailAddress.text.toString())
            .then((value) {
          NavigatorService.pushNamed(RoutesName.signInScreen);
          log("Successfully Work");
          CustomDialog.toastMessage(message: "Successfully Work");
        }).onError((error, stackTrace) {
          log("Error : $error");
          CustomDialog.toastMessage(message: "Error : $error");
        });
      }
    });
  }

  get loadingState => emit(
      ForgetPasswordClickState(emailAddress: emailAddress, formKey: formKey));
}
