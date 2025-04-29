// This widget builds the email input section of the sign-in screen.
part of 'widgets.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({required this.size, required this.state, super.key});
  final Size size;
  final SignInClickState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            signInEmailAddress,
            style: Resources.textStyle.userNameTextStyle(size: size),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const CustomSizedBox(heightRatio: 0.008),
        CustomTextFormField(
          controller: state.emailAddress,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          hintText: signInEnterEmail,
          validator: (value) {
            if (value == null || !isValidEmail(value, isRequired: true)) {
              return 'Please Enter Valid Email';
            }
            return null;
          },
        ),
        const CustomSizedBox(heightRatio: 0.03),
      ],
    );
  }
}
