class PaymentModeObject {
  final String supportPendingStatus;
  final String paymentMode;
  final String minLimit;


  PaymentModeObject({
    required this.supportPendingStatus,
    required this.paymentMode,
    required this.minLimit,
  });


  factory PaymentModeObject.empty() => PaymentModeObject(
    supportPendingStatus : '',
    paymentMode : '',
    minLimit : '',
  );


  PaymentModeObject copyWith({
    String? supportPendingStatus,
    String? paymentMode,
    String? minLimit,
  }){
    return PaymentModeObject(
      supportPendingStatus: supportPendingStatus ?? this.supportPendingStatus,
      paymentMode: paymentMode ?? this.paymentMode,
      minLimit: minLimit ?? this.minLimit,
    );
  }


  @override
  int get hashCode =>
      supportPendingStatus.hashCode ^
      paymentMode.hashCode ^
      minLimit.hashCode ;


  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentModeObject && other.hashCode == hashCode;
  }


  bool get isNotEmpty => this != PaymentModeObject.empty();
}
