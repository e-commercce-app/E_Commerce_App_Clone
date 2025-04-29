part of 'widget.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Your Name',
          style: Resources.textStyle.userNameTextStyle(size: size),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              controller: (state as SignUpClickState).nameController,
              textInputType: TextInputType.name,
              hintText: 'E_commerce',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter A Name';
                } else if (value.length <= 4) {
                  return 'Username should be less than 4 characters.';
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
