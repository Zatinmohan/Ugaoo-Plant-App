part of '../../login_page.dart';

class CustomLoginButtonWidget extends StatelessWidget {
  final String buttonName;
  final String? buttonImage;
  final VoidCallback onTap;

  const CustomLoginButtonWidget({
    Key? key,
    required this.buttonName,
    this.buttonImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          buttonImage?.isNotEmpty ?? false
              ? Image.asset(
                  buttonImage!,
                  fit: BoxFit.contain,
                  width: MediaQuery.sizeOf(context).width * 0.06,
                )
              : const SizedBox.shrink(),
          const SizedBox(width: 12.0),
          FittedBox(
            child: Text(
              buttonName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorConstants.kPrimaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.sizeOf(context).width * 0.045,
                  ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
