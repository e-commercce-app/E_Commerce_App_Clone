import 'package:e_commerce/Controller/Services/firebase_services.dart';

import '../../../../../Components/Widgets/custom_grid_view_design.dart';
import '../../../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../../../Export/e_commerce_export.dart';
import '../../../../../Models/shoes_product_home_page.dart';

class ReebokShoesScreen extends StatefulWidget {
  const ReebokShoesScreen({super.key});

  @override
  State<ReebokShoesScreen> createState() => _ReebokShoesScreenState();
}

class _ReebokShoesScreenState extends State<ReebokShoesScreen> {
  Stream getReebokShoesFetchData() {
    return FirebaseServices.reebokShoesCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getReebokShoesFetchData(),
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
