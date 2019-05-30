# enum_to_string

Better convertsion of ENUMs to string

## What it does

It takes an enum such as:

`enum TestEnum { testValue1 }`

and converts it to

`testValue1`

**Also handles camel case**

Input `enum TestEnum { testValue1 }`
Output `Test Value 1`

## Usage

```dart
import 'package:enum_to_string:enum_to_string.dart';

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

Any pull requests / extensions welcome, this was just an annoying thing I needed to fix a couple of times so viola! a package was born.