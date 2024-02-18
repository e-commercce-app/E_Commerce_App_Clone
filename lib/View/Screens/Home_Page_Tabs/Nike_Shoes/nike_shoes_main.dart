import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:flutter/material.dart';

import '../../../../Components/Widgets/custom_grid_view_design.dart';
import '../../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../../Models/shoes_product_home_page.dart';

class NikeShoesScreen extends StatefulWidget {
  const NikeShoesScreen({super.key});

  @override
  State<NikeShoesScreen> createState() => _NikeShoesScreenState();
}

class _NikeShoesScreenState extends State<NikeShoesScreen> {
  Stream getNikeShoesData() {
    return FirebaseServices.nikeShoesCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: getNikeShoesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            return CustomGridView(
              // Using Custom GridView
              itemCount: snapshot.data?.docs.length,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 2, mainAxisExtent: 250),
              itemBuilder: (context, int index) {
                // Map<String, dynamic> data = snapshot.data!.docs[index].data();
                ProductShoesHomePage product = ProductShoesHomePage.fromJson(
                    snapshot.data!.docs[index].data());
                return CustomProductShoesDesign(
                  productShoes: ProductShoesHomePage(
                      productImage: product.productImage.toString(),
                      productName: product.productName.toString(),
                      productPrice: product.productPrice),
                  heroTag: product.productImage.toString(),
                  onTap: () {
                    NavigatorService.pushNamed(RoutesName.detailScreen,
                        arguments: ProductShoesHomePage(
                            productImage: product.productImage.toString(),
                            productName: product.productName.toString(),
                            productPrice: product.productPrice));
                  },
                );
              },
            );
          } else {
            return Center(child: Text(snapshot.error.toString()));
          }
        },
      ),
    );
  }
}
