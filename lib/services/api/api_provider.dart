import 'package:flutter/foundation.dart';
import 'package:ugaoo/services/api/repositories/network_request_repo.dart';

class ApiProvider extends ChangeNotifier {
  final NetworkRepoImpl _networkService;

  ApiProvider({required NetworkRepoImpl networkService})
      : _networkService = networkService;

  NetworkRepoImpl get networkService => _networkService;

  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await _networkService.getRequest(
        endPoint: endPoint,
        params: params,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await _networkService.postRequest(
        endPoint: endPoint,
        params: params,
      );
    } catch (error) {
      rethrow;
    }
  }
}
