library enum_to_string;

import 'camel_case_to_words.dart';

/// A Calculator.
class EnumToString {
  static String parse(enumItem) {
    if (enumItem == null) return null;
    return enumItem.toString().split('.')[1];
  }

  static String parseCamelCase(enumItem) {
    if (enumItem == null) return null;
    final parsed = EnumToString.parse(enumItem);
    return camelCaseToWords(parsed);
  }

  static fromString<T>(List<T> enumValues, String value) {
    if (value == null) return null;

    return enumValues.singleWhere(
        (enumItem) => EnumToString.parse(enumItem) == value,
        orElse: () => null);
  }
}
