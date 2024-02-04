part of '../profile_page.dart';

class CustomProfileButtonWidget extends StatelessWidget {
  final ProfileSettingsModel data;
  const CustomProfileButtonWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).width * 0.18,
        margin: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 1.0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              data.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
