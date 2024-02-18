part of 'password_check_bloc.dart';

sealed class PasswordCheckState {
  const PasswordCheckState();
}

class PasswordCheckInitial extends PasswordCheckState {}

class PasswordConfirmState extends PasswordCheckState {
  bool checkPassword = true;
  PasswordConfirmState({required this.checkPassword});
}
