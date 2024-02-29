part of 'profile_bloc.dart';

abstract class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {}

class UserClickProfileInfoState extends ProfileState {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey formKey;
  UserClickProfileInfoState({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
}
