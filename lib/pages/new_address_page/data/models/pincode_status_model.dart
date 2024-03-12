
import 'package:ugaoo/pages/new_address_page/data/models/pincode_result_model.dart';

class PincodeStatusModel {
  final String? message;
  final String? status;
  final List<PincodeResultModel>? postOffice;

  const PincodeStatusModel({
    this.message,
    this.status,
    this.postOffice,
  });

  factory PincodeStatusModel.fromJson(Map<String, dynamic> json) =>
      PincodeStatusModel(
        message: json["Message"],
        status: json["Status"],
        postOffice: json["PostOffice"] == null
            ? []
            : List<PincodeResultModel>.from(
                json["PostOffice"]!.map(
                  (x) => PincodeResultModel.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "PostOffice": postOffice == null
            ? []
            : List<dynamic>.from(postOffice!.map((x) => x.toJson())),
      };
}
