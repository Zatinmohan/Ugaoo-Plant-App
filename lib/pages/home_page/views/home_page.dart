import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

part '../views/widgets/search_widget.dart';
part 'widgets/sale_carousel_widget.dart';
part 'widgets/category_widgets/category_page.dart';
part 'widgets/category_widgets/category_card_widget.dart';
part 'widgets/home_tab_bar_widget.dart';
part 'widgets/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
      child: NestedScrollView(
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
            CustomHomeTabBarWidget(controller: _controller),
            const SizedBox(height: 24.0),
            Expanded(
              child: HomeTabView(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
