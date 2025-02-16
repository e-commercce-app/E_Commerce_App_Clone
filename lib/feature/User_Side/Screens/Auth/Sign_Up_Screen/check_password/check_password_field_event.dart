part of 'check_password_field_bloc.dart';

@immutable
sealed class CheckPasswordFieldEvent {
  const CheckPasswordFieldEvent();
}

@immutable 
class CheckPassWordVisibilityEvent extends CheckPasswordFieldEvent{
  const CheckPassWordVisibilityEvent(this.isVisible);
  final bool isVisible;
}
