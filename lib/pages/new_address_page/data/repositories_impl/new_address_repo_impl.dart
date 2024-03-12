import 'package:ugaoo/pages/new_address_page/data/models/pincode_status_model.dart';
import 'package:ugaoo/services/api/api_constants.dart';
import 'package:ugaoo/services/api/api_provider.dart';

class NewAddressRepoImpl {
  final ApiProvider _apiProvider;

  const NewAddressRepoImpl({required ApiProvider provider})
      : _apiProvider = provider;

  Future<PincodeStatusModel> fetchStateFromPincode({
    required String pincode,
  }) async {
    final String _pincodeUrl = ApiConstants.PINCODE_API + "${pincode}";
    Map<String, dynamic> json = await _apiProvider.getRequest(
      endPoint: _pincodeUrl,
    );
    try {
      final PincodeStatusModel data = PincodeStatusModel.fromJson(json);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
