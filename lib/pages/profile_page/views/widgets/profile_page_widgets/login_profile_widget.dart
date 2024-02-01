part of '../../profile_page.dart';

class LoginProfilePage extends ConsumerStatefulWidget {
  const LoginProfilePage({super.key});

  @override
  ConsumerState<LoginProfilePage> createState() => _LoginProfilePageState();
}

class _LoginProfilePageState extends ConsumerState<LoginProfilePage> {
  late final ProfilePageProvider provider;
  final List<ProfileSettingsModel> settingsButton = [
    ProfileSettingsModel(name: "My Orders", onTap: () {}),
    ProfileSettingsModel(name: "Addresses", onTap: () {}),
    ProfileSettingsModel(name: "Settings", onTap: () {}),
    ProfileSettingsModel(name: "Sign out", onTap: () {}),
  ];

  @override
  void initState() {
    provider = ref.read(ProfileDependencyInjection.profileProvider);
    provider.getAppVersion();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watchProvider = ref.watch(ProfileDependencyInjection.profileProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width * 0.5,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(
                flex: 1,
                child: const UserProfileImageWidget(),
              ),
              const Flexible(
                flex: 1,
                child: UserInfoWidget(),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: settingsButton.length,
            itemBuilder: (context, index) {
              return CustomProfileButtonWidget(data: settingsButton[index]);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Version: ${watchProvider.appVersion}",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                  fontSize: MediaQuery.sizeOf(context).width * 0.032,
                ),
          ),
        ),
      ],
    );
  }
}

class UserProfileImageWidget extends StatelessWidget {
  const UserProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 4.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: CircleAvatar(
          radius: MediaQuery.sizeOf(context).width * 0.3,
        ),
      ),
    );
  }
}
