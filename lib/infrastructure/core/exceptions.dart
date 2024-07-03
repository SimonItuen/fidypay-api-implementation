//REMOTE EXCEPTIONS
class NoInternetConnectionException implements Exception {}

class OAuthException implements Exception {
  final String message;

  OAuthException({required this.message});

  @override
  String toString() => message;
}

class TimeoutException implements Exception {}

class CancelledException implements Exception {}

class ClientException implements Exception {
  final String message;
  final int code;

  ClientException({required this.message, required this.code});
}

class ServerException implements Exception {
  final int code;
  ServerException({required this.code});
}

class UnknownException implements Exception {
  final String message;
  UnknownException({required this.message});
  @override
  String toString() => message;
}

//LOCAL EXCEPTIONS
class ObjectNotFoundException implements Exception {}
