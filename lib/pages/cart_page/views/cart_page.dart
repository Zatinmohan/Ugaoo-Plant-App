import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

part '../views/widgets/grand_total_text_widget.dart';
part 'widgets/card_price_detail_widget.dart';
part 'widgets/cart_card_product_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text("Cart"),
            Text(
              "4 Items",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(height: 2.0),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 1.1,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9.5,
                    child: const CartProductCardWidget(),
                  ),
                );
              },
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CartPriceDetailWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
