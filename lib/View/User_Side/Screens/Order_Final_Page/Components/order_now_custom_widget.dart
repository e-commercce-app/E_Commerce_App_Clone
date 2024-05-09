// ! OrderNow Design Item Design .

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../Export/e_commerce_export.dart';

class OrderNowCustomWidget extends StatefulWidget {
  const OrderNowCustomWidget({
    super.key,
    required this.orderCustomerName,
    required this.orderPhoneNo,
    required this.orderAddress,
    required this.deleteOrderNow,
    required this.positionStaggeredList,
  });
  final String orderCustomerName;
  final String orderPhoneNo;
  final String orderAddress;
  final void Function() deleteOrderNow;
  final int positionStaggeredList;
  @override
  State<OrderNowCustomWidget> createState() => _OrderNowCustomWidgetState();
}

class _OrderNowCustomWidgetState extends State<OrderNowCustomWidget> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * 0.2,
        child: AnimationConfiguration.staggeredList(
          position: widget.positionStaggeredList,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                          color: Color.fromRGBO(189, 189, 189, 1))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          productNameText(
                              name:
                                  "User Name: \t\t${widget.orderCustomerName}",
                              fontSize: 15),
                          IconButton(
                              onPressed: widget.deleteOrderNow,
                              icon: Icon(
                                Icons.delete_forever,
                                color: Resources.colors.kBlack,
                              ))
                        ],
                      ),
                      productNameText(
                          name: "Phone No: \t\t ${widget.orderPhoneNo}",
                          fontSize: 15),
                      productNameText(
                          name: "Address: \t\t ${widget.orderAddress}",
                          fontSize: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
