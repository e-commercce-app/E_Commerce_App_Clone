import 'dart:developer';

import 'package:e_commerce/Export/e_commerce_export.dart';

import 'package:e_commerce/Models/shoes_product_home_page.dart';

class SaleShoesProductScreen extends StatefulWidget {
  const SaleShoesProductScreen({required this.categoryId, super.key});
  final String categoryId;
  @override
  State<SaleShoesProductScreen> createState() => _SaleShoesProductScreenState();
}

class _SaleShoesProductScreenState extends State<SaleShoesProductScreen> {
  // Stream getNikeShoesData() {
  //   return FirebaseServices.saleShoesCollection.snapshots();
  // }

  @override
  void initState() {
    super.initState();
    log('Current Ids : ${widget.categoryId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseServices.productsCollection
            .where('categoryId', isEqualTo: widget.categoryId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            return CustomGridView(
              //! Using Custom GridView
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                // Map<String, dynamic> data = snapshot.data!.docs[index].data();
                final product = ProductShoesHomePageModel.fromJson(
                  snapshot.data!.docs[index].data(),
                );
                return CustomProductShoesDesign(
                  // Fetch Images
                  productImage: product.productImage.toString(),
                  productName: product.productName.toString(),
                  fullPrice: product.fullPrice,
                  salePrice: product.salePrice,
                  isSale: product.isSale,
                  heroTag: product.productImage.toString(),
                  onTap: () {
                    // ** Detail Page .
                    NavigatorService.pushNamed(
                      RoutesName.detailScreen,
                      arguments: ProductShoesHomePageModel(
                        productImage: product.productImage.toString(),
                        productName: product.productName.toString(),
                        fullPrice: product.fullPrice,
                        salePrice: product.salePrice,
                        isSale: product.isSale,
                        categoryId: product.categoryId,
                      ),
                    );
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
