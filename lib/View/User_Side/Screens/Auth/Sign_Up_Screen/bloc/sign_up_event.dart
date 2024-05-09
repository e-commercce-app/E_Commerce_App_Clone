// ignore_for_file: must_be_immutable

abstract class SignUpBlocEvent {}

class SignUpClickEvent extends SignUpBlocEvent {}

class SignUpGoogleEvent extends SignUpBlocEvent {}

// class PasswordCheckObscureEvent extends SignUpBlocEvent {
//   bool obscure = false;
//   PasswordCheckObscureEvent({required this.obscure});
// }

// ! Pick Image Event .
class ImagePickerGalleryEvent extends SignUpBlocEvent {}

// ! Upload Firebase Event .
class UploadImageEvent extends SignUpBlocEvent {}
