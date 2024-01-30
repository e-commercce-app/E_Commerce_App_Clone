// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(SignUpState signUpInitialState) : super(signUpInitialState) {
    on<SignUpInitialEvent>(_initialValue);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibilityEvent);
  }

  // password Icon Change method
  void _changePasswordVisibilityEvent(
      ChangePasswordVisibilityEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(passwordChangeIcons: event.value));
  }

  // initial state of TextEditingController .
  void _initialValue(
      SignUpInitialEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        emailAddressController: TextEditingController(),
        passwordController: TextEditingController(),
        userNameController: TextEditingController(),
        passwordChangeIcons: state.passwordChangeIcons));
  }
}
