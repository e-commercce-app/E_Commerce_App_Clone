part of 'widget.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Phone Number',
          style: Resources.textStyle.userNameTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              controller: (state as SignUpClickState).phoneController,
              textInputType: TextInputType.phone,
              hintText: 'Enter Your Phone No',
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Phone Number.';
                } else if (value.length <= 10) {
                  return 'Minimum 11 Number.';
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
