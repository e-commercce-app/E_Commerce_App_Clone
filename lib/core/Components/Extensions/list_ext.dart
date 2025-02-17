part of 'extension.dart';

extension ListOfExtension on List<Widget> {
  // ! addColumn
  Column addColumn({
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }

  // ! addRow
  Row addRow({
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }

  //! ListView
  ListView addListView({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    double Function(int, SliverLayoutDimensions)? itemExtentBuilder,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) {
    return ListView(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      itemExtent: itemExtent,
      keyboardDismissBehavior: keyboardDismissBehavior,
      itemExtentBuilder: itemExtentBuilder,
      padding: padding,
      physics: physics,
      reverse: reverse,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      semanticChildCount: semanticChildCount,
      children: this,
    );
  }
}
