import 'package:get/get.dart';
import 'package:ugaoo/Bindings/AddressBindings.dart';
import 'package:ugaoo/Bindings/AddressFormBindings.dart';
import 'package:ugaoo/Bindings/BottmNavBindings.dart';
import 'package:ugaoo/Bindings/CartItemBindings.dart';
import 'package:ugaoo/Bindings/LoginBindings.dart';
import 'package:ugaoo/Bindings/PaymentBindings.dart';
import 'package:ugaoo/Bindings/SignupBindings.dart';
import 'package:ugaoo/Screens/Address/AddressMain.dart';
import 'package:ugaoo/Screens/Address/newAddress.dart';
import 'package:ugaoo/Screens/Cart/CartMain.dart';
import 'package:ugaoo/Screens/DetailPage/mainDetailPage.dart';
import 'package:ugaoo/Screens/FirstPage/FirstPage.dart';
import 'package:ugaoo/Screens/Like/likeMain.dart';
import 'package:ugaoo/Screens/Login/login.dart';
import 'package:ugaoo/Screens/MainPage/mainPage.dart';
import 'package:ugaoo/Screens/Order%20Placed/placedMain.dart';
import 'package:ugaoo/Screens/Payment/PaymentMain.dart';
import 'package:ugaoo/Screens/Profile/profileMain.dart';
import 'package:ugaoo/Screens/Signup/signup.dart';
import 'package:ugaoo/Screens/Splash/firstScreen.dart';
import 'package:ugaoo/Screens/onBoardingPage/onBoarding.dart';

//Contains all the App pages here.

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => FirstPage()),
    GetPage(name: '/Splash', page: () => SplashScreen()),
    GetPage(name: '/LikedPage', page: () => LikePage()),
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
    GetPage(
      name: '/Login/Main/Detail',
      page: () => DetailPage(),
    ),
    GetPage(
        name: '/Login/Cart',
        page: () => MainCart(),
        binding: CartItemBindings()),
    GetPage(
        name: '/Cart/Address',
        page: () => AddressMain(),
        binding: AddressBingings()),
    GetPage(
        name: '/Address/NewAddress',
        page: () => NewAddress(),
        binding: AddressFormBindings()),
    GetPage(
        name: '/Address/Payment',
        page: () => PaymentMainPage(),
        binding: PaymentBindings()),
    GetPage(name: '/Onboarding', page: () => OnBoarding()),
    GetPage(
        name: '/Profile',
        page: () => ProfilePage(),
        binding: LoginControllerBindings()),
    GetPage(name: '/Placed', page: () => OrderPlaced()),
  ];
}
