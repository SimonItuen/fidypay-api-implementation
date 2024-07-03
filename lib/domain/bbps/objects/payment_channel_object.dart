class PaymentChannelObject {
  final String supportPendingStatus;
  final String paymentMode;
  final String maxLimit;
  final String minLimit;


  PaymentChannelObject({
    required this.supportPendingStatus,
    required this.paymentMode,
    required this.maxLimit,
    required this.minLimit,
  });


  factory PaymentChannelObject.empty() => PaymentChannelObject(
    supportPendingStatus : '',
    paymentMode : '',
    maxLimit : '',
    minLimit : '',
  );


  PaymentChannelObject copyWith({
    String? supportPendingStatus,
    String? paymentMode,
    String? maxLimit,
    String? minLimit,
  }){
    return PaymentChannelObject(
      supportPendingStatus: supportPendingStatus ?? this.supportPendingStatus,
      paymentMode: paymentMode ?? this.paymentMode,
      maxLimit: maxLimit ?? this.maxLimit,
      minLimit: minLimit ?? this.minLimit,
    );
  }


  @override
  int get hashCode =>
      supportPendingStatus.hashCode ^
      paymentMode.hashCode ^
      maxLimit.hashCode ^
      minLimit.hashCode ;


  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentChannelObject && other.hashCode == hashCode;
  }


  bool get isNotEmpty => this != PaymentChannelObject.empty();
}
