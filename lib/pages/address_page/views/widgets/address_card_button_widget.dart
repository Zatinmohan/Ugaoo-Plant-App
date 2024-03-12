part of '../pages/address_page.dart';


class AddressCardButtonWidget extends StatelessWidget {
  const AddressCardButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;
    return Container(
      width: _size,
      height: _size * 0.12,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Change/Edit",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorConstants.kPrimaryAccentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          Expanded(
            child: Center(
              child: Text(
                "Remove",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorConstants.kPrimaryAccentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
