part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationState {
  const BottomNavigationState();
}

final class BottomNavigationInitial extends BottomNavigationState {
  int index;
  BottomNavigationInitial({required this.index});
}
