import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ugaoo/errors/login_exceptions/firebase_auth_errors.dart';
import 'package:ugaoo/errors/login_exceptions/login_with_email_error.dart';
import 'package:ugaoo/services/auth/constants/login_states.dart';
import 'package:ugaoo/services/auth/login_provider.dart';
import 'package:ugaoo/services/auth/repositories/auth_types_services.dart';

import 'login_provider_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginServiceRepo>()])
void main() {
  late MockLoginServiceRepo mockAuthService;
  late LoginProvider loginProvider;

  setUp(() {
    mockAuthService = MockLoginServiceRepo();
    loginProvider = LoginProvider(service: mockAuthService);
  });

  group("Login Via Google", () {
    test('Login - Success', () async {
      when(mockAuthService.loginViaGoogle()).thenAnswer((_) async => true);

      final result = await loginProvider.login(status: LoginType.GOOGLE);

      expect(result, isTrue);
      verify(mockAuthService.loginViaGoogle()).called(1);
    });

    test('Login - Failed due to same account exist', () async {
      Exception error = FirebaseAuthExceptions.fromCode(
        'account-exists-with-different-credential',
      );
      when(mockAuthService.loginViaGoogle()).thenThrow(error);

      final result = loginProvider.login(status: LoginType.GOOGLE);

      expect(
        result,
        throwsA(error),
      );
      verify(mockAuthService.loginViaGoogle()).called(1);
    });

    test('Login - Failed due to Invalid Credential', () async {
      Exception error = FirebaseAuthExceptions.fromCode(
        'invalid-credentiall',
      );
      when(mockAuthService.loginViaGoogle()).thenThrow(error);

      final result = loginProvider.login(status: LoginType.GOOGLE);

      expect(
        result,
        throwsA(error),
      );
      verify(mockAuthService.loginViaGoogle()).called(1);
    });
  });

  group("Login via Email", () {
    test("Login Success", () async {
      const String email = "Email";
      const String password = "password";
      when(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (realInvocation) async => true,
      );

      final result = await loginProvider.login(
        status: LoginType.EMAIL,
        email: email,
        password: password,
      );

      expect(result, isTrue);
      verify(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test("Login Failed - Login or Password is not passed", () async {
      final result = loginProvider.login(
        status: LoginType.EMAIL,
      );

      expect(
        result,
        throwsAssertionError,
      );
    });

    test("Login Failed - Invalid Email", () {
      const String email = "email";
      const String password = "password";
      final Exception e =
          LoginWithEmailPasswordException.fromCode(code: "invalid-email");
      when(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenThrow(e);

      final result = loginProvider.login(
        status: LoginType.EMAIL,
        email: email,
        password: password,
      );

      expect(result, throwsA(e));
      verify(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test("Login Failed - Wrong Password", () {
      const String email = "email";
      const String password = "password";
      final Exception e =
          LoginWithEmailPasswordException.fromCode(code: "wrong-password");
      when(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenThrow(e);

      final result = loginProvider.login(
        status: LoginType.EMAIL,
        email: email,
        password: password,
      );

      expect(result, throwsA(e));
      verify(
        mockAuthService.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });
  });

  group("Logout", () {
    test("Logout Successful", () async {
      when(mockAuthService.logout()).thenAnswer((realInvocation) async => true);
      final result = await loginProvider.login(status: LoginType.SIGNOUT);
      expect(result, isTrue);
      verify(mockAuthService.logout()).called(1);
    });

    test("Logout - Failed", () async {
      when(mockAuthService.logout()).thenThrow(Exception());
      final result = loginProvider.signOut();
      expect(result, throwsException);
      verify(mockAuthService.logout()).called(1);
    });
  });
}
