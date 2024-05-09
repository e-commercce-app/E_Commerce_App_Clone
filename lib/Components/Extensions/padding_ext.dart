import '../../Export/e_commerce_export.dart';

/// `Message` Padding extension .

extension CustomPadding on Widget {
  // ! Padding All
  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  // ! Padding Left .
  Widget paddingLeft(double paddingLeft) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: this,
    );
  }

  // ! Padding Right .
  Widget paddingRight(double paddingRight) {
    return Padding(
      padding: EdgeInsets.only(right: paddingRight),
      child: this,
    );
  }

  // ! Padding bottom .
  Widget paddingBottom(double paddingBottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: this,
    );
  }

  // ! Padding bottom .
  Widget paddingTop(double paddingTop) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: this,
    );
  }

  // ! Padding Horizontal .
  Widget paddingHorizontal(double paddingHorizontal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: this,
    );
  }

  // ! Padding Vertical .
  Widget paddingVertical(double paddingVertical) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingVertical),
      child: this,
    );
  }
}
