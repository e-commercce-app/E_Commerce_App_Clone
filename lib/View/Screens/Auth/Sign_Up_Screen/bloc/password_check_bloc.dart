import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_check_event.dart';
part 'password_check_state.dart';

class PasswordCheckBloc extends Bloc<PasswordCheckEvent, PasswordCheckState> {
  PasswordCheckBloc() : super(PasswordCheckInitial()) {
    on<PasswordCheckEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
