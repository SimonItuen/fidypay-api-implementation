import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fidypay/infrastructure/core/constants.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/api_response.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/client/i_http_client.dart';
import 'package:fidypay/infrastructure/core/data_source/remote/network_info.dart';
import 'package:fidypay/infrastructure/core/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@LazySingleton(as: IHttpClient)
class HttpClient implements IHttpClient {
  final Dio _client;
  final INetworkInfo _networkInfo;
  final Map<String, dynamic> _headers = {
    'accept': '*/*',
    'Client-Id': dotenv.env[kClientId],
    'Client-Secret': dotenv.env[kClientSecret],
    'Authorization':
        'Basic ${base64.encode(utf8.encode('${dotenv.env[kUsername]}:${dotenv.env[kPassword]}'))}',
  };

  HttpClient(this._client, this._networkInfo) {
    _client.options.receiveTimeout = const Duration(milliseconds: 60 * 1000);
    _client.options.sendTimeout = const Duration(milliseconds: 60 * 1000);
    if (kDebugMode) {
      _client.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  Future<void> _checkInternetConnection() async {
    if (!(await _networkInfo.isConnected)) {
      throw NoInternetConnectionException();
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String url,
      {Map<String, String> headers = const {}}) async {
    await _checkInternetConnection();
    try {
      headers = {...headers, ..._headers};
      final res = await _client.get(
        url,
        options: Options(headers: headers),
      );
      if (res.statusCode.toString().startsWith('2')) {
        if (res.statusCode == 204) {
          return ApiResponse.noContent(headers: res.headers.map);
        } else {
          return ApiResponse(data: res.data, headers: res.headers.map);
        }
      }
      throw UnknownException(message: res.data['message']);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(String url,
      {Map<String, String> headers = const {}, dynamic body}) async {
    await _checkInternetConnection();
    try {
      headers = {...headers, ..._headers};
      final res = await _client.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (res.statusCode.toString().startsWith('2')) {
        if (res.statusCode == 204) {
          return ApiResponse.noContent(headers: res.headers.map);
        } else {
          return ApiResponse(data: res.data, headers: res.headers.map);
        }
      }
      throw UnknownException(message: res.data['message']);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> put(String url,
      {Map<String, String> headers = const {}, dynamic body}) async {
    await _checkInternetConnection();
    try {
      headers = {...headers, ..._headers};
      final res = await _client.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (res.statusCode.toString().startsWith('2')) {
        if (res.statusCode == 204) {
          return ApiResponse.noContent(headers: res.headers.map);
        } else {
          return ApiResponse(data: res.data, headers: res.headers.map);
        }
      }
      throw UnknownException(message: res.data['message']);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> delete(String url,
      {Map<String, String> headers = const {}, dynamic body}) async {
    await _checkInternetConnection();
    try {
      headers = {...headers, ..._headers};
      final res = await _client.delete(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (res.statusCode.toString().startsWith('2')) {
        if (res.statusCode == 204) {
          return ApiResponse.noContent(headers: res.headers.map);
        } else {
          return ApiResponse(data: res.data, headers: res.headers.map);
        }
      }
      throw UnknownException(message: res.data['message']);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  Exception convertException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutException();
      case DioExceptionType.sendTimeout:
        return TimeoutException();
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.badResponse:
        return (e.response?.data['status'] ?? e.response?.data['Status'] ?? '')
                .toString()
                .startsWith('4')
            ? ClientException(
                message: e.response?.data['data'].runtimeType == String
                    ? e.response?.data['data'] ?? e.response?.data['Data']
                    : e.response?.data['data']?['msg'] ??
                        e.response?.data['Data']?['msg'],
                code: int.tryParse((e.response?.data['status'] ??
                            e.response?.data['Status'] ??
                            '')
                        .toString()) ??
                    401)
            : ServerException(
                code: int.tryParse(e.response?.data['status'] ??
                        e.response?.data['Status'] ??
                        '') ??
                    500);

      case DioExceptionType.cancel:
        return CancelledException();
      default:
        return UnknownException(message: 'unknown error');
    }
  }
}
