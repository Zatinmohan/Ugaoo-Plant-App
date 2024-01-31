import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/bottom_navigation_page/provider/bottom_nav_provider.dart';

class BottomNavigationDependencyInjection {
  static final bottomNavigationProvier =
      ChangeNotifierProvider<BottomNavigationProvider>(
    (ref) => BottomNavigationProvider(),
  );
}
