class InterchangeFeeDetailsObject {
  final String effctvTo;
  final double tranAmtRangeMax;
  final String effctvFrom;
  final double percentFee;
  final double tranAmtRangeMin;
  final double flatFee;


  InterchangeFeeDetailsObject({
    required this.effctvTo,
    required this.tranAmtRangeMax,
    required this.effctvFrom,
    required this.percentFee,
    required this.tranAmtRangeMin,
    required this.flatFee,
  });


  factory InterchangeFeeDetailsObject.empty() => InterchangeFeeDetailsObject(
    effctvTo : '',
    tranAmtRangeMax : 0.0,
    effctvFrom : '',
    percentFee : 0.0,
    tranAmtRangeMin : 0.0,
    flatFee : 0.0,
  );


  InterchangeFeeDetailsObject copyWith({
    String? effctvTo,
    double? tranAmtRangeMax,
    String? effctvFrom,
    double? percentFee,
    double? tranAmtRangeMin,
    double? flatFee,
  }){
    return InterchangeFeeDetailsObject(
      effctvTo: effctvTo ?? this.effctvTo,
      tranAmtRangeMax: tranAmtRangeMax ?? this.tranAmtRangeMax,
      effctvFrom: effctvFrom ?? this.effctvFrom,
      percentFee: percentFee ?? this.percentFee,
      tranAmtRangeMin: tranAmtRangeMin ?? this.tranAmtRangeMin,
      flatFee: flatFee ?? this.flatFee,
    );
  }


  @override
  int get hashCode =>
      effctvTo.hashCode ^
      tranAmtRangeMax.hashCode ^
      effctvFrom.hashCode ^
      percentFee.hashCode ^
      tranAmtRangeMin.hashCode ^
      flatFee.hashCode ;


  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterchangeFeeDetailsObject && other.hashCode == hashCode;
  }


  bool get isNotEmpty => this != InterchangeFeeDetailsObject.empty();
}
