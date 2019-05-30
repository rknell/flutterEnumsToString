import 'package:enum_to_string/enum_to_string.dart';

enum TestEnum {ValueOne, Value2, valueThree}

main(){
    // Parse enum to a string
    EnumToString.parse(TestEnum.ValueOne); //ValueOne
    EnumToString.parse(TestEnum.Value2); //Value2
    EnumToString.parse(TestEnum.valueThree); //valueThree

    // Parse an enum to something more human readable
    EnumToString.parseCamelCase(TestEnum.ValueOne); //Value one
    EnumToString.parseCamelCase(TestEnum.Value2); //Value 2
    EnumToString.parseCamelCase(TestEnum.valueThree); //Value three

    // Get an enum from a string
    EnumToString.fromString(TestEnum.values, "ValueOne"); //, TestEnum.ValueOne
    EnumToString.fromString(TestEnum.values, "Value2"); // TestEnum.Value2
    EnumToString.fromString(TestEnum.values, "valueThree"); // TestEnum.valueThree
}