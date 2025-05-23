// ignore_for_file: depend_on_referenced_packages, unnecessary_import, invalid_use_of_visible_for_testing_member
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/core/Components/Helper/notification_server.dart';
import 'package:e_commerce/core/Components/Navigator_Service/routes_name.dart';
import 'package:e_commerce/core/Components/Widgets/custom_image_picker_services.dart';
import 'package:e_commerce/core/Components/Widgets/custom_toast.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/Components/google_authentication.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    // ! Call this Initial Value .
    loadedState;

    // on<ImagePickerGalleryEvent>((event, emit) async {
    //   // Pick image from gallery
    //   final pickedFile = await imagePickerService.galleryImage();
    //   if (pickedFile != null) {
    //     log(pickedFile.path);
    //     ImagePickerLoadedState(image: File(pickedFile.path));
    //   }
    // });

    //  Process this button Click and TextEditingController.
    on<SignUpClickEvent>((event, emit) {
      if (_key.currentState!.validate()) {
        loadedState;
        // ! Crate A User .
        FirebaseServices.auth
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) async {
          await CustomDialog.toastMessage(message: 'Successfully Sign Up');
          final token = await _notificationServer.getEndUserToken();
          userInfo
            ..id = FirebaseServices.currentUser?.uid
            ..name = nameController.text
            ..emailAddress = emailController.text
            ..password = passwordController.text
            ..phoneNumber = phoneController.text
            ..createdOn = DateTime.now().toString()
            ..role = 'isUser' // Default 'isUser' role
            ..adminToken = token
            ..token = token;

          // ! store Data on Firebase Firestore .
          await FirebaseServices.currentUserCollection
              .doc(FirebaseServices.currentUser?.uid)
              .set(userInfo.toJson())
              .then((value) {
            log('Store successfully');
            CustomDialog.toastMessage(
              message: 'Successfully UserDetails Data .',
            );
          }).onError((error, stackTrace) {
            log('Error : $error');
            CustomDialog.toastMessage(message: 'Error : $error');
          });

          // ! clear TextEditing Controller .
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          phoneController.clear();
          // Next Screen Implements .
          await NavigatorService.pushReplacementsNamed(
            RoutesName.signInScreen,
          );
        }).onError((error, stackTrace) {
          debugPrint('Error : $error');
          CustomDialog.toastMessage(message: 'Error : $error');
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
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // GlobalKey
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // !UserDetails Model Class
  UserDetails userInfo = UserDetails();
  // ! Gallery Picker Services
  // ImagePickerService imagePickerService = ImagePickerService();
  // ! Notification Server
  final NotificationServer _notificationServer = NotificationServer();
  //
  get loadedState => emit(
        SignUpClickState(
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          phoneController: phoneController,
          // checkPassword: true,
          key: _key,
        ),
      );

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.clear();
    return super.close();
  }
}
