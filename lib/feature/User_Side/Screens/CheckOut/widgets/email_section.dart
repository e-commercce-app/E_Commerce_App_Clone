import 'package:e_commerce/Export/e_commerce_export.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({
    required this.size,
    required this.emailController,
    super.key,
  });
  final Size size;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBox(heightRatio: 0.03),
        Text(
          signInEmailAddress,
          style: Resources.textStyle
              .userNameTextStyle(size: size)
              .copyWith(fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        CustomTextFormField(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          hintText: signInEnterEmail,
          borderRadius: BorderRadius.circular(15),
          contentPadding: const EdgeInsets.all(12),
          validator: (value) {
            if (value == null || !isValidEmail(value, isRequired: true)) {
              return 'Please Enter Valid Email';
            }
            return null;
          },
        ),
      ],
    );
  }
}
