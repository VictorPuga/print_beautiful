// part of print_beautiful;
import 'utilities.dart';

void printBeautiful(object) {
  final Map representation = destructure(object);
  final obj = color(representation);
  print(obj);
}
