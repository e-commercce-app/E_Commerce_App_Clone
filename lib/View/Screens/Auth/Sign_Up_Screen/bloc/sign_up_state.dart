// ignore_for_file: must_be_immutable

import '../../../../../Export/e_commerce_export.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpClickState extends SignUpState {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey key;

  SignUpClickState(
      {required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.key});
}



// class SignUpState extends Equatable {
//   TextEditingController? userNameController;
//   TextEditingController? emailAddressController;
//   TextEditingController? passwordController;
//   bool passwordChangeIcons;
//   // Call to Constructor
//   SignUpState(
//       {this.userNameController,
//       this.emailAddressController,
//       this.passwordController,
//       this.passwordChangeIcons = false});
//   @override
//   List<Object?> get props => [
//         userNameController,
//         emailAddressController,
//         passwordController,
//         passwordChangeIcons
//       ];

//   // Button press State
//   /// Returns a new instance of SignUpState with button pressed status as false.
//   SignUpState copyWith({
//     TextEditingController? userNameController,
//     TextEditingController? emailAddressController,
//     TextEditingController? passwordController,
//     bool? passwordChangeIcons,
//   }) {
//     return SignUpState(
//         userNameController: userNameController ?? this.userNameController,
//         emailAddressController:
//             emailAddressController ?? this.emailAddressController,
//         passwordController: passwordController ?? this.passwordController,
//         passwordChangeIcons: passwordChangeIcons ?? this.passwordChangeIcons);
//   }
// }
