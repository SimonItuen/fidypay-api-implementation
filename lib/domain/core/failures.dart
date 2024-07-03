import 'package:fidypay/presentation/core/resources/strings_manager.dart';

abstract class Failure {
  final String message;
  Failure({this.message = AppStrings.somethingWentWrong});
}

class SomethingWentFailure extends Failure {
  SomethingWentFailure({super.message = AppStrings.somethingWentWrong});
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure(
      {super.message = AppStrings.noInternetConnection});
}

class ClientFailure extends Failure {
  ClientFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({super.message = AppStrings.serverError});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({super.message = AppStrings.timeoutError});
}

class NotFoundFailure extends Failure {}
