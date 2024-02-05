import 'package:bloc/bloc.dart';

// Events
enum PasswordVisibilityEvent { toggle }

// States
enum PasswordVisibilityState { hidden, visible }

class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordVisibilityState.hidden);

  @override
  Stream<PasswordVisibilityState> mapEventToState(
      PasswordVisibilityEvent event) async* {
    if (event == PasswordVisibilityEvent.toggle) {
      yield state == PasswordVisibilityState.hidden
          ? PasswordVisibilityState.visible
          : PasswordVisibilityState.hidden;
    }
  }
}
