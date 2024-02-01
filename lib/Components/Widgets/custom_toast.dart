import 'package:fluttertoast/fluttertoast.dart';

import '../../Export/e_commerce_export.dart';

Future<bool?> toastMessage({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Resources.colors.buttonColor,
      textColor: Colors.white,
      fontSize: 10.0);
}
