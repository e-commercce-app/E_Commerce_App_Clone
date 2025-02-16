import 'package:pay/pay.dart';
import '../../../../Export/e_commerce_export.dart';
import 'Components/google_payment_app_bar.dart';
import 'Components/payement_list.dart';

class CustomPaymentWidget extends StatefulWidget {
  const CustomPaymentWidget({super.key});

  @override
  State<CustomPaymentWidget> createState() => _CustomPaymentWidgetState();
}

class _CustomPaymentWidgetState extends State<CustomPaymentWidget> {
  late final Future<PaymentConfiguration> _googlePayConfigFuture;

  @override
  void initState() {
    super.initState();
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('sample_payment_configuration.json');
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: googlePaymentAppBar(size: size),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 5),
          const AutoSizeText(
            'Amanda\'s Shoes',
            presetFontSizes: [20.0, 15.0, 10.0, 5.0],
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const AutoSizeText(
            '\$50.20',
            presetFontSizes: [15.0, 10.0, 5.0],
            style: TextStyle(
              color: Color(0xff777777),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          const AutoSizeText(
            'Description',
            presetFontSizes: [15.0, 10.0, 5.0],
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const AutoSizeText(
            'A versatile full-zip that you can wear all day long and even...',
            presetFontSizes: [15.0, 10.0, 5.0],
            style: TextStyle(
              color: Color(0xff777777),
              fontSize: 15,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          // Example pay button configured using an asset
          FutureBuilder<PaymentConfiguration>(
              future: _googlePayConfigFuture,
              builder: (context, snapshot) => snapshot.hasData
                  ? GooglePayButton(
                      paymentConfiguration: snapshot.data!,
                      paymentItems: paymentItems,
                      type: GooglePayButtonType.buy,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: onGooglePayResult,
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink()),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
