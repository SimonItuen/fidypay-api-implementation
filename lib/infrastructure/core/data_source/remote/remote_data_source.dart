import 'package:fidypay/infrastructure/core/constants.dart';
import 'package:fidypay/infrastructure/core/data_source/cache_mixin.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/api_response.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/client/i_http_client.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/i_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRemoteDataSource)
class RemoteDataSource extends IRemoteDataSource with CacheMixin {
  final IHttpClient _httpClient;

  RemoteDataSource(this._httpClient);

  @override
  Future<List<String>> getBillerList() async {
    ApiResponse res = await _httpClient.post(ApiConstants.getBillerList);
    List <String> billerList = res.data['payload']['billerCategories'];
    return billerList;
  }

  @override
  Future<double> getBalance() {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getBillerAllDetailsByCategoryName({required String category}) {
    // TODO: implement getBillerAllDetailsByCategoryName
    throw UnimplementedError();
  }
}
