import 'package:ugaoo/pages/address_page/data/models/pincode_model/pincode_result_model.dart';
import 'package:ugaoo/pages/address_page/domain/entities/pincode_entities/pincode_result_entity.dart';

extension XPincodeResultModel on PincodeResultModel {
  PincodeResultEntity toEntity() => PincodeResultEntity(
        name: this.name,
        district: this.district,
        division: this.division,
        state: this.state,
        country: this.country,
      );
}
