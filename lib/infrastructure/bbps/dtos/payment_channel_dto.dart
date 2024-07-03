import 'dart:convert';

import 'package:fidypay/domain/bbps/objects/payment_channel_object.dart';
class PaymentChannelDto {
  final String supportPendingStatus;
  final String paymentMode;
  final String maxLimit;
  final String minLimit;


  PaymentChannelDto({
    required this.supportPendingStatus,
    required this.paymentMode,
    required this.maxLimit,
    required this.minLimit,
  });


  factory PaymentChannelDto.fromDomain(PaymentChannelObject object){
    return PaymentChannelDto(
      supportPendingStatus : object.supportPendingStatus,
      paymentMode : object.paymentMode,
      maxLimit : object.maxLimit,
      minLimit : object.minLimit,
    );
  }


  factory PaymentChannelDto.fromMap(Map<dynamic, dynamic> map) {
    return PaymentChannelDto(
      supportPendingStatus : map['supportPendingStatus'] ?? '',
      paymentMode : map['paymentMode'] ?? '',
      maxLimit : map['maxLimit'] ?? '',
      minLimit : map['minLimit'] ?? '',
    );
  }


  factory PaymentChannelDto.fromJson(String source) => PaymentChannelDto.fromMap(jsonDecode(source));


  PaymentChannelObject toDomain() => PaymentChannelObject(
    supportPendingStatus : supportPendingStatus,
    paymentMode : paymentMode,
    maxLimit : maxLimit,
    minLimit : minLimit,
  );


  Map<String, dynamic> toMap() {
    return {
      'supportPendingStatus' : supportPendingStatus,
      'paymentMode' : paymentMode,
      'maxLimit' : maxLimit,
      'minLimit' : minLimit,
    };
  }


  String get toJson => jsonEncode(toMap());
}
