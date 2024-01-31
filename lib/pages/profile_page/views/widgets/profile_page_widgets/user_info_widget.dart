part of '../../profile_page.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "FIRST NAME LAST NAME",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 2.0),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "email@email.com",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  ),
            ),
          ),
          const SizedBox(height: 2.0),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  minimumSize: MaterialStatePropertyAll(
                    Size(
                      MediaQuery.sizeOf(context).width * 0.04,
                      MediaQuery.sizeOf(context).width * 0.08,
                    ),
                  ),
                  maximumSize: MaterialStatePropertyAll(
                    Size(
                      MediaQuery.sizeOf(context).width,
                      MediaQuery.sizeOf(context).width * 0.08,
                    ),
                  ),
                ),
            onPressed: () {},
            child: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}
