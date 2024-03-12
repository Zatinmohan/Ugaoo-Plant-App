part of '../pages/address_page.dart';

class PaymentButtonWidget extends StatelessWidget {
  const PaymentButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width * 0.14,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 2.0,
        color: ColorConstants.kSecondaryAccentColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
        ),
        child: Center(
          child: Text(
            "Continue Payment",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.sizeOf(context).width * 0.05,
                ),
          ),
        ),
      ),
    );
  }
}
