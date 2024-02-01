part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordEvent {
  const RecoveryPasswordEvent();
}

class ForgetPasswordClickEvent extends RecoveryPasswordEvent {}
