import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  // List<Address>? address;
  // List<FavItems>? favItems;
  // List<InCart>? inCart;

  UserModel({this.id, this.name, this.phone, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc["name"];
    phone = doc["phone"];
    email = doc["email"];
  }
}

// class Address {
//   late String city;
//   late String flat;
//   String? landmark;
//   late String name;
//   late String phone;
//   late int pincode;
//   late int phoneNo;
//   late String state;
//   late String street;
//   late String addressType;

//   Address(
//       {city,
//       flat,
//       landmark,
//       name,
//       phone,
//       pincode,
//       phoneNo,
//       state,
//       street,
//       addressType});
// }

// class FavItems {
//   String? productID;

//   FavItems({productID});
// }

// class InCart {
//   String? productID;
//   int? qty;

//   InCart({productID, qty});
// }
