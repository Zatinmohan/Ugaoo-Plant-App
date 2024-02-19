part of '../cart_page.dart';

class CartPriceDetailWidget extends StatelessWidget {
  const CartPriceDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2.0,
      color: ColorConstants.kBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              flex: 1,
              child: GrandTotalTextWidget(
                amount: "42",
                title: "Sub Total",
              ),
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              flex: 1,
              child: GrandTotalTextWidget(
                amount: "10",
                title: "Shipping",
              ),
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              flex: 1,
              child: GrandTotalTextWidget(
                amount: "40",
                title: "Discount",
              ),
            ),
            const SizedBox(height: 12.0),
            const Divider(
              height: 1.0,
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              flex: 1,
              child: GrandTotalTextWidget(
                amount: "12",
                title: "Total",
              ),
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              flex: 2,
              child: ContinueToAddressButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueToAddressButton extends StatelessWidget {
  
  const ContinueToAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;
    return Card(
      elevation: 2.0,
      color: ColorConstants.kSecondaryAccentColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Continue",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: _size * 0.05,
                  ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: _size * 0.045,
            ),
          ],
        ),
      ),
    );
  }
}
