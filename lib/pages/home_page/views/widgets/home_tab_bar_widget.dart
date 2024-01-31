part of '../home_page.dart';

class CustomHomeTabBarWidget extends StatelessWidget {
  final TabController controller;
  const CustomHomeTabBarWidget({
    super.key,
    required this.controller,
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
          tabs: const [
            FittedBox(
              fit: BoxFit.contain,
              child: Tab(
                text: "House Plant",
                iconMargin: EdgeInsets.zero,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Tab(
                text: "EverGreen Plant",
                iconMargin: EdgeInsets.zero,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Tab(
                text: "Palm Tree",
                iconMargin: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
