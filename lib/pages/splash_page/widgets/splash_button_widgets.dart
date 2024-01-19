part of '../main_page.dart';

class SplashButtonWidgets extends StatelessWidget {
  const SplashButtonWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _buttonWidth = MediaQuery.sizeOf(context).width * 0.65;
    double _buttonHeight = MediaQuery.sizeOf(context).width * 0.13;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                minimumSize: MaterialStateProperty.all(
                  Size(
                    _buttonWidth,
                    MediaQuery.sizeOf(context).width * 0.14,
                  ),
                ),
              ),
          child: const Text("LOGIN"),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {},
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  ColorConstants.kBackgroundColor,
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    _buttonWidth,
                    _buttonHeight,
                  ),
                ),
              ),
          child: const Text("SIGN UP"),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
