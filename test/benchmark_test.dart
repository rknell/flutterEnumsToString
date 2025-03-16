import 'package:enum_to_string/enum_to_string.dart';
import 'package:test/test.dart';

enum LargeEnum {
  value1,
  value2,
  value3,
  value4,
  value5,
  value6,
  value7,
  value8,
  value9,
  value10,
  value11,
  value12,
  value13,
  value14,
  value15,
  value16,
  value17,
  value18,
  value19,
  value20,
  value21,
  value22,
  value23,
  value24,
  value25,
  value26,
  value27,
  value28,
  value29,
  value30,
  value31,
  value32,
  value33,
  value34,
  value35,
  value36,
  value37,
  value38,
  value39,
  value40,
  value41,
  value42,
  value43,
  value44,
  value45,
  value46,
  value47,
  value48,
  value49,
  value50,
}

enum EnhancedLargeEnum {
  value1("custom1"),
  value2("custom2"),
  value3,
  value4,
  value5,
  value6,
  value7,
  value8,
  value9,
  value10,
  value11,
  value12,
  value13,
  value14,
  value15,
  value16,
  value17,
  value18,
  value19,
  value20,
  value21,
  value22,
  value23,
  value24,
  value25,
  value26,
  value27,
  value28,
  value29,
  value30,
  value31,
  value32,
  value33,
  value34,
  value35,
  value36,
  value37,
  value38,
  value39,
  value40,
  value41,
  value42,
  value43,
  value44,
  value45,
  value46,
  value47,
  value48,
  value49,
  value50;

  final String? value;
  const EnhancedLargeEnum([this.value]);
}

void main() {
  group('Performance Benchmarks', () {
    test('Benchmark convertToString for regular enums', () {
      final stopwatch = Stopwatch()..start();

      // Run 10,000 conversions
      for (int i = 0; i < 10000; i++) {
        for (final value in LargeEnum.values) {
          EnumToString.convertToString(value);
        }
      }

      stopwatch.stop();
      print(
          'Regular enum conversion: ${stopwatch.elapsedMilliseconds}ms for 500,000 conversions');

      // No assertion, just measuring performance
      expect(true, isTrue);
    });

    test('Benchmark convertToString for enhanced enums', () {
      final stopwatch = Stopwatch()..start();

      // Run 10,000 conversions
      for (int i = 0; i < 10000; i++) {
        for (final value in EnhancedLargeEnum.values) {
          EnumToString.convertToString(value);
        }
      }

      stopwatch.stop();
      print(
          'Enhanced enum conversion: ${stopwatch.elapsedMilliseconds}ms for 500,000 conversions');

      // No assertion, just measuring performance
      expect(true, isTrue);
    });

    test('Benchmark fromString with repeated calls', () {
      final stopwatch = Stopwatch()..start();

      // Run 10,000 conversions
      for (int i = 0; i < 10000; i++) {
        EnumToString.fromString(LargeEnum.values, 'value1');
        EnumToString.fromString(LargeEnum.values, 'value25');
        EnumToString.fromString(LargeEnum.values, 'value50');
      }

      stopwatch.stop();
      print(
          'fromString conversion: ${stopwatch.elapsedMilliseconds}ms for 30,000 conversions');

      // No assertion, just measuring performance
      expect(true, isTrue);
    });
  });
}
