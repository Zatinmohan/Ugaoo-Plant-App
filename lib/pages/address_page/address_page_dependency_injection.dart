import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/address_page/states/address_page_provider.dart';

class AddressPageDependencyInjection {
  static final addressProvider = ChangeNotifierProvider<AddressPageProvider>(
    (ref) => AddressPageProvider(),
  );
}
