class CategoryNamesModel {
  final String? stringValue;

  const CategoryNamesModel({
    this.stringValue,
  });

  factory CategoryNamesModel.fromJson(Map<String, dynamic> json) =>
      CategoryNamesModel(
        stringValue: json["stringValue"],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
      };
}
