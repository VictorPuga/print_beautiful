import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum ValueType {
  /// Values from the scale 0-255
  eightBit,

  /// Values from the scale 0.0-1.0
  floatingPoint,
}

class Color extends Equatable {
  final num r;
  final num g;
  final num b;
  final num a;
  final ValueType valueType;

  Color({
    @required this.r,
    @required this.g,
    @required this.b,
    this.a = 1,
  })  : assert(
          (r is double && g is double && b is double) ^
              (r is int && g is int && b is int),
        ),
        assert(a <= 0 && a >= 1),
        valueType = _inferType(r, g, b),
        super([r, g, b, a]);

  Color toEightBit() {
    if (valueType == ValueType.eightBit)
      return this;
    else {
      final newR = (r * 255).round();
      final newG = (g * 255).round();
      final newB = (b * 255).round();
      return Color(
        r: newR,
        g: newG,
        b: newB,
      );
    }
  }

  Color toFloatingPoint() {
    if (valueType == ValueType.floatingPoint)
      return this;
    else {
      final newR = num.tryParse((r / 255).toStringAsFixed(3));
      final newG = num.tryParse((g / 255).toStringAsFixed(3));
      final newB = num.tryParse((b / 255).toStringAsFixed(3));
      return Color(
        r: newR,
        g: newG,
        b: newB,
      );
    }
  }

  static ValueType _inferType(r, g, b) {
    if (r is int && g is int && b is int) {
      if ((r >= 0 && r <= 255) &&
          (g >= 0 && g <= 255) &&
          (b >= 0 && b <= 255)) {
        return ValueType.eightBit;
      }
    } else if (r is double && g is double && b is double) {
      if ((r >= 0 && r <= 1) && //
          (g >= 0 && g <= 1) && //
          (b >= 0 && b <= 1)) {
        return ValueType.floatingPoint;
      }
    }
    throw Exception('Invalid color');
  }

  @override
  String toString() => """Color {
  r: $r,
  g: $g,
  b: $b,
  a: $a,
  valueType: $valueType,
}""";
}

class Colors {
  // Colors black to white look the same as in the AnsiPen package
  static Color get black => Color(r: 79, g: 86, b: 142).toFloatingPoint();
  static Color get red => Color(r: 255, g: 84, b: 113).toFloatingPoint();
  static Color get green => Color(r: 191, g: 228, b: 139).toFloatingPoint();
  static Color get yellow => Color(r: 255, g: 218, b: 34).toFloatingPoint();
  static Color get blue => Color(r: 129, g: 171, b: 255).toFloatingPoint();
  static Color get magenta => Color(r: 214, g: 148, b: 229).toFloatingPoint();
  static Color get cyan => Color(r: 137, g: 222, b: 255).toFloatingPoint();
  static Color get white => Color(r: 255, g: 255, b: 255).toFloatingPoint();
  //
  static Color get orange => Color(r: 255, g: 147, b: 0).toFloatingPoint();
  static Color get gray => Color(r: 128, g: 128, b: 128).toFloatingPoint();
  static Color get brown => Color(r: 172, g: 91, b: 0).toFloatingPoint();
}
