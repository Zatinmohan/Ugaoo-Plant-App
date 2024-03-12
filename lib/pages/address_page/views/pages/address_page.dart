import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/address_page/address_page_dependency_injection.dart';
import 'package:ugaoo/pages/address_page/states/address_page_provider.dart';
import 'package:ugaoo/routes/constants/routes_name.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

part '../widgets/address_card_button_widget.dart';
part '../widgets/add_new_address_button.dart';
part '../widgets/payment_button_widget.dart';
part '../widgets/address_card_widget.dart';

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 10.0,
            ),
            child: Text(
              "Deliver To",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                  ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                );
              },
              itemBuilder: (context, index) {
                if (index == 4) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.goNamed(RoutesName.NEW_ADDRESS_PAGE);
                    },
                    child: const AddNewAddressWidget(),
                  );
                }
                return SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: AddressCardWidget(currentIndex: index),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const PaymentButtonWidget(),
          ),
        ],
      ),
    );
  }
}
