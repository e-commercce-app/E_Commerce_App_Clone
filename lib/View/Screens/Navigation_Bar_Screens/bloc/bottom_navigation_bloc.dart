// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial(index: 0)) {
    on<BottomNavigationEvent>((event, emit) {
      emit(BottomNavigationInitial(index: event.currentIndex));
    });
  }
}
