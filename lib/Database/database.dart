import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Model/userModel.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("User").doc(user.userID).set({
        "name": user.userName,
        "email": user.userEmail,
        "phone": user.userPhone,
        "address": [],
        "fav": [],
        "inCart": {}
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot ds = await _firestore.collection("User").doc(uid).get();
      return UserModel.fromDocumentSnapshot(ds);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> updateCart(String uid, CartModel cartItems) async {
    try {
      if (Get.find<UserController>().cartDataItems(cartItems)) {
        await _firestore.collection("User").doc(uid).update(
          {
            'inCart': Get.find<UserController>().cartItems,
          },
        );
      }

      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<bool> removeCartItem(String uid, CartModel cartItem) async {
    try {
      if (Get.find<UserController>().deleteCartDataItem(cartItem)) {
        await _firestore.collection("User").doc(uid).update({
          'inCart': Get.find<UserController>().cartItems,
        });
      }
      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<bool> updateCartItemsQty(
      String uid, CartModel cartItem, bool toAdd) async {
    try {
      if (toAdd)
        Get.find<UserController>().addCartItemQty(cartItem);
      else
        Get.find<UserController>().subCartItemQty(cartItem);

      await _firestore
          .collection("User")
          .doc(uid)
          .update({'inCart': Get.find<UserController>().cartItems});
      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<bool> setFav(String userID, String? itemId) async {
    try {
      if (Get.find<UserController>().updateFavList(itemId)) {
        await _firestore.collection("User").doc(userID).update({
          'fav': Get.find<UserController>().likedProductList,
        });
      }
      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<bool> updateExistingAddress(
      String userID, List<Address> address) async {
    try {
      if (Get.find<UserController>().updateUserAddress(address)) {
        await _firestore.collection("User").doc(userID).update({
          'address': Get.find<AddressController>().dataToListOfMap(),
        });
      }
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }
}
