import 'dart:convert';

import 'package:fidypay/domain/bbps/objects/customer_params_object.dart';
class CustomerParamsDto {
  final String regex;
  final bool visibility;
  final String dataType;
  final int minLength;
  final bool optional;
  final String paramName;
  final int maxLength;


  CustomerParamsDto({
    required this.regex,
    required this.visibility,
    required this.dataType,
    required this.minLength,
    required this.optional,
    required this.paramName,
    required this.maxLength,
  });


  factory CustomerParamsDto.fromDomain(CustomerParamsObject object){
    return CustomerParamsDto(
      regex : object.regex,
      visibility : object.visibility,
      dataType : object.dataType,
      minLength : object.minLength,
      optional : object.optional,
      paramName : object.paramName,
      maxLength : object.maxLength,
    );
  }


  factory CustomerParamsDto.fromMap(Map<dynamic, dynamic> map) {
    return CustomerParamsDto(
      regex : map['regex'] ?? '',
      visibility : (map['visibility'] ?? false) as bool,
      dataType : map['dataType'] ?? '',
      minLength : (map['minLength'] ?? 0) as int,
      optional : (map['optional'] ?? false) as bool,
      paramName : map['paramName'] ?? '',
      maxLength : (map['maxLength'] ?? 0) as int,
    );
  }


  factory CustomerParamsDto.fromJson(String source) => CustomerParamsDto.fromMap(jsonDecode(source));


  CustomerParamsObject toDomain() => CustomerParamsObject(
    regex : regex,
    visibility : visibility,
    dataType : dataType,
    minLength : minLength,
    optional : optional,
    paramName : paramName,
    maxLength : maxLength,
  );


  Map<String, dynamic> toMap() {
    return {
      'regex' : regex,
      'visibility' : visibility,
      'dataType' : dataType,
      'minLength' : minLength,
      'optional' : optional,
      'paramName' : paramName,
      'maxLength' : maxLength,
    };
  }


  String get toJson => jsonEncode(toMap());
}
