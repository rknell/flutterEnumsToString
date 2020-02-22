import 'package:enum_to_string/enum_to_string.dart';
import 'package:test/test.dart';

enum TestEnum { valueOne, Value2, testValue3 }
enum OtherEnumForTesting { helloImAnEnumValue }

void main() {
  test('it should convert enums to string', () {
    expect(EnumToString.parse(TestEnum.valueOne), 'valueOne');
    expect(EnumToString.parse(TestEnum.Value2), 'Value2');
    expect(EnumToString.parse(TestEnum.testValue3), 'testValue3');
    expect(EnumToString.parse(OtherEnumForTesting.helloImAnEnumValue),
        'helloImAnEnumValue');
    expect(EnumToString.parse(null), null);
  });

  test('it should convert camelCase enums to words', () {
    expect(EnumToString.parseCamelCase(TestEnum.valueOne), 'Value one');
    expect(EnumToString.parseCamelCase(TestEnum.Value2), 'Value 2');
    expect(EnumToString.parseCamelCase(TestEnum.testValue3), 'Test value 3');
    expect(EnumToString.parseCamelCase(OtherEnumForTesting.helloImAnEnumValue),
        'Hello im an enum value');
    expect(EnumToString.parseCamelCase(null), null);
  });

  test('it should convert a string to an enum', () {
    expect(EnumToString.fromString<TestEnum>(TestEnum.values, 'valueOne'),
        TestEnum.valueOne);
    expect(EnumToString.fromString(TestEnum.values, 'Value2'), TestEnum.Value2);
    expect(
        EnumToString.fromString(
            OtherEnumForTesting.values, 'helloImAnEnumValue'),
        OtherEnumForTesting.helloImAnEnumValue);
  });

  test('it should convert a string to an enum ignoring case', () {
    expect(EnumToString.fromString<TestEnum>(TestEnum.values, 'VaLueONe'),
        TestEnum.valueOne);
    expect(EnumToString.fromString(TestEnum.values, 'vAlUe2'), TestEnum.Value2);
    expect(
        EnumToString.fromString(
            OtherEnumForTesting.values, 'hEllOImAnEnUmVAlUE'),
        OtherEnumForTesting.helloImAnEnumValue);
  });

  test('it should maintain typing', () {
    final result =
        EnumToString.fromString<TestEnum>(TestEnum.values, 'valueOne');
    expect(result is TestEnum, true);
    final result2 = EnumToString.fromString<OtherEnumForTesting>(
        OtherEnumForTesting.values, 'helloImAnEnumValue');
    expect(result2 is OtherEnumForTesting, true);
    expect(result2 is TestEnum, false);
  });

  test('it should convert enum to string list', () {
    expect(EnumToString.toList(TestEnum.values)[0], 'valueOne');
    expect(EnumToString.toList(TestEnum.values)[1], 'Value2');
    expect(EnumToString.toList(null), null);
  });
}
