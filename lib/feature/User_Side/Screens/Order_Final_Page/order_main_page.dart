import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/core/Components/Error/empty_favorite_page.dart';
import 'package:e_commerce/core/Controller/Services/Controller/get_order_data.dart';
import 'package:e_commerce/feature/User_Side/Screens/Order_Final_Page/Components/order_custom_app_bar.dart';
import 'package:e_commerce/feature/User_Side/Screens/Order_Final_Page/Components/order_now_custom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({super.key});

  @override
  State<OrderNowScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderNowScreen> {
  OrderNowFetchDataMethod orderNow = OrderNowFetchDataMethod();

  Future<void> deleteOrderNowFirebase({required String itemDeleteUid}) {
    final user = FirebaseAuth.instance.currentUser;
    final firestore = FirebaseFirestore.instance;
    return firestore
        .collection('UserDetails')
        .doc(user!.uid)
        .collection('MyOrder')
        .doc(itemDeleteUid)
        .delete();
  }

  // Screen Size .
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return Scaffold(
          appBar: orderAppBar(size: size),
          body: StreamBuilder(
            stream: orderNow.getOrderNowData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                  child: AutoSizeText(
                    'No Found Favorite Page Data ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                return snapshot.data!.isEmpty
                    ? const WishListNotFound()
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 8 : 16,
                          vertical: 8,
                        ),
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: isSmallScreen ? 8 : 12,
                            ),
                            child: OrderNowCustomWidget(
                              orderCustomerName:
                                  snapshot.data![index].orderName.toString(),
                              orderPhoneNo:
                                  snapshot.data![index].orderPhone.toString(),
                              orderAddress: snapshot.data![index].orderLocation
                                  .toString(),
                              positionStaggeredList: snapshot.data!.length,
                              orderStatus:
                                  snapshot.data![index].orderStatus.toString(),
                              deleteOrderNow: () async {
                                final confirmDelete = await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: const Text(
                                          'Are you sure you want to delete this order?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (confirmDelete == true) {
                                  await deleteOrderNowFirebase(
                                    itemDeleteUid: snapshot
                                        .data![index].orderUid
                                        .toString(),
                                  );
                                }
                              },
                            ),
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
      },
    );
  }
}
