import '../../Export/e_commerce_export.dart';

class CustomSearchClickView extends StatelessWidget {
  const CustomSearchClickView({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: size.height * 0.06,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Resources.colors.kWhite,
          borderRadius: BorderRadius.circular(size.height * 0.032),
          boxShadow: [
            BoxShadow(blurRadius: 0.1, color: Resources.colors.kGray600)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText("Looking for shoes search.....",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Resources.colors.kGray600)),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.clear,
                    size: 20,
                    color: Resources.colors.kGray600,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
