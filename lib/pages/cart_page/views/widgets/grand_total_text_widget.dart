part of '../cart_page.dart';

class GrandTotalTextWidget extends StatelessWidget {
  final String title;
  final String amount;
  const GrandTotalTextWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: _size * 0.045,
              ),
        ),
        Text(
          "Rs. $amount.00",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: _size * 0.045,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
