import '../../Export/e_commerce_export.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context),
          )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) {
    // var mediaQueryWidth = MediaQuery.sizeOf(context).width;
    var mediaQueryHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mediaQueryHeight * 0.032),
        boxShadow: [
          BoxShadow(blurRadius: 0.1, color: Resources.colors.kGray600)
        ],
      ),
      child: TextFormField(
        cursorColor: Resources.colors.kButtonColor,
        cursorHeight: mediaQueryHeight * 0.03,
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus!,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Resources.colors.kGray600),
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration(context: context, height: mediaQueryHeight),
        validator: validator,
        onChanged: (String value) {
          onChanged!.call(value);
        },
      ),
    );
  }

  InputDecoration decoration({context, height}) {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ??
          Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Resources.colors.kGray600),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints ??
          const BoxConstraints(
            maxHeight: 48,
          ),
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints ??
          const BoxConstraints(
            maxHeight: 48,
          ),
      isDense: true,
      contentPadding: contentPadding ??
          const EdgeInsets.only(
            left: 20,
          ),
      fillColor: fillColor ?? Resources.colors.kWhiteA700,
      filled: filled,
      border: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.03),
            borderSide: BorderSide.none,
          ),
      enabledBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.03),
            borderSide: BorderSide.none,
          ),
      focusedBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.03),
            borderSide: BorderSide.none,
          ),
    );
  }
}
