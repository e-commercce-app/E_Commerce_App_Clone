part of 'widget.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Email Address',
          style: Resources.textStyle.userNameTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              controller: (state as SignUpClickState).emailController,
              textInputType: TextInputType.emailAddress,
              hintText: 'Enter Email',
              validator: (value) {
                if (value == null || !isValidEmail(value, isRequired: true)) {
                  return 'Please Enter Valid Email';
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
