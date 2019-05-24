import 'package:enum_to_string/enum_to_string.dart';

enum TestEnum {ValueOne, Value2, valueThree}

main(){
    EnumToString.parse(TestEnum.ValueOne); //ValueOne
    EnumToString.parse(TestEnum.Value2); //Value2
    EnumToString.parse(TestEnum.valueThree); //valueThree

    EnumToString.parseCamelCase(TestEnum.ValueOne); //Value one
    EnumToString.parseCamelCase(TestEnum.Value2); //Value 2
    EnumToString.parseCamelCase(TestEnum.valueThree); //Value three
}