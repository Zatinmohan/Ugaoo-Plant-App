part of '../main_page.dart';

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "UGAOO",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.kPrimaryAccentColor,
                height: 0.0,
              ),
        ),
        Text(
          "The Plant Shop",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorConstants.kPrimaryAccentColor,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0,
              ),
        ),
        const SizedBox(height: 40.0),
        Text(
          "'Help us to save mother earth'",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorConstants.kPrimaryAccentColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
