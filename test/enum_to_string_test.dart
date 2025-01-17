import 'package:enum_to_string/enum_to_string.dart';
import 'package:enum_to_string/camel_case_to_words.dart';
import 'package:test/test.dart';

// ignore: constant_identifier_names
enum TestEnum { valueOne, Value2, testValue3, multiWordValueTest }

enum OtherEnumForTesting { helloImAnEnumValue }

enum EnhancedTestEnum {
  mapped("Custom-String"),
  camelCaseValue,
  withCapitals;

  final String? value;
  const EnhancedTestEnum([this.value]);
}

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

  test('it should properly capitalize all words when capitalizeWords is true',
      () {
    expect(
        EnumToString.convertToString(TestEnum.valueOne,
            camelCase: true, capitalizeWords: true),
        'Value One');
    expect(
        EnumToString.convertToString(TestEnum.testValue3,
            camelCase: true, capitalizeWords: true),
        'Test Value 3');
    expect(
        EnumToString.convertToString(TestEnum.multiWordValueTest,
            camelCase: true, capitalizeWords: true),
        'Multi Word Value Test');
    expect(
        EnumToString.convertToString(OtherEnumForTesting.helloImAnEnumValue,
            camelCase: true, capitalizeWords: true),
        'Hello Im An Enum Value');
  });

  test('it should maintain original behavior when capitalizeWords is false',
      () {
    expect(
        EnumToString.convertToString(TestEnum.valueOne,
            camelCase: true, capitalizeWords: false),
        'Value one');
    expect(
        EnumToString.convertToString(TestEnum.testValue3,
            camelCase: true, capitalizeWords: false),
        'Test value 3');
    expect(
        EnumToString.convertToString(TestEnum.multiWordValueTest,
            camelCase: true, capitalizeWords: false),
        'Multi word value test');
  });

  test('it should properly handle capitalizeWords in toList', () {
    expect(
        EnumToString.toList(TestEnum.values,
            camelCase: true, capitalizeWords: true),
        ['Value One', 'Value 2', 'Test Value 3', 'Multi Word Value Test']);
    expect(
        EnumToString.toList(TestEnum.values,
            camelCase: true, capitalizeWords: false),
        ['Value one', 'Value 2', 'Test value 3', 'Multi word value test']);
  });

  test('it should handle empty strings in camelCaseToWords', () {
    expect(camelCaseToWords(''), '');
    expect(camelCaseToWords('', defaultPattern, true), '');
  });

  test('it should handle RegExp pattern in camelCaseToWords', () {
    final regExpPattern = RegExp(r'[A-Z][a-z]+|[a-z]+|[0-9]+');
    expect(camelCaseToWords('testString', regExpPattern), 'Test string');
  });

  test('it should handle null values in assertions', () {
    expect(() => EnumToString.convertToString(null),
        throwsA(isA<AssertionError>()));
  });

  test('it should return -1 for indexOf when value is not found', () {
    expect(EnumToString.indexOf(TestEnum.values, 'nonexistentValue'), -1);
  });

  test('it should handle deprecated parse methods correctly', () {
    // ignore: deprecated_member_use_from_same_package
    expect(EnumToString.parse(TestEnum.valueOne), 'valueOne');
    // ignore: deprecated_member_use_from_same_package
    expect(EnumToString.parseCamelCase(TestEnum.valueOne), 'Value one');
  });

  group('Enhanced enum support', () {
    test('should use custom string mapping when available', () {
      expect(EnumToString.convertToString(EnhancedTestEnum.mapped),
          equals("Custom-String"));
    });

    test('should fall back to normal behavior for unmapped values', () {
      expect(
          EnumToString.convertToString(EnhancedTestEnum.camelCaseValue,
              camelCase: true),
          equals("Camel case value"));
      expect(
          EnumToString.convertToString(EnhancedTestEnum.camelCaseValue,
              camelCase: true, capitalizeWords: true),
          equals("Camel Case Value"));
    });

    test('fromString should work with both mapped and unmapped values', () {
      expect(EnumToString.fromString(EnhancedTestEnum.values, "Custom-String"),
          equals(EnhancedTestEnum.mapped));
      expect(EnumToString.fromString(EnhancedTestEnum.values, "camelCaseValue"),
          equals(EnhancedTestEnum.camelCaseValue));
    });

    test('toList should handle mixed mapped and unmapped values', () {
      expect(EnumToString.toList(EnhancedTestEnum.values),
          equals(["Custom-String", "camelCaseValue", "withCapitals"]));
    });
  });
}
