part of '../../pages/new_address_page.dart';

class UseMyLocationWidget extends StatelessWidget {
  const UseMyLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_searching,
          size: _size * 0.055,
          color: ColorConstants.kPrimaryAccentColor,
        ),
        const SizedBox(width: 6.0),
        Text(
          "Use My Location",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: _size * 0.045,
                color: ColorConstants.kPrimaryAccentColor,
              ),
        ),
      ],
    );
  }
}
