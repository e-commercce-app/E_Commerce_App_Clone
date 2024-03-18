import 'package:e_commerce/Controller/Services/firebase_services.dart';

import '../../../../../Components/Widgets/custom_grid_view_design.dart';
import '../../../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../../../Export/e_commerce_export.dart';
import '../../../../../Models/shoes_product_home_page.dart';

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
        stream: getBataShoesFetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData) {
            return CustomGridView(
              // Using Custom GridView
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                // Map<String, dynamic> data = snapshot.data!.docs[index].data();
                ProductShoesHomePage product = ProductShoesHomePage.fromJson(
                    snapshot.data!.docs[index].data());
                return CustomProductShoesDesign(
                  // Fetch Images
                  productImage: product.productImage.toString(),
                  productName: product.productName.toString(),
                  productPrice: product.productPrice,
                  heroTag: product.productImage.toString(),
                  onTap: () {
                    // ** Detail Page .
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
