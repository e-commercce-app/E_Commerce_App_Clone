import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';

class PumaShoesScreen extends StatefulWidget {
  const PumaShoesScreen({super.key});

  @override
  State<PumaShoesScreen> createState() => _PumaShoesScreenState();
}

class _PumaShoesScreenState extends State<PumaShoesScreen> {
  Stream getPumaFetchData() {
    return FirebaseServices.pumaShoesCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseServices.pumaShoesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            return CustomGridView(
              // Using Custom GridView
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                // Map<String, dynamic> data = snapshot.data!.docs[index].data();
                final product = ProductShoesHomePage.fromJson(
                  snapshot.data!.docs[index].data(),
                );
                return CustomProductShoesDesign(
                  // Fetch Images
                  productImage: product.productImage.toString(),
                  productName: product.productName.toString(),
                  productPrice: product.productPrice,
                  heroTag: product.productImage.toString(),
                  onTap: () {
                    // ** Detail Page .
                    NavigatorService.pushNamed(
                      RoutesName.detailScreen,
                      arguments: ProductShoesHomePage(
                        productImage: product.productImage.toString(),
                        productName: product.productName.toString(),
                        productPrice: product.productPrice,
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
