part of '../home_page.dart';

class HomeTabView extends StatelessWidget {
  final TabController controller;
  final ProductDataEntity data;
  const HomeTabView({
    super.key,
    required this.controller,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final int currentTabIndex = controller.index;
    return TabBarView(
      controller: controller,
      children: List.generate(controller.length, (index) {
        final String subCategoryName = data.categories?[currentTabIndex]
                .subCategories?[index].subCategoryName ??
            "";
        final List<SubCategoryEntity> products =
            data.categories?[currentTabIndex].subCategories ?? [];

        log("AJFKLAF: ${subCategoryName}");
        return CategoryWidget(
          subCategoryName: subCategoryName,
          data: products,
        );
      }),
      // children: const [
      //   const CategoryWidget(
      //     categoryName: "Trending",
      //     data: ["AA", "AA", "AA", "AA"],
      //   ),
      //   CategoryWidget(
      //     categoryName: "Trending",
      //     data: ["AA", "AA", "AA", "AA"],
      //   ),
      //   CategoryWidget(
      //     categoryName: "Trending",
      //     data: ["AA", "AA", "AA", "AA"],
      //   ),
      // ],
    );
  }
}
