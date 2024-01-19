part of '../registration_page.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.15,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor:
                      ColorConstants.kSecondaryAccentColor.withOpacity(0.4),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.15,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor:
                      ColorConstants.kSecondaryAccentColor.withOpacity(0.4),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.15,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor:
                      ColorConstants.kSecondaryAccentColor.withOpacity(0.4),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.15,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor:
                      ColorConstants.kSecondaryAccentColor.withOpacity(0.4),
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
