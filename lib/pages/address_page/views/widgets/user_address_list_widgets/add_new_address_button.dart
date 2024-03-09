part of '../../pages/address_page.dart';


class AddNewAddressWidget extends StatelessWidget {
  const AddNewAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).width * 0.15,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add New Address",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.kPrimaryAccentColor,
                  fontSize: MediaQuery.sizeOf(context).width * 0.045,
                ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: MediaQuery.sizeOf(context).width * 0.04,
          ),
        ],
      ),
    );
  }
}
