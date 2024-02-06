part of '../../profile_page.dart';

class UserInfoWidget extends ConsumerWidget {
  final String name;
  final String email;

  const UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.isEmpty
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                )
              : FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
          const SizedBox(height: 2.0),
          email.isEmpty
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                )
              : FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    email,
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
