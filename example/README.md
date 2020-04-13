# Example Usage

The package is pretty self explanatory.

Check out main.dart for usage and expected responses.

```dart
import 'package:enum_to_string/enum_to_string.dart';

enum TestEnum { testValue1 };

convert(){
    String result = EnumToString.parse(TestEnum.testValue1);
    //result = 'testValue1'

    String resultCamelCase = EnumToString.parseCamelCase(TestEnum.testValue1);
    //result = 'Test Value 1'

    final result = EnumToString.fromString(TestEnum.values, "testValue1");
    // TestEnum.testValue1
}
```
