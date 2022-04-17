import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/MainPage/mainPageController.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/misc/colors.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ProductController>();
    final _controller2 = Get.find<MainPageController>();

    return Obx(() => _controller2.productList.isEmpty ||
            _controller2.productList.value == null
        ? Center(child: CircularProgressIndicator(color: kBackgroundColor))
        : GridView.builder(
            itemCount: _controller2.productList.length,
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: (0.48 * height) / height,
            ),
            itemBuilder: (context, index) {
              var productData = _controller2.productList[index];

              return GestureDetector(
                  onTap: () {
                    _controller.tappedProduct = index;
                    Get.toNamed('/Login/Main/Detail');
                  },
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: width,
                          height: width * 0.5,
                          child: Card(
                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 10.0, bottom: 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${productData.productName}",
                                      style: TextStyle(
                                        color: kHeadingTextColor,
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2.5),
                                    Text(
                                      "${productData.productFamily}",
                                      style: TextStyle(
                                        color: kDeailHeadingColor,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "Rs. ${productData.productPrice}",
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                        fontSize: width * 0.065,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Hero(
                          tag: productData.productImage.toString(),
                          child: Image.network(
                            productData.productImage.toString(),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ]));
            }));
  }
}
