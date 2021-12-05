class EnumJsonParser {
  static T? parse<T>(List<T> enumValues, dynamic json) {
    if (json != null && json is int && json >= 0 && json < enumValues.length) {
      return enumValues[json];
    }

    return null;
  }
}
