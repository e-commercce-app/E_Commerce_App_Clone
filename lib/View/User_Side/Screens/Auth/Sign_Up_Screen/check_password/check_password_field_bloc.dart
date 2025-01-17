// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'check_password_field_event.dart';
part 'check_password_field_state.dart';

class CheckPasswordFieldBloc
    extends Bloc<CheckPasswordFieldEvent, CheckPasswordFieldState> {
  CheckPasswordFieldBloc()
      : super(const CheckPasswordFieldState(
            color: Colors.blueGrey, obsqure: true)) {
    on<CheckPassWordVisibilityEvent>((event, emit) {
      if (event.isVisible) {
        emit(const CheckPasswordFieldState(color: Colors.blue, obsqure: false));
      } else {
        emit(const CheckPasswordFieldState(
            color: Colors.blueGrey, obsqure: true));
      }
    });
  }
}
