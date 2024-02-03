part of 'sign_in_bloc.dart';

sealed class SignInState {
  const SignInState();
}

class SignInInitialState extends SignInState {}

// Initial State .
final class SignInClickState extends SignInState {
  TextEditingController emailAddress;
  TextEditingController password;
  GlobalKey<FormState> formKey;

  SignInClickState(
      {required this.emailAddress,
      required this.password,
      required this.formKey});
}

class SignInGoogleState extends SignInState {}
