import 'package:flutter/foundation.dart';
import 'package:ugaoo/utils/services/api_provider/repositories/network_request_repo.dart';

class ApiProvider extends ChangeNotifier {
  final NetworkRepoImpl _networkService;

  ApiProvider({required NetworkRepoImpl networkService})
      : _networkService = networkService;

  NetworkRepoImpl get networkService => _networkService;
}
