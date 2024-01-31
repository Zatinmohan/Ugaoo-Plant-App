part of '../home_page.dart';

class HomeTabView extends StatelessWidget {
  final TabController controller;
  const HomeTabView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: const [
        const CategoryWidget(
          categoryName: "Trending",
          data: ["AA", "AA", "AA", "AA"],
        ),
        CategoryWidget(
          categoryName: "Trending",
          data: ["AA", "AA", "AA", "AA"],
        ),
        CategoryWidget(
          categoryName: "Trending",
          data: ["AA", "AA", "AA", "AA"],
        ),
      ],
    );
  }
}
