part of 'widgets.dart';

// This widget builds the password input section of the sign-in screen.
class PasswordSection extends StatelessWidget {
  const PasswordSection({
    required this.size,
    required this.state,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    super.key,
  });
  final Size size;
  final SignInClickState state;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            password,
            style: Resources.textStyle.userNameTextStyle(size: size),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const CustomSizedBox(heightRatio: 0.008),
        CustomTextFormField(
          controller: state.password,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          hintText: 'Enter Your Password',
          obscureText: isPasswordVisible,
          suffixIcon: IconButton(
            onPressed: togglePasswordVisibility,
            icon: isPasswordVisible
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.remove_red_eye_outlined),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter a Password.';
            } else if (value.length <= 6) {
              return 'Minimum Six Characters.';
            }
            return null;
          },
        ),
        const CustomSizedBox(heightRatio: 0.02),
      ],
    );
  }
}
