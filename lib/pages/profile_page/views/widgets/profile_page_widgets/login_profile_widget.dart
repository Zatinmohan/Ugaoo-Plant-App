part of '../../profile_page.dart';

class LoginProfilePage extends StatelessWidget {
  LoginProfilePage({super.key});

  final List<ProfileSettingsModel> settingsButton = [
    ProfileSettingsModel(name: "My Orders", onTap: () {}),
    ProfileSettingsModel(name: "Addresses", onTap: () {}),
    ProfileSettingsModel(name: "Settings", onTap: () {}),
    ProfileSettingsModel(name: "Sign out", onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
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
            "Version 1.0",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
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
