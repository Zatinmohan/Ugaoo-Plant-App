import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomBar extends StatelessWidget {
  final product;
  const CustomBar({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartItemController _controller = Get.put(CartItemController());
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios, size: width * 0.065),
              ),
              SizedBox(width: 10.0),
              Text("$product",
                  style: TextStyle(
                    color: kDeailHeadingColor,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.08,
                  )),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => print("Liked"),
                  icon: Icon(
                    Icons.favorite_border,
                    size: width * 0.065,
                  )),
              GestureDetector(
                onTap: () => Get.toNamed('/Login/Cart'),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 12.0),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: width * 0.07,
                      ),
                    ),
                    Obx(
                      () => _controller.cartItems.length != 0
                          ? Positioned(
                              bottom: width * 0.02,
                              right: width * 0.03,
                              child: Container(
                                width: width * 0.045,
                                height: width * 0.045,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text("${_controller.cartItems.length}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.03,
                                      )),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
