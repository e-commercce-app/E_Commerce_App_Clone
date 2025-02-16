part of 'sign_in_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();
}

class SignInClickEvent extends SignInEvent {}

class SignInGoogleEvent extends SignInEvent {}
