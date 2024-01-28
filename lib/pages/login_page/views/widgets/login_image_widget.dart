part of '../../login_page.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClip(),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Assets.misc.registrationPageImage.image(
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Create a path for the semi-circle
    Path path = Path();
    path.moveTo(0.0, 0.0); // Move to the top-left corner of the semi-circle
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, 0),
        // radius: size.height,
        width: size.width * 2,
        height: size.height * 2,
      ),
      0, // Start angle
      math.pi, // Sweep angle (negative to draw the top part)
      false,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
