abstract class NetworkRepo {
  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl,
  });

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? params,
    bool useBaseUrl,
  });
}
