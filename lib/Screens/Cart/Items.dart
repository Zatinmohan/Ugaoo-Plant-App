import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Cart/CartController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Model/ProductModel.dart';
import 'package:ugaoo/Model/userModel.dart';
import 'package:ugaoo/misc/colors.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return ListView.builder(
          itemCount: Get.find<CartController>().cartLength,
          itemBuilder: (context, index) {
            ProductList product = Get.find<CartController>().cartData![index];
            var name = product.productName;
            var price = product.productPrice;
            var image = product.productImage;

            return Container(
              height: height * 0.30,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Stack(
                    children: [
                      Container(
                        width: width,
                        margin: EdgeInsets.only(top: 35.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: SizedBox(width: width * 0.2)),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("$name",
                                          style: TextStyle(
                                            color: kHeadingTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: width * 0.065,
                                          )),
                                      SizedBox(height: 5.0),
                                      Text("Rs. $price",
                                          style: TextStyle(
                                            color: kBackgroundColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: width * 0.065,
                                          )),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            CartModel item = new CartModel(
                                                qty: Get.find<UserController>()
                                                        .userCartList[
                                                    product.productID],
                                                orderID: product.productID);
                                            Get.find<CartController>()
                                                .addQuantity(item);
                                          },
                                          icon: Icon(Icons.add)),
                                      SizedBox(height: 5.0),
                                      Obx(() => Text(
                                          "${Get.find<UserController>().userCartList[product.productID]}",
                                          style: TextStyle(
                                            color: kHeadingTextColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.05,
                                          ))),
                                      SizedBox(height: 5.0),
                                      IconButton(
                                          onPressed: () {
                                            CartModel item = new CartModel(
                                                qty: Get.find<UserController>()
                                                        .userCartList[
                                                    product.productID],
                                                orderID: product.productID);
                                            Get.find<CartController>()
                                                .subQuantity(item);
                                          },
                                          icon: Icon(Icons.remove)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Image.network(image!)),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: width * 0.12,
                          height: width * 0.12,
                          margin: EdgeInsets.only(top: 20.0),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            child: IconButton(
                                onPressed: () {
                                  Get.find<CartController>().removeDataFromCart(
                                      CartModel(
                                          orderID: Get.find<CartController>()
                                              .getOrderID(index),
                                          qty: 1));
                                  Get.find<CartController>().update();
                                },
                                icon: Icon(
                                  Icons.delete_rounded,
                                  size: width * 0.05,
                                )),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      }),
    );
  }
}
