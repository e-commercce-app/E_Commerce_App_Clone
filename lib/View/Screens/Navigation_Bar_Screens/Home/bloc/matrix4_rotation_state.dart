part of 'matrix4_rotation_bloc.dart';

sealed class Matrix4RotationState {
  const Matrix4RotationState();
}

final class Matrix4RotationInitial extends Matrix4RotationState {}

class RotationMatrixState extends Matrix4RotationState {
  double xOffset;
  double yOffset;
  bool isDrawerOpen = false;
  RotationMatrixState(
      {required this.xOffset,
      required this.yOffset,
      required this.isDrawerOpen});
}
