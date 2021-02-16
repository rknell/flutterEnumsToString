import 'package:enum_to_string/enum_to_string.dart';
import 'package:test/test.dart';

enum TestEnum { valueOne, Value2, testValue3 }
enum OtherEnumForTesting { helloImAnEnumValue }

void main() {
  test('it should convert enums to string', () {
    expect(EnumToString.convertToString(TestEnum.valueOne), 'valueOne');
    expect(EnumToString.convertToString(TestEnum.Value2), 'Value2');
    expect(EnumToString.convertToString(TestEnum.testValue3), 'testValue3');
    expect(EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue),
        'helloImAnEnumValue');
  });

  test('it should also convert enums to string', () {
    expect(EnumToString.convertToString(TestEnum.valueOne, camelCase: false),
        'valueOne');
    expect(EnumToString.convertToString(TestEnum.Value2, camelCase: false),
        'Value2');
    expect(EnumToString.convertToString(TestEnum.testValue3, camelCase: false),
        'testValue3');
    expect(
        EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue,
            camelCase: false),
        'helloImAnEnumValue');
  });

  test('it should also convert camelCase enums to words', () {
    expect(EnumToString.convertToString(TestEnum.valueOne, camelCase: true),
        'Value one');
    expect(EnumToString.convertToString(TestEnum.Value2, camelCase: true),
        'Value 2');
    expect(EnumToString.convertToString(TestEnum.testValue3, camelCase: true),
        'Test value 3');
    expect(
        EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue,
            camelCase: true),
        'Hello im an enum value');
  });

  test('it should convert camelCase enums to words', () {
    // ignore: deprecated_member_use_from_same_package
    expect(EnumToString.convertToString(TestEnum.valueOne, camelCase: true),
        'Value one');
    // ignore: deprecated_member_use_from_same_package
    expect(EnumToString.convertToString(TestEnum.Value2, camelCase: true),
        'Value 2');
    // ignore: deprecated_member_use_from_same_package
    expect(EnumToString.convertToString(TestEnum.testValue3, camelCase: true),
        'Test value 3');
    // ignore: deprecated_member_use_from_same_package
    expect(
        EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue,
            camelCase: true),
        'Hello im an enum value');
    // ignore: deprecated_member_use_from_same_package
  });

  test(
      'it should convert camelCase enums to words using non deprecated functions',
      () {
    expect(EnumToString.convertToString(TestEnum.valueOne, camelCase: true),
        'Value one');
    expect(EnumToString.convertToString(TestEnum.Value2, camelCase: true),
        'Value 2');
    expect(EnumToString.convertToString(TestEnum.testValue3, camelCase: true),
        'Test value 3');
    expect(
        EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue,
            camelCase: true),
        'Hello im an enum value');
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

  test('it should find an enum value index by string', () {
    expect(EnumToString.indexOf<TestEnum>(TestEnum.values, 'valueOne'), 0);
    expect(EnumToString.indexOf(TestEnum.values, 'Value2'), 1);
    expect(
        EnumToString.indexOf(OtherEnumForTesting.values, 'helloImAnEnumValue'),
        0);
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
  });

  test('it should also convert enum to string list', () {
    expect(
        EnumToString.toList(TestEnum.values, camelCase: false)[0], 'valueOne');
    expect(EnumToString.toList(TestEnum.values, camelCase: false)[1], 'Value2');
  });

  test('it should convert enum to string list in camelCase', () {
    expect(
        EnumToString.toList(TestEnum.values, camelCase: true)[0], 'Value one');
    expect(EnumToString.toList(TestEnum.values, camelCase: true)[1], 'Value 2');
  });

  test('it should throw proper exception', () {
    expect(() => EnumToString.convertToString('SomeEnum.SomeValue'),
        throwsA(isA<AssertionError>()));
    expect(() => EnumToString.convertToString('SomeString'),
        throwsA(isA<AssertionError>()));
  });

  test('it should populate a list of enum values from a list of strings', () {
    final result = EnumToString.fromList(
        TestEnum.values, ['ValueOne', 'Value2', 'dfljk;asdfakl;jds']);
    expect(result, [TestEnum.valueOne, TestEnum.Value2, null]);
  });

  test('it should get an enum item from a string with spaces', () {
    final result =
        EnumToString.fromString(TestEnum.values, 'Value One', camelCase: true);
    expect(result, TestEnum.valueOne);
  });
}
