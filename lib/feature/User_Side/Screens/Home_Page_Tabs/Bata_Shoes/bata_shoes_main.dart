import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';

class BataShoesScreen extends StatefulWidget {
  const BataShoesScreen({super.key});

  @override
  State<BataShoesScreen> createState() => _BataShoesScreenState();
}

class _BataShoesScreenState extends State<BataShoesScreen> {
  Stream getBataShoesFetchData() {
    return FirebaseServices.bataShoesCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseServices.bataShoesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            return CustomGridView(
              // Using Custom GridView
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
                  isSale: product.isSale,
                  salePrice: product.salePrice,
                  heroTag: product.productImage.toString(),
                  onTap: () {
                    // ** Detail Page .
                    NavigatorService.pushNamed(
                      RoutesName.detailScreen,
                      arguments: ProductShoesHomePageModel(
                        productImage: product.productImage.toString(),
                        productName: product.productName.toString(),
                        salePrice: product.salePrice,
                        fullPrice: product.fullPrice,
                        isSale: product.isSale,
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
