part of '../../views/main_page.dart';

class SplashButtonWidgets extends StatelessWidget {
  const SplashButtonWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _buttonWidth = MediaQuery.sizeOf(context).width * 0.68;
    double _buttonHeight = MediaQuery.sizeOf(context).width * 0.15;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            context.push(RoutesName.LOGIN_SCREEN);
          },
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                minimumSize: MaterialStateProperty.all(
                  Size(
                    _buttonWidth,
                    _buttonHeight,
                  ),
                ),
              ),
          child: const Text("LOGIN"),
        ),
        const SizedBox(height: 32.0),
        // ElevatedButton(
        //   onPressed: () {
        //     context.push(RoutesName.REGISTER_SCREEN);
        //   },
        //   style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        //         backgroundColor: const MaterialStatePropertyAll(
        //           ColorConstants.kBackgroundColor,
        //         ),
        //         minimumSize: MaterialStateProperty.all(
        //           Size(
        //             _buttonWidth,
        //             _buttonHeight,
        //           ),
        //         ),
        //       ),
        //   child: const Text("SIGN UP"),
        // ),
      ],
    );
  }
}