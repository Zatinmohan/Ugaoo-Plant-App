import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ugaoo/Model/userModel.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection("User")
          .doc(user.id)
          .set({"name": user.name, "email": user.email, "phone": user.phone});
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
}
