import 'package:get/get.dart';
import 'package:ugaoo/Controller/Bindings/BottmNavBindings.dart';
import 'package:ugaoo/Controller/Bindings/LoginBindings.dart';
import 'package:ugaoo/Controller/Bindings/SignupBindings.dart';
import 'package:ugaoo/Screens/Address/AddressMain.dart';
import 'package:ugaoo/Screens/Address/newAddress.dart';
import 'package:ugaoo/Screens/Cart/CartMain.dart';
import 'package:ugaoo/Screens/DetailPage/mainDetailPage.dart';
import 'package:ugaoo/Screens/FirstPage/FirstPage.dart';
import 'package:ugaoo/Screens/Login/login.dart';
import 'package:ugaoo/Screens/MainPage/mainPage.dart';
import 'package:ugaoo/Screens/Payment/PaymentMain.dart';
import 'package:ugaoo/Screens/Profile/profileMain.dart';
import 'package:ugaoo/Screens/Signup/signup.dart';
import 'package:ugaoo/Screens/onBoardingPage/onBoarding.dart';

//Contains all the App pages here.

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => FirstPage()),
    GetPage(
        name: '/Login',
        page: () => Login(),
        binding: LoginControllerBindings()),
    GetPage(
        name: '/Signup', page: () => SignupPage(), binding: SignUpBinding()),
    GetPage(
        name: '/Login/Main',
        page: () => MainPage(),
        binding: BottomNavBinding()),
    GetPage(name: '/Login/Main/Detail', page: () => DetailPage()),
    GetPage(name: '/Login/Cart', page: () => MainCart()),
    GetPage(name: '/Cart/Address', page: () => AddressMain()),
    GetPage(name: '/Address/NewAddress', page: () => NewAddress()),
    GetPage(name: '/Address/Payment', page: () => PaymentMainPage()),
    GetPage(name: '/Onboarding', page: () => OnBoarding()),
    GetPage(
        name: '/Profile',
        page: () => ProfilePage(),
        binding: LoginControllerBindings()),
  ];
}
