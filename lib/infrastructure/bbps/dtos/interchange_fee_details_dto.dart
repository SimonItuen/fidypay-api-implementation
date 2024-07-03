import 'dart:convert';

import 'package:fidypay/domain/bbps/objects/interchange_fee_details_object.dart';
class InterchangeFeeDetailsDto {
  final String effctvTo;
  final num tranAmtRangeMax;
  final String effctvFrom;
  final num percentFee;
  final num tranAmtRangeMin;
  final num flatFee;


  InterchangeFeeDetailsDto({
    required this.effctvTo,
    required this.tranAmtRangeMax,
    required this.effctvFrom,
    required this.percentFee,
    required this.tranAmtRangeMin,
    required this.flatFee,
  });


  factory InterchangeFeeDetailsDto.fromDomain(InterchangeFeeDetailsObject object){
    return InterchangeFeeDetailsDto(
      effctvTo : object.effctvTo,
      tranAmtRangeMax : object.tranAmtRangeMax,
      effctvFrom : object.effctvFrom,
      percentFee : object.percentFee,
      tranAmtRangeMin : object.tranAmtRangeMin,
      flatFee : object.flatFee,
    );
  }


  factory InterchangeFeeDetailsDto.fromMap(Map<dynamic, dynamic> map) {
    return InterchangeFeeDetailsDto(
      effctvTo : map['effctvTo'] ?? '',
      tranAmtRangeMax : (map['tranAmtRangeMax'] ?? 0) as num,
      effctvFrom : map['effctvFrom'] ?? '',
      percentFee : (map['percentFee'] ?? 0) as num,
      tranAmtRangeMin : (map['tranAmtRangeMin'] ?? 0) as num,
      flatFee : (map['flatFee'] ?? 0) as num,
    );
  }


  factory InterchangeFeeDetailsDto.fromJson(String source) => InterchangeFeeDetailsDto.fromMap(jsonDecode(source));


  InterchangeFeeDetailsObject toDomain() => InterchangeFeeDetailsObject(
    effctvTo : effctvTo,
    tranAmtRangeMax : tranAmtRangeMax.toDouble(),
    effctvFrom : effctvFrom,
    percentFee : percentFee.toDouble(),
    tranAmtRangeMin : tranAmtRangeMin.toDouble(),
    flatFee : flatFee.toDouble(),
  );


  Map<String, dynamic> toMap() {
    return {
      'effctvTo' : effctvTo,
      'tranAmtRangeMax' : tranAmtRangeMax,
      'effctvFrom' : effctvFrom,
      'percentFee' : percentFee,
      'tranAmtRangeMin' : tranAmtRangeMin,
      'flatFee' : flatFee,
    };
  }


  String get toJson => jsonEncode(toMap());
}
