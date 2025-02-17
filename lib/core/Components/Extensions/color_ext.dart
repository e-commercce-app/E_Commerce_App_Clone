// ignore_for_file: deprecated_member_use

part of 'extension.dart';

extension ColorEx on String {
  Color toColorExt() {
    if (isEmpty) return Colors.white;
    if (startsWith('#') && length == 7) {
      return Color(int.parse('0xff${substring(1)}'));
    } else if (length == 6) {
      return Color(int.parse('0xff$this'));
    } else if (startsWith('0xff') || startsWith('0xFF')) {
      return Color(int.parse(this));
    }
    return Colors.white;
  }
}

class ColorsCovertHexaDecimal {
  // ! Convert Color to hex string without hash (#)
  String colorToHex(Color color) {
    final alpha = color.alpha;
    final hexValue =
        color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return alpha == 255 ? hexValue.substring(2) : hexValue.substring(2);
  }

// ! Convert hex string without hash (#) to Color
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 8) {
      buffer
        ..write('ff')
        ..write(hexString);
    } else if (hexString.length == 7 && hexString[0] == '#') {
      buffer.write(hexString.substring(1));
    } else {
      throw ArgumentError('Invalid hex color string');
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
