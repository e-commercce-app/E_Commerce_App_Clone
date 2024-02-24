import 'package:e_commerce/Components/Resources/resources.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import '../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../Export/e_commerce_export.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseServices.bataShoesCollection.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircleAvatar(),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                // Custom App Bar
                myCartAppBar(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Text("E_Commerence");
                    },
                  ),
                ),
                Container(
                  height: size.height * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Resources.colors.kWhite,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Resources.colors.kGrey)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                      Divider(
                        color: Resources.colors.kGray600.withOpacity(0.4),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return AutoSizeText("Error ${snapshot.error.toString()}");
          }
        },
      ),
    );
  }

  // Sign Up Custom AppBar Section
  CustomAppBar myCartAppBar() {
    return CustomAppBar(
      size: size,
      leading: AppBarLeadingIconButtonOne(
        onTap: () => NavigatorService.goBack(),
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
      ),
      centerTitle: true,
      title: const AutoSizeText("My Cart"),
    );
  }
}
