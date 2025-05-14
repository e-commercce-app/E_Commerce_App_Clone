import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/core/Components/Extensions/extension.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OrderNowCustomWidget extends StatelessWidget {
  const OrderNowCustomWidget({
    required this.orderCustomerName,
    required this.orderPhoneNo,
    required this.orderAddress,
    required this.deleteOrderNow,
    required this.positionStaggeredList,
    required this.orderStatus,
    super.key,
  });

  final String orderCustomerName;
  final String orderPhoneNo;
  final String orderAddress;
  final void Function() deleteOrderNow;
  final int positionStaggeredList;
  final String? orderStatus;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.25,
      width: screenWidth * 0.9,
      child: AnimationConfiguration.staggeredList(
        position: positionStaggeredList,
        duration: const Duration(milliseconds: 1000),
        child: SlideAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          verticalOffset: 50,
          child: FadeInAnimation(
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.9,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Resources.colors.kWhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color.fromRGBO(220, 220, 220, 1),
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: <Widget>[
                _buildRow(
                  icon: Icons.person,
                  iconColor: Resources.colors.kBlue,
                  text: 'User Name: $orderCustomerName',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  trailing: IconButton(
                    onPressed: deleteOrderNow,
                    icon: Icon(
                      Icons.delete_forever,
                      color: Resources.colors.kRedColor.withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildRow(
                  icon: Icons.phone,
                  iconColor: Colors.green.shade600,
                  text: 'Phone No: $orderPhoneNo',
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                _buildResponsiveRow(
                  icon: Icons.location_on,
                  iconColor: Colors.orange.shade600,
                  text: 'Address: $orderAddress',
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                _buildRow(
                  icon: Icons.info,
                  iconColor: orderStatus == 'Delivered'
                      ? Colors.green.shade600
                      : Colors.red.shade600,
                  text: 'Order Status: ${orderStatus ?? 'Pending'}',
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: orderStatus == 'Delivered'
                        ? Colors.green.shade600
                        : Colors.red.shade600,
                  ),
                ),
              ].addColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        ),
      ),
    ).paddingAll(8);
  }

  Widget _buildRow({
    required IconData icon,
    required Color iconColor,
    required String text,
    required TextStyle textStyle,
    Widget? trailing,
  }) {
    return <Widget>[
      Expanded(
        child: <Widget>[
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              text,
              style: textStyle,
            ),
          ),
        ].addRow(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      if (trailing != null) trailing,
    ].addRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _buildResponsiveRow({
    required IconData icon,
    required Color iconColor,
    required String text,
    required TextStyle textStyle,
  }) {
    return <Widget>[
      Icon(icon, color: iconColor),
      const SizedBox(width: 8),
      Expanded(
        child: AutoSizeText(
          text,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    ].addRow(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
