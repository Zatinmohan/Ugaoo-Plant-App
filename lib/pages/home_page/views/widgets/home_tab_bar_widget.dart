part of '../home_page.dart';

class CustomHomeTabBarWidget extends StatelessWidget {
  final TabController controller;
  final List<CategoryDataEntity> categories;

  const CustomHomeTabBarWidget({
    super.key,
    required this.controller,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: TabBar(
          splashBorderRadius: BorderRadius.zero,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          indicator: BoxDecoration(
            color: ColorConstants.kSecondaryAccentColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          controller: controller,
          dividerColor: Colors.transparent,
          tabs: List.generate(
            controller.length,
            (index) {
              final String categoryName = categories[index].name ?? "";

              return FittedBox(child: Tab(text: categoryName));
            },
          ),
        ),
      ),
    );
  }
}
