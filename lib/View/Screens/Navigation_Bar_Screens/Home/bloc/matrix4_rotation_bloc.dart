// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';

part 'matrix4_rotation_event.dart';
part 'matrix4_rotation_state.dart';

class Matrix4RotationBloc
    extends Bloc<Matrix4RotationEvent, Matrix4RotationState> {
  // Initial Value .
  double xOffset = 0.0;
  double yOffset = 0.0;
  bool isDrawerOpen = false;

  Matrix4RotationBloc() : super(Matrix4RotationInitial()) {
    // Handle initial State .
    emit(RotationMatrixState(
        xOffset: xOffset, yOffset: yOffset, isDrawerOpen: isDrawerOpen));

    on<RotationHomePageEvents>((event, emit) {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen == true) {
        xOffset = 290.0;
        yOffset = 80.0;
        emit(RotationMatrixState(
            xOffset: xOffset, yOffset: yOffset, isDrawerOpen: isDrawerOpen));
      } else {
        xOffset = 0.0;
        yOffset = 0.0;
        emit(RotationMatrixState(
            xOffset: xOffset, yOffset: yOffset, isDrawerOpen: isDrawerOpen));
      }
    });
  }
}
