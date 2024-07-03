import 'package:fidypay/infrastructure/core/data_source/remote/api_response.dart';

abstract class IHttpClient {
  Future<ApiResponse<Map<String, dynamic>>> get(String url,
      {Map<String, String> headers});

  Future<ApiResponse<Map<String, dynamic>>> post(String url,
      {Map<String, String> headers, dynamic body});

  Future<ApiResponse<Map<String, dynamic>>> put(String url,
      {Map<String, String> headers, dynamic body});

  Future<ApiResponse<Map<String, dynamic>>> delete(String url,
      {Map<String, String> headers, dynamic body});
}
