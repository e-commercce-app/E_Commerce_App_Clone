// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import '../../../../../Export/e_commerce_export.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // GlobalKey
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  ProfileBloc() : super(ProfileInitial()) {
    loadingInitData();
    on<UserClickProfileInfoEvent>((event, emit) {
      if (_key.currentState!.validate()) {
        loadingInitData();
      }
    });
  }

  // initialData in TextField .
  void loadingInitData() => emit(UserClickProfileInfoState(
      nameController: nameController,
      emailController: emailController,
      passwordController: passwordController,
      formKey: _key));
}
