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

  /// Convert an enum to a string
  ///
  /// Pass in the enum value, so TestEnum.valueOne into [enumItem]
  /// It will return the striped off value so "valueOne".
  ///
  /// If you pass in the option [camelCase]=true it will convert it to words
  /// So TestEnum.valueOne will become Value One
  static String parse(enumItem, {bool camelCase = false}) {
    if (enumItem == null) return null;

    if (!_isEnumItem(enumItem)) {
      throw NotAnEnumException(enumItem);
    }
    final _tmp = enumItem.toString().split('.')[1];
    return !camelCase ? _tmp : camelCaseToWords(_tmp);
  }

  /// An alias for parse(item, camelCase: true)
  ///
  @Deprecated("Deprecated in favour of using parse(item, camelCase: true)")
  static String parseCamelCase(enumItem) {
    return EnumToString.parse(enumItem, camelCase: true);
  }

  /// Given a string, find and return its matching enum value
  ///
  /// You need to pass in the values of the enum object. So TestEnum.values
  /// in the first argument. The matching value is the second argument.
  ///
  /// Example final result = EnumToString.fromString(TestEnum.values, "valueOne")
  /// result == TestEnum.valueOne //true
  ///
  static T fromString<T>(List<T> enumValues, String value) {
    if (value == null || enumValues == null) return null;

    return enumValues.singleWhere(
        (enumItem) =>
            EnumToString.parse(enumItem)?.toLowerCase() == value?.toLowerCase(),
        orElse: () => null);
  }

  /// Get the index of the enum value
  ///
  /// Pass in the enum values to argument one, so TestEnum.values
  /// Pass in the matching string to argument 2, so "valueOne"
  ///
  /// Eg. final index = EnumToString.indexOf(TestEnum.values, "valueOne")
  /// index == 0 //true
  static int indexOf<T>(List<T> enumValues, String value) =>
      enumValues.indexOf(fromString<T>(enumValues, value));

  static List<String> toList<T>(List<T> enumValues, {bool camelCase = false}) {
    if (enumValues == null) return null;
    final _enumList = enumValues
        .map((t) => !camelCase
            ? EnumToString.parse(t)
            : EnumToString.parse(t, camelCase: true))
        .toList();
    return _enumList;
  }

  /// Get a list of enums given a list of strings. 
  /// Basically just EnumToString.fromString, but using lists
  /// 
  /// Returns null for items that are not found.
  ///
  /// As with fromString it is not case sensitive
  /// 
  /// Eg. EnumToString.fromList(TestEnum.values, ["valueOne", "value2"]
  static List<T> fromList<T>(List<T> enumValues, List valueList) {
    if (valueList == null || enumValues == null) return null;

    return List<T>.from(valueList.map((item) => item == null
        ? null
        : fromString(enumValues, item)));
  }
}
