import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/pages/new_address_page/domain/usecase/fetch_status_by_pincode_usecase.dart';
import 'package:ugaoo/pages/new_address_page/states/new_address_page_provider.dart';

import 'data/repositories_impl/new_address_repo_impl.dart';

class NewAddressPageDependencyInjection {
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

  static final addNewAddressProvider =
      ChangeNotifierProvider<NewAddressPageProvider>((ref) {
    return NewAddressPageProvider(
      fetchStates: ref.read(fetchAddressByPincodeUsecase),
    );
  });
}
