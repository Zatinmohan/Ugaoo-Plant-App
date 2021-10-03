import 'package:get/get.dart';
import 'package:ugaoo/Screens/FirstPage/FirstPage.dart';
import 'package:ugaoo/Screens/Login/login.dart';
import 'package:ugaoo/Screens/MainPage/mainPage.dart';
import 'package:ugaoo/Screens/Signup/signup.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => FirstPage()),
    GetPage(name: '/Login', page: () => Login()),
    GetPage(name: '/Signup', page: () => SignupPage()),
    GetPage(name: '/Login/Main', page: () => MainPage()),
  ];
}
