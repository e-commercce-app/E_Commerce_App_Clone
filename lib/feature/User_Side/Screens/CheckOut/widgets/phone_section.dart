import 'package:e_commerce/Export/e_commerce_export.dart';

class PhoneSection extends StatelessWidget {
  const PhoneSection({
    required this.size,
    required this.phoneController,
    super.key,
  });
  final Size size;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBox(heightRatio: 0.03),
        AutoSizeText(
          number,
          style: Resources.textStyle
              .userNameTextStyle(size: size)
              .copyWith(fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        CustomTextFormField(
          controller: phoneController,
          textInputType: TextInputType.name,
          hintText: '03034...',
          borderRadius: BorderRadius.circular(15),
          contentPadding: const EdgeInsets.all(12),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter A Number';
            } else if (value.length <= 11) {
              return 'Minimum 11 Character .';
            }
            return null;
          },
        ),
      ],
    );
  }
}
