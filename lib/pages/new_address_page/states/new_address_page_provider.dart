import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ugaoo/pages/address_page/domain/entities/pincode_entities/pincode_result_entity.dart';
import 'package:ugaoo/pages/new_address_page/domain/usecase/fetch_status_by_pincode_usecase.dart';

enum HOME_TYPE { HOME, OFFICE, OTHER }

const String _logName = "New Address Page Provider";

class NewAddressPageProvider extends ChangeNotifier {
  HOME_TYPE homeType = HOME_TYPE.HOME;
  final FetchStatesByPincodeUsecase _fetchStatesByPincode;

  bool _isLoading = false;

  void setLoadingState(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  NewAddressPageProvider({required FetchStatesByPincodeUsecase fetchStates})
      : _fetchStatesByPincode = fetchStates {
    log("New Address Page Init", name: _logName);
  }

  void changeHomeType({required HOME_TYPE type}) {
    homeType = type;
    notifyListeners();
  }

  Future<PincodeResultEntity> getStatesByPincode({
    required String pincode,
  }) async {
    try {
      setLoadingState(true);
      final PincodeResultEntity? result =
          await _fetchStatesByPincode.fetchStateFromPincode(pincode: pincode);

      if (result == null) {
        throw "Enter a valid pincode";
      }
      setLoadingState(false);
      return result;
    } catch (error) {
      setLoadingState(false);
      rethrow;
    }
  }

  @override
  void dispose() {
    log("New Address Page Dispose", name: _logName);
    super.dispose();
  }
}
