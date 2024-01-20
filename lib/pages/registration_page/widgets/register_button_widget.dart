part of '../registration_page.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                minimumSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.sizeOf(context).width * 0.65,
                    MediaQuery.sizeOf(context).width * 0.14,
                  ),
                ),
              ),
          onPressed: () {},
          child: const Text("Register"),
        ),
        const SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            "Already have an account? Login here",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
                ),
          ),
        ),
      ],
    );
  }
}
