//ENV Constants
const kClientId = 'CLIENT_ID';
const kClientSecret = 'CLIENT_SECRET';
const kUsername = 'USERNAME';
const kPassword = 'PASSWORD';

//API Constants
class ApiConstants {
  static const String _baseUrl = 'https://developer.fidypay.com';

  static const String _bbpsUrl = '$_baseUrl/bbps';
  static const String _bankingUrl = '$_baseUrl/payout/v3';
  static const String _paymentLinkUrl = '$_baseUrl/pg';
  static const String _enachUrl = '$_baseUrl/enach';

  //BBPS
  //biller
  static const _biller = '$_bbpsUrl/biller';
  static const getBillerList = '$_biller/getBillerList';
  static const getBillerAllDetailsByCategoryName =
      '$_biller/getBillerAllDetailsByCategoryName';
  static const billerGetBalance = '$_biller/getBalance';
  static const billerFetchBill = '$_biller/fetchBill';
  static const billerBillPay = '$_biller/billPay';

  static billerCheckPaymentStatus({required String merchantTrxnRefId}) =>
      '$_biller/checkPaymentStatus/$merchantTrxnRefId';
  static const raiseComplaint = '$_biller/raiseComplaint';

  static checkComplaintStatusByComplaintId({required String complaintId}) =>
      '$_biller/checkComplaintStatusByComplaintId?complaintId=$complaintId';

  //bbpsPrepaid
  static const _bbpsPrepaid = '$_bbpsUrl/bbpsPrepaid';
  static const getOperatorAndCircleInfoAndMobilePlan =
      '$_bbpsPrepaid/getOperatorAndCircleInfoAndMobilePlan';
  static const prepaidPaymentValidation = '$_bbpsPrepaid/paymentValidation';
  static const prepaidBillPaymentRequest = '$_bbpsPrepaid/billPaymentRequest';
  static const getBillerPlans = '$_bbpsPrepaid/getBillerPlans';
  static const getCircleList = '$_bbpsPrepaid/getCircleList';
  static const getOperatorList = '$_bbpsPrepaid/getOperatorList';
  static const getMobilePlans = '$_bbpsPrepaid/getMobilePlans';

  //BANKING
  static const merchantRegister = '$_bankingUrl/merchantRegister';
  static const bankInfoRegisterOtp = '$_bankingUrl/bankInfoRegisterOtp';
  static const merchantBankInfoRegister =
      '$_bankingUrl/merchantBankInfoRegister';
  static const domesticPayment = '$_bankingUrl/domesticPayment';
  static verifyIfscCode({required String beneficiaryIFSCcode}) =>
      '$_bankingUrl/verifyIfscCode/$beneficiaryIFSCcode';

  static domesticPaymentStatus(
          {required String bankAccountKey, required String trxnId}) =>
      '$_bankingUrl/$bankAccountKey/domesticPaymentStatus/$trxnId';
  static const checkStatement = '$_bankingUrl/checkStatement';

  static checkBalance({required String bankAccountKey}) =>
      '$_bankingUrl/checkBalance/$bankAccountKey';

//otp-based
  static sendOtp({required String bankAccountKey, required double amount}) =>
      '$_bankingUrl/$bankAccountKey/sendOtp/$amount';
  static otpVerification(
      {required String otp, required String merchantTrxnRefId}) =>
      '$_bankingUrl/$otp/otpVerification/$merchantTrxnRefId';

  //token-based
  static generateToken({required String bankAccountKey, required double amount}) =>
      '$_bankingUrl/$bankAccountKey/generateToken/$amount';


  //PAYMENT-LINK
  static createOrder({required String trxnId}) => '$_paymentLinkUrl/createOrder';
  static checkStatus({required String trxnId}) => '$_paymentLinkUrl/checkStatus/$trxnId';
  static refund({required String trxnId}) => '$_paymentLinkUrl/refund/$trxnId';
  static refundStatus({required String trxnId}) => '$_paymentLinkUrl/refundStatus/$trxnId';

  //V2
  static const createOrderPG = '$_paymentLinkUrl/createOrderPG';
  static checkPaymentStatus({required String merchantTrxnRefId, required String pgMerchantKey}) => '$_paymentLinkUrl/checkPaymentStatus?merchantTrxnRefId=$merchantTrxnRefId&pgMerchantKey=$pgMerchantKey';
  static refundTransaction({required String merchantTrxnRefId, required String pgMerchantKey}) => '$_paymentLinkUrl/refundTransaction?merchantTrxnRefId=$merchantTrxnRefId&pgMerchantKey=$pgMerchantKey';
  static checkRefundPaymentStatus({required String merchantTrxnRefId, required String pgMerchantKey}) => '$_paymentLinkUrl/checkRefundPaymentStatus?merchantTrxnRefId=$merchantTrxnRefId&pgMerchantKey=$pgMerchantKey';

  //ENACH
  //Create Mandate
  static const createNachRequest = '$_enachUrl/V2/createNachRequest';
  static mandateDetails({required String merchantTrxnRefId}) => '$_enachUrl/V2/mandateDetails/$merchantTrxnRefId';
  static cancelMandate({required String merchantTrxnRefId}) => '$_enachUrl/v2/cancelMandate/$merchantTrxnRefId';
  static const getInstructedAgentCode = '$_enachUrl/V2/getInstructedAgentCode';

  //Create Presentation
  static const createPresentationWithoutUmrn = '$_enachUrl/V2/createPresentationWithoutUmrn';
  static const createBulkPresentationWithoutUmrn = '$_enachUrl/V2/createBulkPresentationWithoutUmrn';

  //Physical Mandate
  static const physicalNachRequest = '$_enachUrl/V2/physicalNachRequest';
  static getDebitPresentationDetails({required String merchantTrxnRefId}) => '$_enachUrl/getDebitPresentationDetails/$merchantTrxnRefId';
  static physicalMandateDetails({required String merchantTrxnRefId}) => '$_enachUrl/V2/physicalMandateDetails/$merchantTrxnRefId';
}
