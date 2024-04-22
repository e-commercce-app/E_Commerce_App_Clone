import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Controller/Services/Controller/get_favorite_data.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../Components/Error/empty_favorite_page.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import 'package:e_commerce/Models/add_to_favorite_item.dart';

import 'Components/custom_dialog_delete_favorite.dart';
import 'Components/custom_favorite_design.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  MyFavoriteGetItem getFavoriteData = MyFavoriteGetItem();
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // ! Press delete icon and delete list of item one by one .
  Future<void> deleteItem({required String itemId}) {
    return firestore
        .collection("UserDetails")
        .doc(user!.uid)
        .collection("addToFavorite")
        .doc(itemId)
        .delete();
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: getFavoriteData.getFavoriteItemData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: AutoSizeText(
                noFoundFavoritePage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? const WishListNotFound()
                : Column(
                    children: [
                      // ! Custom favorite App Bar
                      customFavoriteAppBar(snapshot),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return CustomFavoriteItemDesign(
                              imagePath: snapshot.data![index].favoriteImageUrl
                                  .toString(),
                              productName:
                                  snapshot.data![index].favoriteName.toString(),
                              productPrice:
                                  snapshot.data![index].favoritePrice ?? 0,
                              positionStaggeredList: snapshot.data?.length ?? 0,
                              deleteButton: () {
                                // ! Delete Favorite item Show Dialog
                                customDeleteFavoriteDialog(
                                  context: context,
                                  snapshot: snapshot,
                                  index: index,
                                  size: size,
                                  onPressedOky: () {
                                    log(snapshot.data![index].favoriteID
                                        .toString());
                                    deleteItem(
                                            itemId: snapshot
                                                .data![index].favoriteID
                                                .toString())
                                        .then((value) {
                                      NavigatorService.goBack();
                                      CustomDialog.toastMessage(
                                          message: deleteFavorite);
                                    });
                                    setState(() {});
                                  },
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  // ! Custom favorite App Bar
  CustomAppBar customFavoriteAppBar(
      AsyncSnapshot<List<FavorIteItemModelClass>> snapshot) {
    return CustomAppBar(
      size: size,
      centerTitle: true,
      title: const AutoSizeText("Favorite"),
      actions: [
        AppBarLeadingIconButtonOne(
            onTap: null,
            child: AutoSizeText("${snapshot.data!.length.toInt()}")),
      ],
    );
  }
}
