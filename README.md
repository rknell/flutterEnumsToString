# enum_to_string

[![Build Status](https://travis-ci.org/rknell/flutterEnumsToString.svg?branch=master)](https://travis-ci.org/rknell/flutterEnumsToString)

Better conversion of ENUMs to string - It also can handle converting back again!

### :fire::fire::fire: Shameless plug! :fire::fire::fire:
Want to write server applications like expressjs in dart? Check out my new open source package Alfred
https://pub.dev/packages/alfred

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
import 'package:enum_to_string/enum_to_string.dart';

enum TestEnum { testValue1, testValue2 };

convert(){
    String result = EnumToString.convertToString(TestEnum.testValue1);
    //result = 'testValue1'

    String result = EnumToString.convertToString(TestEnum.testValue1, camelCase: true);
    //result = 'Test Value 1'

    EnumToString.fromString(TestEnum.values, "testValue1"); //Enum
    // TestEnum.testValue1

    EnumToString.fromString(TestEnum.values, "Test Value 1", camelCase: true);
    // TestEnum.testValue1

    List<String> result = EnumToString.toList(TestEnum.values);
    //result = ['testValue1','testValue2'],

    List<String> result = EnumToString.toList(TestEnum.values, camelCase: true);
    //result = ['Test Value 1','Test Value 2'],
    
    List result = EnumToString.fromList(TestEnum.values, ["ValueOne", "Value2"]); //List<Enum>
    //result = [TestEnum.valueOne, TestEnum.value2];
}
```

## Contributing

Any pull requests / extensions welcome, this was just an annoying thing I needed to fix a couple of times so viola! a package was born.

It is worth noting that for consistency purposes there are a number of linting checks that need to pass to move through the CI pipeline and make sure merging goes smoothly.

You can test / fix any issues that will prevent the pull request being accepted by running the following commands (this is an example of the macOS cli):

```
pub run test --platform vm
dartanalyzer --fatal-infos .
dartfmt -w lib test example
```
