part of '../pages/address_page.dart';

class AddressCardWidget extends ConsumerWidget {
  final int currentIndex;
  const AddressCardWidget({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _size = MediaQuery.sizeOf(context).width;
    final _providerWatcher = ref.watch<AddressPageProvider>(
      AddressPageDependencyInjection.addressProvider,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            ref
                .read<AddressPageProvider>(
                  AddressPageDependencyInjection.addressProvider,
                )
                .onAddressSelected(currentIndex);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _UserAddressWidget(
                        customerName: "Customer Name-1",
                        customAddressType: "Home",
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        "A-502, Street Number-5 Fun Locality, Agra, Uttar Pradesh",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: _size * 0.038,
                              fontWeight: FontWeight.w400,
                            ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        "Pincode: 100100",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: _size * 0.038,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(height: 6.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Mobile: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: _size * 0.038,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            TextSpan(
                              text: "+91 9898989898",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: _size * 0.038,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      width: MediaQuery.sizeOf(context).width * 0.05,
                      height: MediaQuery.sizeOf(context).width * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _providerWatcher.selectedAddressIndex ==
                                  currentIndex
                              ? ColorConstants.kPrimaryAccentColor
                                  .withOpacity(0.7)
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _providerWatcher.selectedAddressIndex == currentIndex
            ? AddressCardButtonWidget()
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _UserAddressWidget extends StatelessWidget {
  final String customerName;
  final String customAddressType;
  const _UserAddressWidget({
    required this.customerName,
    required this.customAddressType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${customerName}",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.sizeOf(context).width * 0.04,
              ),
        ),
        const SizedBox(width: 8.0),
        Container(
          padding: const EdgeInsets.all(1.0),
          width: MediaQuery.sizeOf(context).width * 0.09,
          height: MediaQuery.sizeOf(context).width * 0.04,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: FittedBox(
            child: Text(
              "${customAddressType}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
