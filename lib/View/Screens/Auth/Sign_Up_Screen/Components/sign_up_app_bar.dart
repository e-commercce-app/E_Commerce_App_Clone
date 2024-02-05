import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';

import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Export/e_commerce_export.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      size: size,
      leading: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [BoxShadow(color: Resources.colors.grey)],
              color: Resources.colors.white),
          child: IconButton(
              onPressed: () =>
                  NavigatorService.pushNamed(RoutesName.homeScreen),
              icon: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              )),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(size.width, size.height * 0.07);
}
