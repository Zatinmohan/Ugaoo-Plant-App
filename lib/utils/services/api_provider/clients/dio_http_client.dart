import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ugaoo/errors/http_exceptions.dart';
import 'package:ugaoo/utils/services/api_provider/repositories/network_request_repo.dart';

const String _logName = "Dio Client Activated";

class DioClient implements NetworkRepoImpl {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    log("Dio Service Activated", name: _logName);
  }

  @override
  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        endPoint,
        queryParameters: params,
      );
      return response.data;
    } on DioException catch (e) {
      throw HttpExceptions.fromCode(errorCode: e.response?.statusCode);
    } catch (error) {
      throw const HttpExceptions();
    }
  }

  @override
  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        endPoint,
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
