import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/address_page/states/address_page_provider.dart';
import 'package:ugaoo/pages/address_page/states/new_address_page_provider.dart';

class AddressPageDependencyInjection {
  static final addressProvider = ChangeNotifierProvider<AddressPageProvider>(
    (ref) => AddressPageProvider(),
  );

  static final addNewAddressProvider =
      ChangeNotifierProvider<NewAddressPageProvider>(
    (ref) => NewAddressPageProvider(),
  );
}
