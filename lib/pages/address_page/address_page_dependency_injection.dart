import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/pages/address_page/data/repositories_impl/new_address_repo_impl.dart';
import 'package:ugaoo/pages/address_page/domain/usecases/fetch_status_by_pincode_usecase.dart';
import 'package:ugaoo/pages/address_page/states/address_page_provider.dart';
import 'package:ugaoo/pages/address_page/states/new_address_page_provider.dart';

class AddressPageDependencyInjection {
  static final newAddressRepoImpl = Provider<NewAddressRepoImpl>((ref) {
    final apiProvider = ref.read(GlobalDependencyInjection.apiProvider);
    return NewAddressRepoImpl(
      provider: apiProvider,
    );
  });

  static final fetchAddressByPincodeUsecase =
      Provider<FetchStatesByPincodeUsecase>((ref) {
    return FetchStatesByPincodeUsecase(
      addressRepo: ref.read(newAddressRepoImpl),
    );
  });

  static final addressProvider = ChangeNotifierProvider<AddressPageProvider>(
    (ref) => AddressPageProvider(),
  );

  static final addNewAddressProvider =
      ChangeNotifierProvider<NewAddressPageProvider>((ref) {
    return NewAddressPageProvider(
      fetchStates: ref.read(fetchAddressByPincodeUsecase),
    );
  });
}
