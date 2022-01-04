import 'package:get/get.dart';

import 'package:ugaoo/Screens/Address/AddressMain.dart';
import 'package:ugaoo/Screens/Address/newAddress.dart';
import 'package:ugaoo/Screens/Cart/CartMain.dart';
import 'package:ugaoo/Screens/DetailPage/mainDetailPage.dart';
import 'package:ugaoo/Screens/FirstPage/FirstPage.dart';
import 'package:ugaoo/Screens/Login/login.dart';
import 'package:ugaoo/Screens/MainPage/mainPage.dart';
import 'package:ugaoo/Screens/Payment/PaymentMain.dart';
import 'package:ugaoo/Screens/Signup/signup.dart';
import 'package:ugaoo/Screens/onBoardingPage/onBoarding.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => FirstPage()),
    GetPage(name: '/Login', page: () => Login()),
    GetPage(name: '/Signup', page: () => SignupPage()),
    GetPage(name: '/Login/Main', page: () => MainPage()),
    GetPage(name: '/Login/Main/Detail', page: () => DetailPage()),
    GetPage(name: '/Login/Cart', page: () => MainCart()),
    GetPage(name: '/Cart/Address', page: () => AddressMain()),
    GetPage(name: '/Address/NewAddress', page: () => NewAddress()),
    GetPage(name: '/Address/Payment', page: () => PaymentMainPage()),
    GetPage(name: '/Onboarding', page: () => OnBoarding()),
  ];
}
