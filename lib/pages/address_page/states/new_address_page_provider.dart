import 'package:flutter/material.dart';
import 'package:ugaoo/pages/address_page/domain/entities/pincode_entities/pincode_result_entity.dart';
import 'package:ugaoo/pages/address_page/domain/usecases/fetch_status_by_pincode_usecase.dart';

enum HOME_TYPE { HOME, OFFICE, OTHER }

class NewAddressPageProvider extends ChangeNotifier {
  HOME_TYPE homeType = HOME_TYPE.HOME;
  final FetchStatesByPincodeUsecase _fetchStatesByPincode;
  PincodeResultEntity? _pincodeResultEntity;

  bool _isLoading = false;

  void setLoadingState(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  NewAddressPageProvider({required FetchStatesByPincodeUsecase fetchStates})
      : _fetchStatesByPincode = fetchStates;

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
}
