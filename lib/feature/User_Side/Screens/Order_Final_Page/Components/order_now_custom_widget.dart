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
    required this.height,
    required this.width,
    super.key,
  });

  final String orderCustomerName;
  final String orderPhoneNo;
  final String orderAddress;
  final void Function() deleteOrderNow;
  final int positionStaggeredList;
  final String? orderStatus;
  final double height;
  final double width;

  static const Map<String, Map<String, dynamic>> statusMap = {
    'pending': {
      'label': 'Pending',
      'icon': Icons.hourglass_empty,
      'color': Colors.orange,
    },
    'processing': {
      'label': 'Processing',
      'icon': Icons.settings,
      'color': Colors.blue,
    },
    'shipped': {
      'label': 'Shipped',
      'icon': Icons.local_shipping,
      'color': Colors.purple,
    },
    'delivered': {
      'label': 'Delivered',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    'cancelled': {
      'label': 'Cancelled',
      'icon': Icons.cancel,
      'color': Colors.red,
    },
  };

  @override
  Widget build(BuildContext context) {
    // Use the provided height and width for responsiveness
    final screenHeight = height;
    final screenWidth = width;

    // * Responsive paddings and font sizes based on provided width/height
    final padding = screenWidth * 0.045;
    final iconSize = screenWidth * 0.07;
    final titleFont = screenWidth * 0.045;
    final subFont = screenWidth * 0.041;

    // * Get status info from map, fallback to pending
    final statusKey = (orderStatus ?? 'pending').toLowerCase();
    final statusInfo = statusMap[statusKey] ?? statusMap['pending'];

    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth * 0.92,
      child: AnimationConfiguration.staggeredList(
        position: positionStaggeredList,
        duration: const Duration(milliseconds: 1000),
        child: SlideAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          verticalOffset: 50,
          child: FadeInAnimation(
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.92,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Resources.colors.kWhite,
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
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
                  iconSize: iconSize,
                  text: 'User Name: $orderCustomerName',
                  textStyle: TextStyle(
                    fontSize: titleFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  trailing: IconButton(
                    onPressed: deleteOrderNow,
                    icon: Icon(
                      Icons.delete_forever,
                      color: Resources.colors.kRedColor.withOpacity(0.8),
                      size: iconSize,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildRow(
                  icon: Icons.phone,
                  iconColor: Colors.green.shade600,
                  iconSize: iconSize,
                  text: 'Phone No: $orderPhoneNo',
                  textStyle: TextStyle(
                    fontSize: subFont,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildResponsiveRow(
                  icon: Icons.location_on,
                  iconColor: Colors.orange.shade600,
                  iconSize: iconSize,
                  text: 'Address: $orderAddress',
                  textStyle: TextStyle(
                    fontSize: subFont,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildRow(
                  icon: statusInfo!['icon'] as IconData,
                  iconColor: statusInfo['color'] as Color,
                  iconSize: iconSize,
                  text: 'Order Status: ${statusInfo['label']}',
                  textStyle: TextStyle(
                    fontSize: subFont,
                    fontWeight: FontWeight.w600,
                    color: (statusInfo['color'] ?? Colors.orange) as Color,
                  ),
                ),
              ].addColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        ),
      ),
    ).paddingAll(padding / 2);
  }

  Widget _buildRow({
    required IconData icon,
    required Color iconColor,
    required String text,
    required TextStyle textStyle,
    double iconSize = 24,
    Widget? trailing,
  }) {
    return <Widget>[
      Expanded(
        child: <Widget>[
          Icon(icon, color: iconColor, size: iconSize),
          SizedBox(width: iconSize * 0.32),
          Expanded(
            child: AutoSizeText(
              text,
              style: textStyle,
              minFontSize: 10,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
    double iconSize = 24,
  }) {
    return <Widget>[
      Icon(icon, color: iconColor, size: iconSize),
      SizedBox(width: iconSize * 0.32),
      Expanded(
        child: AutoSizeText(
          text,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          minFontSize: 10,
        ),
      ),
    ].addRow(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
