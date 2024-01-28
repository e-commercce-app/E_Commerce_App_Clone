import 'package:bloc/bloc.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(SignUpState signUpInitialState) : super(signUpInitialState) {
    on<SignUpInitialEvent>(_initialValue);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibilityEvent);
  }

  // password Icon Change method
  void _changePasswordVisibilityEvent(
      ChangePasswordVisibilityEvent event, Emitter<SignUpState> state) {}

  // initial state of TextEditingController .
  void _initialValue(
      SignUpInitialEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        emailAddressController: TextEditingController(),
        passwordController: TextEditingController(),
        userNameController: TextEditingController(),
        passwordChangeIcons: true));
  }
}
