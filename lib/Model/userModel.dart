import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? _id;
  String? _name;
  String? _phone;
  String? _email;
  Map<String?, dynamic>? _cartItems = new Map();
  List<Address>? _address = new List.empty();
  List? _favItems = new List.empty();

  UserModel(
      {String? id,
      String? name,
      String? phone,
      String? email,
      List? favItems,
      List<Address>? address,
      Map<String?, int>? cartItems})
      : _id = id,
        _name = name,
        _phone = phone,
        _email = email,
        _cartItems = cartItems,
        _address = address,
        _favItems = favItems;

  // UserModel({this.id, this.name, this.phone, this.email, this.cartItems});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    _id = doc.id;
    _name = doc["name"];
    _phone = doc["phone"];
    _email = doc["email"];
    _cartItems = doc["inCart"];
    _favItems = doc["fav"];
    _address =
        List<Address>.from(doc["address"].map((x) => Address.fromList(x)));
  }

  String? get userID => _id;

  String? get userName => _name;

  String? get userPhone => _phone;

  String? get userEmail => _email;

  Map<String?, dynamic>? get userCartItems => _cartItems;

  List? get favItems => _favItems;

  List<Address>? get getAddress => _address;

  void setUserAddress(List<Address> address) {
    _address = address;
  }

  void setList() {
    _favItems = List.empty();
  }
}

class Address {
  String? _city;
  String? _flat;
  String? _landmark;
  String? _name;
  int? _pincode;
  int? _phoneNo;
  String? _state;
  String? _street;
  String? _addressType;

  Address({
    String? city,
    String? flat,
    String? landmark,
    String? name,
    int? phoneNo,
    int? pincode,
    String? state,
    String? street,
    String? addressType,
  })  : _city = city,
        _flat = flat,
        _landmark = landmark,
        _name = name,
        _phoneNo = phoneNo,
        _pincode = pincode,
        _state = state,
        _street = street,
        _addressType = addressType;

  factory Address.fromList(Map<String, dynamic> data) => Address(
        name: data["name"],
        city: data["city"],
        flat: data["flat"],
        landmark: data["landmark"],
        phoneNo: data["phone"],
        pincode: data["pincode"],
        state: data["state"],
        street: data["street"],
        addressType: data["type"],
      );

  String? get addressName => _name;
  String? get addressCity => _city;
  String? get addressFlat => _flat;
  String? get landmark => _landmark;
  int? get addressPhone => _phoneNo;
  int? get addressPincode => _pincode;
  String? get addressState => _state;
  String? get addressStreet => _street;
  String? get addressType => _addressType;
}

class CartModel {
  String? orderID;
  int? qty;

  CartModel({this.orderID, this.qty});
}
