import 'package:e_commerce/Export/e_commerce_export.dart';

class NameSection extends StatelessWidget {
  const NameSection({
    required this.size,
    required this.nameController,
    super.key,
  });
  final Size size;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBox(heightRatio: 0.008),
        AutoSizeText(
          yourName,
          style: Resources.textStyle
              .userNameTextStyle(size: size)
              .copyWith(fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const CustomSizedBox(heightRatio: 0.008),
        CustomTextFormField(
          controller: nameController,
          textInputType: TextInputType.name,
          hintText: eCommerce,
          borderRadius: BorderRadius.circular(15),
          contentPadding: const EdgeInsets.all(12),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter A Name';
            } else if (value.length <= 4) {
              return 'Username should be less than 4 characters.';
            }
            return null;
          },
        ),
      ],
    );
  }
}
