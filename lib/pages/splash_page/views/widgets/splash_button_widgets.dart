part of '../../views/main_page.dart';

class SplashButtonWidgets extends StatelessWidget {
  const SplashButtonWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            context.push(RoutesName.LOGIN_SCREEN);
          },
          child: const Text("LOGIN"),
        ),
        const SizedBox(height: 16.0),
        // ElevatedButton(
        //   onPressed: () {
        //     context.push(RoutesName.REGISTER_SCREEN);
        //   },
        //   child: const Text("SIGN UP"),
        // ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
