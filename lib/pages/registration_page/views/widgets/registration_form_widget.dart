part of '../../views/registration_page.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _retypePasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _retypePasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _textFieldHeight = MediaQuery.sizeOf(context).width * 0.15;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _textFieldHeight,
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: (value) {
                  final RegExp regex = RegExp('[a-zA-Z]');
                  if (value?.isEmpty ?? true) {
                    return "Please Enter a value";
                  } else if (!regex.hasMatch(value!)) {
                    return "Please Enter a valid name";
                  } else
                    return null;
                },
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.people),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: _textFieldHeight,
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Please enter a valid email";
                  } else if (!(value!.contains(".")) &&
                      !(value.contains("@"))) {
                    return "Please enter a valid email";
                  } else
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Email",
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: _textFieldHeight,
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Please enter a password";
                  } else if (value!.length < 6) {
                    return "Password length should be greater than 6";
                  } else
                    return null;
                },
                obscureText: true,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Password",
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: _textFieldHeight,
              child: TextFormField(
                obscureText: true,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
                decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Confirm Password",
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
