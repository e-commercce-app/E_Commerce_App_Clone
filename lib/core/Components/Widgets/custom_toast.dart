import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomDialog {
  /// `message` show Toast Message .
  static Future<bool?> toastMessage({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Resources.colors.kButtonColor,
      textColor: Colors.white,
      fontSize: 10,
    );
  }

  /// `message` show Progress Bar .
  static void showProgressBar(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }

  /// `message` Custom SnackBar message .
  static void showCustomSnackBar({
    required BuildContext context,
    required String? title,
    required String? message,
    required ContentType? contentType,
  }) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? 'On Snap!',
        message: message ??
            'This is an example error message that will be shown in the body of snackbar!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType ?? ContentType.warning,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
