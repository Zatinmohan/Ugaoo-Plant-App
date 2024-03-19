import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/sub_category_entity.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/category_controllers/home_page_category_notifier.dart';
import 'package:ugaoo/pages/home_page/states/home_data_controllers/home_page_data_notifier.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

part '../views/widgets/search_widget.dart';
part 'widgets/sale_carousel_widget.dart';
part 'widgets/category_widgets/category_page.dart';
part 'widgets/category_widgets/category_card_widget.dart';
part 'widgets/home_tab_bar_widget.dart';
part 'widgets/home_tab_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });

    super.initState();
  }

  Future<void> fetchData() async {
    await ref
        .read<HomePageCategoryNotifier>(
          HomePageDependencyInjection.homepageCategoryProvider.notifier,
        )
        .fetchProductCategories();

    await ref
        .read<HomePageDataNotifier>(
          HomePageDependencyInjection.homepageProductProvider.notifier,
        )
        .fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final homeCategoryProvider = ref.watch(
      HomePageDependencyInjection.homepageCategoryProvider,
    );
    final homeProductProvider =
        ref.watch(HomePageDependencyInjection.homepageProductProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text("Ugaoo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
        child: homeCategoryProvider.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Container(),
          data: (data) {
            return data.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              categoryLoadingState: () =>
                  const Center(child: CircularProgressIndicator()),
              categoryLoadedState: (categoryData) {
                _controller = TabController(
                  length: categoryData.categoriesList?.length ?? 0,
                  vsync: this,
                  initialIndex: 0,
                );

                return NestedScrollView(
                  headerSliverBuilder: (context, isInnerBoxScrolled) {
                    return [
                      const SliverToBoxAdapter(child: HomePageSerchWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                      const SliverToBoxAdapter(child: HomePageSalesWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                    ];
                  },
                  body: Column(
                    children: [
                      CustomHomeTabBarWidget(
                        controller: _controller,
                        categories: categoryData.categoriesList ?? [],
                      ),
                      Expanded(
                        child: homeProductProvider.when(
                          data: (state) => state.when(
                            initial: () => const SizedBox.shrink(),
                            loadingState: () => const SizedBox.shrink(),
                            loadedState: (productData) {
                              return HomeTabView(
                                controller: _controller,
                                data: productData,
                              );
                            },
                          ),
                          error: (error, stackTrace) => const SizedBox.shrink(),
                          loading: () => const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
