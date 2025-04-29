import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Google_Payement/custom_google_payement.dart';

class PaymentButtons extends StatelessWidget {
  const PaymentButtons({
    required this.size,
    required this.formKey,
    required this.handleOrderSubmission,
    super.key,
  });
  final Size size;
  final GlobalKey<FormState> formKey;
  final Future<void> Function() handleOrderSubmission;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(heightRatio: 0.03),
        CustomButton(
          size: size,
          onPressed: () => NavigatorService.push(
            MaterialPageRoute(
              builder: (context) => const CustomPaymentWidget(),
            ),
          ),
          background: Resources.colors.kBlack,
          buttonText: googlePayment,
        ),
        const CustomSizedBox(heightRatio: 0.03),
        CustomButton(
          size: size,
          onPressed: handleOrderSubmission,
          buttonText: payment,
        ),
      ],
    );
  }
}
