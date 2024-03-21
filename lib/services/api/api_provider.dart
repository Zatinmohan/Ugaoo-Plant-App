import 'package:ugaoo/services/api/repositories/network_request_repo.dart';

class ApiProvider {
  final NetworkRepo _networkService;

  ApiProvider({required NetworkRepo networkService})
      : _networkService = networkService;

  NetworkRepo get networkService => _networkService;

  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl = false,
  }) async {
    try {
      final response = await _networkService.getRequest(
        endPoint: endPoint,
        params: params,
        useBaseUrl: useBaseUrl,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl = false,
  }) async {
    try {
      return await _networkService.postRequest(
        endPoint: endPoint,
        params: params,
        useBaseUrl: useBaseUrl,
      );
    } catch (error) {
      rethrow;
    }
  }
}
