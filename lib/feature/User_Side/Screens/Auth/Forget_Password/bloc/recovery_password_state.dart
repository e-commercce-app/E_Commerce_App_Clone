part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordState {
  const RecoveryPasswordState();
}

final class RecoveryPasswordInitial extends RecoveryPasswordState {}

class ForgetPasswordClickState extends RecoveryPasswordState {
  TextEditingController emailAddress;
  GlobalKey<FormState> formKey;
  ForgetPasswordClickState({required this.emailAddress, required this.formKey});
}
