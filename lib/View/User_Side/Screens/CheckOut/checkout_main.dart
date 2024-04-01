import 'package:e_commerce/Export/e_commerce_export.dart';

import 'Components/checkout_app_bar.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: checkOutAppBar(size: size),
    );
  }
}
