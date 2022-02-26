import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ugaoo/Model/ProductModel.dart';

class ProductDatabase {
  final FirebaseFirestore _productData = FirebaseFirestore.instance;

  Future<ProductModel> getProductData() async {
    try {
      QuerySnapshot ds = await _productData.collection("Products").get();

      return ProductModel.fromJson(ds.docs);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
