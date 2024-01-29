import 'package:flutter/foundation.dart';
import 'package:ugaoo/services/api/repositories/network_request_repo.dart';

class ApiProvider extends ChangeNotifier {
  final NetworkRepoImpl _networkService;

  ApiProvider({required NetworkRepoImpl networkService})
      : _networkService = networkService;

  NetworkRepoImpl get networkService => _networkService;
}
