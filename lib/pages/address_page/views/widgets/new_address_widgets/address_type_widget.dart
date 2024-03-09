part of '../../pages/new_address_page.dart';

class AdressTypeWidget extends ConsumerWidget {
  const AdressTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerReader = ref.read<NewAddressPageProvider>(
      AddressPageDependencyInjection.addNewAddressProvider,
    );
    ref.watch<NewAddressPageProvider>(
      AddressPageDependencyInjection.addNewAddressProvider,
    );
    return InputDecorator(
      decoration: InputDecoration(
        filled: false,
        labelText: 'Address Type',
        labelStyle: TextFieldStyles.getlabelTextStyle(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioButtonWidget(
              text: "Home",
              isSelected: providerReader.homeType == HOME_TYPE.HOME,
              onTap: () {
                providerReader.changeHomeType(type: HOME_TYPE.HOME);
              },
            ),
            CustomRadioButtonWidget(
              text: "Office",
              isSelected: providerReader.homeType == HOME_TYPE.OFFICE,
              onTap: () {
                providerReader.changeHomeType(type: HOME_TYPE.OFFICE);
              },
            ),
            CustomRadioButtonWidget(
              text: "Other",
              isSelected: providerReader.homeType == HOME_TYPE.OTHER,
              onTap: () {
                providerReader.changeHomeType(type: HOME_TYPE.OTHER);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadioButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomRadioButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: _size * 0.035,
            height: _size * 0.035,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorConstants.kPrimaryAccentColor
                    : Colors.transparent,
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.grey, width: 2.0),
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: _size * 0.04,
                ),
          ),
        ],
      ),
    );
  }
}
