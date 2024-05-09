import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Components/Error/empty_favorite_page.dart';
import '../../../../Controller/Services/Controller/get_order_data.dart';
import '../../../../Export/e_commerce_export.dart';
import 'Components/order_custom_app_bar.dart';
import 'Components/order_now_custom_widget.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({super.key});

  @override
  State<OrderNowScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderNowScreen> {
  OrderNowFetchDataMethod orderNow = OrderNowFetchDataMethod();

  Future<void> deleteOrderNowFirebase({required String itemDeleteUid}) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection("UserDetails")
        .doc(user!.uid)
        .collection("MyOrder")
        .doc(itemDeleteUid)
        .delete();
  }

  // Screen Size .
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: orderAppBar(size: size),
      body: FutureBuilder(
        future: orderNow.getOrderNowData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: AutoSizeText(
                "No Found Favorite Page Data ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? const WishListNotFound()
                : ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return OrderNowCustomWidget(
                        orderCustomerName:
                            snapshot.data![index].orderName.toString(),
                        orderPhoneNo:
                            snapshot.data![index].orderPhone.toString(),
                        orderAddress:
                            snapshot.data![index].orderLocation.toString(),
                        positionStaggeredList: snapshot.data!.length,
                        deleteOrderNow: () {
                          deleteOrderNowFirebase(
                              itemDeleteUid:
                                  snapshot.data![index].orderUid.toString());
                        },
                      );
                    },
                  );
          } else {
            return Center(
              child: Text(noFoundData),
            );
          }
        },
      ),
    );
  }
}
