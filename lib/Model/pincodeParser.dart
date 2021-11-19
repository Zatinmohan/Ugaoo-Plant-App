class PincodeModel {
  PincodeModel({
    this.message,
    this.status,
    this.postOffice,
  });

  String? message;
  String? status;
  List<PostOffice>? postOffice;

  factory PincodeModel.fromJson(Map<String, dynamic> json) => PincodeModel(
        message: json["Message"],
        status: json["Status"],
        postOffice: List<PostOffice>.from(
            json["PostOffice"].map((x) => PostOffice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "PostOffice": List<dynamic>.from(postOffice!.map((x) => x.toJson())),
      };
}

class PostOffice {
  PostOffice({
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

  String? name;
  String? description;
  String? branchType;
  String? deliveryStatus;
  String? taluk;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? state;
  String? country;

  factory PostOffice.fromJson(Map<String, dynamic> json) => PostOffice(
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
