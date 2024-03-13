import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_list_entity.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/home_page_notifier.dart';
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
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  HomePageProvider? homepageProvider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      _initStates();
    });

    super.initState();
  }

  Future<void> _initStates() async {
    homepageProvider = ref.read<HomePageProvider>(
      HomePageDependencyInjection.homepageProvider,
    );
    await homepageProvider?.fetchProductCategories();

    _controller = TabController(
      length: homepageProvider?.categoryData?.documents?.length ?? 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    homepageProvider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homePageWatcher = ref.watch<HomePageProvider>(
      HomePageDependencyInjection.homepageProvider,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text("Ugaoo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
        child: homePageWatcher.isLoading
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder: (context, isInnerBoxScrolled) {
                  return [
                    const SliverToBoxAdapter(child: HomePageSerchWidget()),
                    const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                    const SliverToBoxAdapter(child: HomePageSalesWidget()),
                    const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                  ];
                },
                body: (_controller?.length ?? 0) <= 0
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          CustomHomeTabBarWidget(
                            controller: _controller!,
                            categories:
                                homepageProvider?.categoryData?.documents ?? [],
                          ),
                          const SizedBox(height: 24.0),
                          Expanded(
                            child: HomeTabView(
                              controller: _controller!,
                            ),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}
