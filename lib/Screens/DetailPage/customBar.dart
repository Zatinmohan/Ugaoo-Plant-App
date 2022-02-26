import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: width * 0.065,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text("${Get.find<ProductController>().productName}",
                      style: TextStyle(
                        color: kDeailHeadingColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.08,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Obx(
                  () => IconButton(
                      onPressed: () {
                        AuthController.instance.updateUserFavList(
                            Get.find<ProductController>().productID);
                      },
                      icon: Get.find<UserController>()
                              .isFav(Get.find<ProductController>().productID)
                              .isTrue
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: width * 0.065,
                            )
                          : Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                              size: width * 0.065,
                            )),
                ),
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
                        () => Get.find<UserController>().isCartEmpty
                            ? SizedBox.shrink()
                            : Positioned(
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
                                    child: Text(
                                        "${Get.find<UserController>().getLength()}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.03,
                                        )),
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
