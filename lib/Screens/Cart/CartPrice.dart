import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/misc/colors.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartItemController _controller = Get.put(CartItemController());
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Obx(() {
            var price = _controller.getPrice();
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PriceWidget(title: "Cart Total", price: price, isTotal: false),
                SizedBox(height: 10.0),
                PriceWidget(title: "GST", price: "Rs. 74.0", isTotal: false),
                SizedBox(height: 10.0),
                PriceWidget(
                    title: "Delivery", price: "Rs. 50.0", isTotal: false),
                SizedBox(height: 12.0),
                Divider(height: 2.0, color: Colors.grey),
                SizedBox(height: 12.0),
                PriceWidget(
                    title: "Total", price: "${price + 50}", isTotal: true)
              ],
            );
          }),
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final title;
  final price;
  final isTotal;

  const PriceWidget({
    Key? key,
    this.title,
    this.price,
    this.isTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title",
          style: TextStyle(
            color: kHeadingTextColor,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
            fontSize: isTotal ? width * 0.05 : width * 0.04,
          ),
        ),
        Text(
          "$price",
          style: TextStyle(
            color: kDeailHeadingColor,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
            fontSize: isTotal ? width * 0.05 : width * 0.04,
          ),
        )
      ],
    );
  }
}
