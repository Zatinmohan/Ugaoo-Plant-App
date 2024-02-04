part of '../../profile_page.dart';

class ProfileSignInWidget extends StatelessWidget {
  final String appVersion;
  ProfileSignInWidget({super.key, required this.appVersion});

  final List<ProfileSettingsModel> settingsButton = [
    ProfileSettingsModel(name: "Settings", onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const AspectRatio(
          aspectRatio: 16 / 9,
          child: LoginHereWidget(),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
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
            "Version: ${appVersion}",
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
