import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ugaoo/errors/http_exceptions.dart';
import 'package:ugaoo/private_keys/private_keys.dart';
import 'package:ugaoo/services/api/api_constants.dart';
import 'package:ugaoo/services/api/repositories/network_request_repo.dart';

const String _logName = "Dio Client Activated";

class DioClient implements NetworkRepoImpl {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    log("Dio Service Activated", name: _logName);
  }

  String _getFinalEndPoint({
    required String endpoint,
    required bool useBaseUrl,
  }) {
    final String _finalEndPoint;
    if (useBaseUrl) {
      _finalEndPoint = "${ApiConstants.BASE_URL}$endpoint";
    } else {
      _finalEndPoint = endpoint;
    }

    return _finalEndPoint;
  }

  @override
  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl = false,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        _getFinalEndPoint(endpoint: endPoint, useBaseUrl: useBaseUrl),
        queryParameters: params,
      );

      return response.data;
    } on DioException catch (e) {
      throw HttpExceptions.fromCode(errorCode: e.response?.statusCode).message;
    } catch (error) {
      throw const HttpExceptions();
    }
  }

  @override
  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl = false,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        _getFinalEndPoint(endpoint: endPoint, useBaseUrl: useBaseUrl),
        queryParameters: params,
      );
      return response.data;
    } on DioException catch (e) {
      throw HttpExceptions.fromCode(errorCode: e.response?.statusCode);
    } catch (error) {
      throw const HttpExceptions();
    }
  }
}
