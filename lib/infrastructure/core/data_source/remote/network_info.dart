import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;

  Stream<bool> isDeviceOnline();
}

@LazySingleton(as: INetworkInfo)
class NetworkInfo implements INetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfo(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  Stream<bool> isDeviceOnline() => _internetConnectionChecker.onStatusChange.map((InternetConnectionStatus status) => status == InternetConnectionStatus.connected);

}
