import 'package:flutter_test/flutter_test.dart';

import 'package:enum_to_string/enum_to_string.dart';

enum TestEnum { valueOne, Value2, testValue3 }
enum OtherEnumForTesting { helloImAnEnumValue }

void main() {
  test('it should convert enums to string', () {
    expect(EnumToString.parse(TestEnum.valueOne), "valueOne");
    expect(EnumToString.parse(TestEnum.Value2), "Value2");
    expect(EnumToString.parse(TestEnum.testValue3), "testValue3");
    expect(EnumToString.parse(OtherEnumForTesting.helloImAnEnumValue),
        "helloImAnEnumValue");
    expect(EnumToString.parse(null), null);
  });

  test('it should convert camelCase enums to words', () {
    expect(EnumToString.parseCamelCase(TestEnum.valueOne), "Value one");
    expect(EnumToString.parseCamelCase(TestEnum.Value2), "Value 2");
    expect(EnumToString.parseCamelCase(TestEnum.testValue3), "Test value 3");
    expect(EnumToString.parseCamelCase(OtherEnumForTesting.helloImAnEnumValue),
        "Hello im an enum value");
    expect(EnumToString.parseCamelCase(null), null);
  });

  test('it should convert a string to an enum', () {
    expect(EnumToString.fromString<TestEnum>(TestEnum.values, "valueOne"),
        TestEnum.valueOne);
    expect(EnumToString.fromString(TestEnum.values, "Value2"), TestEnum.Value2);
    expect(
        EnumToString.fromString(
            OtherEnumForTesting.values, "helloImAnEnumValue"),
        OtherEnumForTesting.helloImAnEnumValue);
  });
}
