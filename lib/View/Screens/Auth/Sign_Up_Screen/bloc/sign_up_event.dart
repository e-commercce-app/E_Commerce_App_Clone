// ignore_for_file: must_be_immutable

abstract class SignUpBlocEvent {}

class SignUpClickEvent extends SignUpBlocEvent {}

class SignUpGoogleEvent extends SignUpBlocEvent {}

class PasswordCheckObscureEvent extends SignUpBlocEvent {
  bool obscure = false;
  PasswordCheckObscureEvent({required this.obscure});
}

// ! Pick Image Event .
class ImagePickerGalleryEvent extends SignUpBlocEvent {}

// ! Upload Firebase Event .
class UploadImageEvent extends SignUpBlocEvent {}



/// Abstract class for all events that can be dispatched from the
///SignUp widget.
///
/// Events must be immutable and implement the [Equatable] interface.

// abstract class SignUpEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// /// Event that is dispatched when the SignUp widget is first created.
// class SignUpInitialEvent extends SignUpEvent {
//   @override
//   List<Object?> get props => [];
// }

// ///Event for changing password visibility
// class ChangePasswordVisibilityEvent extends SignUpEvent {
//   bool value = true;
//   ChangePasswordVisibilityEvent({required this.value});

//   @override
//   List<Object> get props => [value];
// }
