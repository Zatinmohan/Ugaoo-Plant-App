import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  List<ProductList>? _productList;

  ProductModel({List<ProductList>? productList}) : _productList = productList;

  factory ProductModel.fromJson(List<DocumentSnapshot> ds) => ProductModel(
        productList:
            List<ProductList>.from(ds.map((e) => ProductList.fromJson(e))),
      );

  List<ProductList>? get productList => _productList;
}

class ProductList {
  String? _id;
  String? _name;
  String? _category;
  String? _subCategory;
  String? _image;
  String? _description;
  int? _qty;
  int? _price;
  Map<String, dynamic>? _problems;
  Map<String, dynamic>? _essentials;
  List<dynamic>? _requirement;
  String? _family;

  ProductList({
    String? id,
    String? name,
    String? category,
    String? subCategory,
    int? qty,
    int? price,
    Map<String, dynamic>? problems,
    List<dynamic>? requirement,
    String? image,
    String? description,
    Map<String, dynamic>? essentials,
    String? family,
  })  : _id = id,
        _category = category,
        _subCategory = subCategory,
        _name = name,
        _qty = qty,
        _price = price,
        _problems = problems,
        _requirement = requirement,
        _image = image,
        _description = description,
        _essentials = essentials,
        _family = family;

  factory ProductList.fromJson(var m) => ProductList(
        id: m.id,
        name: m.data()["name"],
        category: m.data()["category"],
        subCategory: m.data()["subCategory"],
        qty: m.data()["qty"],
        price: m.data()["price"],
        problems: m.data()["problems"],
        requirement: m.data()["req"],
        image: m.data()["image"],
        description: m.data()["desp"],
        essentials: m.data()["essential"],
        family: m.data()["family"],
      );

  String? get productName => _name;
  String? get productID => _id;
  String? get productCategory => _category;
  String? get productSubCategory => _subCategory;
  int? get productQuantity => _qty;
  int? get productPrice => _price;
  String? get productImage => _image;
  String? get productDescription => _description;
  String? get productFamily => _family;
  Map<String, dynamic>? get productProblems => _problems;
  Map<String, dynamic>? get productEssential => _essentials;
  List<dynamic>? get productRequirement => _requirement;
}
