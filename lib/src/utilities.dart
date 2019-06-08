// part of print_beautiful;
import 'package:ansicolor/ansicolor.dart';
import 'color/color.dart';

const String indent = '  ';

// final encoder = JsonEncoder.withIndent('  ');

final pen = AnsiPen();

AnsiPen bracePen(int lvl) {
  Color color;
  switch (lvl % 3) {
    case 0:
      color = Colors.yellow;
      break;
    case 1:
      color = Colors.magenta;
      break;
    default:
      color = Colors.cyan;
      break;
  }

  return AnsiPen()
    ..reset()
    ..rgb(
      r: color.r,
      g: color.g,
      b: color.b,
    );
}

s(String string, int level, [bool shouldIndent = false]) {
  final String ind = shouldIndent ? indent * level : '';
  pen
    ..reset()
    ..green();
  return pen.write(ind + '"$string"');
}

n(num number, int level, [bool shouldIndent = false]) {
  final String ind = shouldIndent ? indent * level : '';
  pen
    ..reset()
    ..blue();
  return pen.write(ind + '$number');
}

b(bool boolean, int level, [bool shouldIndent = false]) {
  final String ind = shouldIndent ? indent * level : '';
  pen
    ..reset()
    ..magenta();
  return pen.write(ind + '$boolean');
}

nil(int level, [bool shouldIndent = false]) {
  final String ind = shouldIndent ? indent * level : '';
  pen
    ..reset()
    ..magenta();
  return pen.write(ind + 'null');
}

l(List list, StringBuffer sb, int level) {
  final AnsiPen bPen = bracePen(level);
  final String ind = indent * level;

  sb.write(bPen('[\n'));

  list.forEach((val) {
    colorize(val, sb, level, true);
    sb.write(',\n');
  });

  sb.write(bPen(ind + ']'));
}

m(Map map, StringBuffer sb, int level) {
  final AnsiPen bPen = bracePen(level);
  final String ind = indent * level;

  sb.write(bPen('{\n'));

  map['keys'].forEach((key) {
    final i = map['keys'].indexOf(key);

    colorize(key, sb, level, true);
    sb.write(': ');
    colorize(map['values'][i], sb, level);
    sb.write(',\n');
  });

  sb.write(bPen(ind + '}'));
}

destructure(object) {
  Map objectRepresentation = {};
  if (object is String) {
    objectRepresentation['type'] = 'String';
    objectRepresentation['value'] = object;
  } else if (object is num) {
    objectRepresentation['type'] = 'num';
    objectRepresentation['value'] = object;
  } else if (object is bool) {
    objectRepresentation['type'] = 'bool';
    objectRepresentation['value'] = object;
  } else if (object == null) {
    objectRepresentation['type'] = 'null';
    objectRepresentation['value'] = object;
  } else if (object is List) {
    objectRepresentation['type'] = 'List';
    objectRepresentation['values'] = object;
  } else if (object is Map) {
    objectRepresentation['type'] = 'Map';
    objectRepresentation['keys'] = object.keys.toList();
    objectRepresentation['values'] = object.values.toList();
  }

  if (objectRepresentation.containsKey('keys')) {
    objectRepresentation['keys'] = objectRepresentation['keys'].map((val) {
      return destructure(val);
    }).toList();
  }
  if (objectRepresentation.containsKey('values')) {
    objectRepresentation['values'] = objectRepresentation['values'].map((val) {
      return destructure(val);
    }).toList();
  }
  // print(encoder.convert(objectRepresentation));
  return objectRepresentation;
}

colorize(object, StringBuffer sb, int level,
    [bool shouldIndent = false, isInitial = false]) {
  if (!isInitial) level++;
  switch (object['type']) {
    case 'String':
      sb.write(s(object['value'], level, shouldIndent));
      break;
    case 'num':
      sb.write(n(object['value'], level, shouldIndent));
      break;
    case 'bool':
      sb.write(b(object['value'], level, shouldIndent));
      break;
    case 'null':
      sb.write(nil(level, shouldIndent));
      break;
    case 'List':
      l(object['values'], sb, level);
      break;
    case 'Map':
      m(object, sb, level);
      break;
  }

  return sb.toString();
}

color(Map representation) {
  _test();
  // return colorize(representation, StringBuffer(), 0, false, true);
}

_test() {
  _black();
  _red();
  _green();
  _yellow();
  _blue();
  _magenta();
  _cyan();
  _white();
  _orange();
  _gray();
  _brown();
}

_black() {
  final c = Colors.black;
  pen
    ..reset()
    ..black(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_red() {
  final c = Colors.red;
  pen
    ..reset()
    ..red(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_green() {
  final c = Colors.green;
  pen
    ..reset()
    ..green(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_yellow() {
  final c = Colors.yellow;
  pen
    ..reset()
    ..yellow(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_blue() {
  final c = Colors.blue;
  pen
    ..reset()
    ..blue(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_magenta() {
  final c = Colors.magenta;
  pen
    ..reset()
    ..magenta(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_cyan() {
  final c = Colors.cyan;
  pen
    ..reset()
    ..cyan(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_white() {
  final c = Colors.white;
  pen
    ..reset()
    ..white(bg: true);
  print(pen('   '));
  pen..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_orange() {
  final c = Colors.orange;
  print('orange');
  pen
    ..reset()
    ..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_gray() {
  final c = Colors.gray;
  print('gray');
  pen
    ..reset()
    ..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}

_brown() {
  final c = Colors.brown;
  print('brown');
  pen
    ..reset()
    ..rgb(r: c.r, g: c.g, b: c.b, bg: true);
  print('   ' + pen('   '));
}
