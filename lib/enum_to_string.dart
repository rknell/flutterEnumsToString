library enum_to_string;

import 'camel_case_to_words.dart';

/// A Calculator.
class EnumToString {
  static parse(enumItem) {
    return enumItem.toString().split('.')[1];
  }

  static parseCamelCase(enumItem) {
    final parsed = EnumToString.parse(enumItem);
    return camelCaseToWords(parsed);
  }
}
