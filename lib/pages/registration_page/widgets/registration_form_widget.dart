part of '../registration_page.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _textFieldHeight = MediaQuery.sizeOf(context).width * 0.15;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _textFieldHeight,
              child: TextFormField(
                cursorHeight: _textFieldHeight,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.people,
                    color: ColorConstants.kPrimaryIconColor,
                  ),
                  hintText: "User Name",
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
              height: _textFieldHeight,
              child: TextFormField(
                cursorHeight: _textFieldHeight,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: ColorConstants.kPrimaryIconColor,
                  ),
                  hintText: "Email",
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
              height: _textFieldHeight,
              child: TextFormField(
                obscureText: true,
                cursorHeight: _textFieldHeight,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: ColorConstants.kPrimaryIconColor,
                  ),
                  hintText: "Password",
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
              height: _textFieldHeight,
              child: TextFormField(
                obscureText: true,
                cursorHeight: _textFieldHeight,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: ColorConstants.kPrimaryIconColor,
                  ),
                  hintText: "Confirm Password",
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
