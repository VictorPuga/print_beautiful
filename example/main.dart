import 'package:print_beautiful/print_beautiful.dart';

main() {
  final obj = {
    'a': 'a',
    'b': 'b',
    'c': [1, 2, 3],
    'd': {'a1': 'a1'},
    'e': 1,
    'f': true,
  };
  printBeautiful(obj);
}
