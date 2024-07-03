import 'dart:convert';

import 'package:fidypay/domain/bbps/objects/payment_mode_object.dart';
class PaymentModeDto {
  final String supportPendingStatus;
  final String paymentMode;
  final String minLimit;


  PaymentModeDto({
    required this.supportPendingStatus,
    required this.paymentMode,
    required this.minLimit,
  });


  factory PaymentModeDto.fromDomain(PaymentModeObject object){
    return PaymentModeDto(
      supportPendingStatus : object.supportPendingStatus,
      paymentMode : object.paymentMode,
      minLimit : object.minLimit,
    );
  }


  factory PaymentModeDto.fromMap(Map<dynamic, dynamic> map) {
    return PaymentModeDto(
      supportPendingStatus : map['supportPendingStatus'] ?? '',
      paymentMode : map['paymentMode'] ?? '',
      minLimit : map['minLimit'] ?? '',
    );
  }


  factory PaymentModeDto.fromJson(String source) => PaymentModeDto.fromMap(jsonDecode(source));


  PaymentModeObject toDomain() => PaymentModeObject(
    supportPendingStatus : supportPendingStatus,
    paymentMode : paymentMode,
    minLimit : minLimit,
  );


  Map<String, dynamic> toMap() {
    return {
      'supportPendingStatus' : supportPendingStatus,
      'paymentMode' : paymentMode,
      'minLimit' : minLimit,
    };
  }


  String get toJson => jsonEncode(toMap());
}
