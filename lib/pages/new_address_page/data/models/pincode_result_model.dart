class PincodeResultModel {
  final String? name;
  final String? description;
  final String? branchType;
  final String? deliveryStatus;
  final String? taluk;
  final String? circle;
  final String? district;
  final String? division;
  final String? region;
  final String? state;
  final String? country;

  const PincodeResultModel({
    this.name,
    this.description,
    this.branchType,
    this.deliveryStatus,
    this.taluk,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.state,
    this.country,
  });

  factory PincodeResultModel.fromJson(Map<String, dynamic> json) =>
      PincodeResultModel(
        name: json["Name"],
        description: json["Description"],
        branchType: json["BranchType"],
        deliveryStatus: json["DeliveryStatus"],
        taluk: json["Taluk"],
        circle: json["Circle"],
        district: json["District"],
        division: json["Division"],
        region: json["Region"],
        state: json["State"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Description": description,
        "BranchType": branchType,
        "DeliveryStatus": deliveryStatus,
        "Taluk": taluk,
        "Circle": circle,
        "District": district,
        "Division": division,
        "Region": region,
        "State": state,
        "Country": country,
      };
}
