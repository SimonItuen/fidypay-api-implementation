class CustomerParamsObject {
  final String regex;
  final bool visibility;
  final String dataType;
  final int minLength;
  final bool optional;
  final String paramName;
  final int maxLength;


  CustomerParamsObject({
    required this.regex,
    required this.visibility,
    required this.dataType,
    required this.minLength,
    required this.optional,
    required this.paramName,
    required this.maxLength,
  });


  factory CustomerParamsObject.empty() => CustomerParamsObject(
    regex : '',
    visibility : false,
    dataType : '',
    minLength : 0,
    optional : false,
    paramName : '',
    maxLength : 0,
  );


  CustomerParamsObject copyWith({
    String? regex,
    bool? visibility,
    String? dataType,
    int? minLength,
    bool? optional,
    String? paramName,
    int? maxLength,
  }){
    return CustomerParamsObject(
      regex: regex ?? this.regex,
      visibility: visibility ?? this.visibility,
      dataType: dataType ?? this.dataType,
      minLength: minLength ?? this.minLength,
      optional: optional ?? this.optional,
      paramName: paramName ?? this.paramName,
      maxLength: maxLength ?? this.maxLength,
    );
  }


  @override
  int get hashCode =>
      regex.hashCode ^
      visibility.hashCode ^
      dataType.hashCode ^
      minLength.hashCode ^
      optional.hashCode ^
      paramName.hashCode ^
      maxLength.hashCode ;


  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerParamsObject && other.hashCode == hashCode;
  }


  bool get isNotEmpty => this != CustomerParamsObject.empty();
}
