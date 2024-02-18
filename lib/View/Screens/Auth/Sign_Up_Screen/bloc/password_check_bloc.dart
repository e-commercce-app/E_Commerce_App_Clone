// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
part 'password_check_event.dart';
part 'password_check_state.dart';

class PasswordCheckBloc extends Bloc<PasswordCheckEvent, PasswordCheckState> {
  PasswordCheckBloc() : super(PasswordConfirmState(checkPassword: true)) {
    on<PasswordCheckEvent>((event, emit) {
      emit(PasswordConfirmState(checkPassword: event.obscurePassword));

      if (event.obscurePassword == false) {
        emit(PasswordConfirmState(checkPassword: event.obscurePassword));
      } else if (event.obscurePassword == true) {
        emit(PasswordConfirmState(checkPassword: event.obscurePassword));
      }
    });
  }
}
