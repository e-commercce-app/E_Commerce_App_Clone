part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordState {
  const RecoveryPasswordState();
}

final class RecoveryPasswordInitial extends RecoveryPasswordState {}

class ForgetPasswordClickState extends RecoveryPasswordState {
  ForgetPasswordClickState({required this.emailAddress, required this.formKey});
  TextEditingController emailAddress;
  GlobalKey<FormState> formKey;
}
