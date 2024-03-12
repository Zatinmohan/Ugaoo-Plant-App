import 'package:ugaoo/pages/new_address_page/data/models/pincode_status_model.dart';
import 'package:ugaoo/pages/new_address_page/data/repositories_impl/new_address_repo_impl.dart';
import 'package:ugaoo/pages/address_page/domain/entities/pincode_entities/pincode_result_entity.dart';
import 'package:ugaoo/pages/address_page/errors/pincode_api_errors.dart';
import 'package:ugaoo/pages/new_address_page/extensions/pincode_result_extension.dart';

class FetchStatesByPincodeUsecase {
  final NewAddressRepoImpl _addressRepoImpl;

  const FetchStatesByPincodeUsecase({required NewAddressRepoImpl addressRepo})
      : _addressRepoImpl = addressRepo;

  Future<PincodeResultEntity?> fetchStateFromPincode({
    required String pincode,
  }) async {
    try {
      final PincodeStatusModel status =
          await _addressRepoImpl.fetchStateFromPincode(pincode: pincode);

      if (status.postOffice?.isEmpty ?? true) {
        throw PincodeExceptions.fromMessage(message: status.status);
      }
      final PincodeResultEntity? result = status.postOffice?[0].toEntity();
      return result;
    } on PincodeExceptions catch (error) {
      throw error.message;
    } catch (error) {
      rethrow;
    }
  }
}
