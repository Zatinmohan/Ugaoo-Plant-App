part of '../../profile_page.dart';

class LoginProfilePage extends StatefulWidget {
  final String appVersion;
  final UserModel? user;
  final WidgetRef ref;
  const LoginProfilePage({
    super.key,
    required this.appVersion,
    required this.user,
    required this.ref,
  });
  @override
  State<LoginProfilePage> createState() => _LoginProfilePageState();
}

class _LoginProfilePageState extends State<LoginProfilePage> {
  late final List<ProfileSettingsModel> settingsButton;

  @override
  void initState() {
    settingsButton = [
      ProfileSettingsModel(name: "My Orders", onTap: () {}),
      ProfileSettingsModel(name: "Addresses", onTap: () {}),
      ProfileSettingsModel(name: "Settings", onTap: () {}),
      ProfileSettingsModel(
        name: "Sign out",
        onTap: () async {
          try {
            await widget.ref
                .read<LoginProvider>(GlobalDependencyInjection.loginProvider)
                .signOut();

            context.mounted
                ? context.pushReplacement(RoutesName.LOGIN_SCREEN)
                : null;
          } catch (e) {
            context.mounted
                ? Utilities.showSnackBar(
                    context: context,
                    message: "Something went wrong. Please try again later",
                  )
                : null;
          }
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: _size,
          height: _size * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: UserProfileImageWidget(
                  userProfile: widget.user?.profileImage ?? "",
                ),
              ),
              Flexible(
                flex: 1,
                child: UserInfoWidget(
                  name: widget.user?.userName ?? "",
                  email: widget.user?.userEmail ?? "",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: settingsButton.length,
            itemBuilder: (context, index) {
              return CustomProfileButtonWidget(
                data: settingsButton[index],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Version: ${widget.appVersion}",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                  fontSize: _size * 0.032,
                ),
          ),
        ),
      ],
    );
  }
}

class UserProfileImageWidget extends StatelessWidget {
  final String userProfile;
  const UserProfileImageWidget({
    super.key,
    required this.userProfile,
  });

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
          child: userProfile.isEmpty
              ? const SizedBox.shrink()
              : CustomNetworkImage(imageUrl: userProfile),
        ),
      ),
    );
  }
}
