part of '../../profile_page.dart';

class LoginHereWidget extends StatelessWidget {
  const LoginHereWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircleAvatar(
            radius: MediaQuery.sizeOf(context).width * 0.45,
          ),
        ),
        const SizedBox(width: 5.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Hi There,",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.push(RoutesName.LOGIN_SCREEN);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.zero),
                        minimumSize: MaterialStatePropertyAll(
                          Size(
                            MediaQuery.sizeOf(context).width * 0.35,
                            MediaQuery.sizeOf(context).width * 0.12,
                          ),
                        ),
                        maximumSize: MaterialStatePropertyAll(
                          Size(
                            MediaQuery.sizeOf(context).width * 0.35,
                            MediaQuery.sizeOf(context).width * 0.12,
                          ),
                        ),
                      ),
                  child: const Text("Login Here"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
