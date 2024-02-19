import '../../Export/e_commerce_export.dart';

class CustomDialog {
  static Future<bool?> toastMessage({required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Resources.colors.kButtonColor,
        textColor: Colors.white,
        fontSize: 10.0);
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )));
  }
}
