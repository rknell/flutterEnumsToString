library enum_to_string;

import 'camel_case_to_words.dart';

class NotAnEnumException implements Exception {
  dynamic value;

  NotAnEnumException(this.value);

  @override
  String toString() =>
      '${value.toString()} of type ${value.runtimeType.toString()} is not an enum item.';
}

class EnumToString {
  static bool _isEnumItem(enumItem) {
    final splitted_enum = enumItem.toString().split('.');
    return splitted_enum.length > 1 &&
        splitted_enum[0] == enumItem.runtimeType.toString();
  }

  static String parse(enumItem, {bool camelCase = false}) {
    if (enumItem == null) return null;

    if (!_isEnumItem(enumItem)) {
      throw NotAnEnumException(enumItem);
    }
    final _tmp = enumItem.toString().split('.')[1];
    return !camelCase ? _tmp : camelCaseToWords(_tmp);
  }

  static String parseCamelCase(enumItem) {
    if (enumItem == null) return null;
    final parsed = EnumToString.parse(enumItem);
    return camelCaseToWords(parsed);
  }

  static T fromString<T>(List<T> enumValues, String value) {
    if (value == null || enumValues == null) return null;

    return enumValues.singleWhere(
        (enumItem) =>
            EnumToString.parse(enumItem)?.toLowerCase() == value?.toLowerCase(),
        orElse: () => null);
  }

  static int indexOf<T>(List<T> enumValues, String value) =>
      enumValues.indexOf(fromString<T>(enumValues, value));

  static List<String> toList<T>(List<T> enumValues, {bool camelCase = false}) {
    if (enumValues == null) return null;
    final _enumList = enumValues
        .map((t) =>
            !camelCase ? EnumToString.parse(t) : EnumToString.parseCamelCase(t))
        .toList();
    return _enumList;
  }
}
