part of 'widget.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    super.key,
  });
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Password',
          style: Resources.textStyle.userNameTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              controller: (state as SignUpClickState).passwordController,
              textInputType: TextInputType.visiblePassword,
              hintText: 'Enter Your Password',
              textInputAction: TextInputAction.done,
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
                  return 'Minimum Six Number.';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}
