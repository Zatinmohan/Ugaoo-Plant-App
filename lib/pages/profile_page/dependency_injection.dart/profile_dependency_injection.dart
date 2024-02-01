import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/profile_page/provider/profile_page_provider.dart';

class ProfileDependencyInjection {
  static final profileProvider = ChangeNotifierProvider<ProfilePageProvider>(
    (ref) => ProfilePageProvider(),
  );
}
