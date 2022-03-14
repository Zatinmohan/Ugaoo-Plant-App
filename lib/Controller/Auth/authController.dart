import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Controller/Shared%20Pref/PreferenceController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Database/database.dart';
import 'package:ugaoo/Database/productDatabase.dart';
import 'package:ugaoo/Model/userModel.dart';
import 'package:ugaoo/misc/colors.dart';

class AuthController extends GetxController {
  //No need to find it again and again.
  //Once set, can be used in other clases just like that. No need to create object again and again.
  //SingleTon Class
  static AuthController instance = Get.find();

  //Creating Firebase Instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Firabase User, that will change.
  late Rx<User?> _firebaseUser;

  //Instance of Google Signin
  late GoogleSignIn _googleSignIn;
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() {
    //Inatilizing the User and Product Controller once the user is logged in.
    Get.put<UserController>(UserController());
    Get.put<ProductController>(ProductController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    _googleSignIn = GoogleSignIn();
    // Getting current user from firebase.
    _firebaseUser = Rx<User?>(_auth.currentUser);

    // Binding the stream with user. If something happens such as
    // User logs out, it will be contacted to firebaseUser databse immediately.

    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (Get.find<MyPref>().checkFirstPage() == "/") {
      Get.offAndToNamed("/");
    } else if (user == null &&
        Get.find<MyPref>().checkFirstPage() == "/Login") {
      //If user has logged out or app is installed for the first time, it will show the login screen.
      Get.offAllNamed('/Login');
    } else {
      Get.back(closeOverlays: true);
      //If already logged in, user will get the details of logged in user from database.
      _fetchUser();
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      googleAccount.value = await _googleSignIn.signIn();

      if (googleAccount.value != null) {
        final GoogleSignInAuthentication _googleSignInAuthentication =
            await googleAccount.value!.authentication;

        final AuthCredential _credential = GoogleAuthProvider.credential(
          accessToken: _googleSignInAuthentication.accessToken,
          idToken: _googleSignInAuthentication.idToken,
        );

        Get.snackbar(
          "Signing In",
          "Please wait while we are Signin you in",
          showProgressIndicator: true,
          margin: EdgeInsets.all(15),
          backgroundColor: kHeadingTextColor,
          progressIndicatorBackgroundColor: kBackgroundColor,
          colorText: ksecondaryBackgroundColor,
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.easeOutBack,
          isDismissible: false,
        );

        await _auth.signInWithCredential(_credential).whenComplete(() async {
          UserModel _userData = UserModel(
            id: _auth.currentUser?.uid,
            name: googleAccount.value?.displayName,
            phone: '',
            email: googleAccount.value?.email,
            cartItems: {},
            favItems: [],
            address: [],
          );
          await Database().createNewUser(_userData).then((value) {
            if (value) Get.find<UserController>().userData = _userData;
          });
        });

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  void _fetchUser() async {
    if ((_auth.currentUser?.uid != null ||
        _auth.currentUser?.uid.isBlank == false)) {
      Get.find<ProductController>().setProduct =
          await ProductDatabase().getProductData();

      Get.find<UserController>().userData =
          await Database().getUser(_auth.currentUser!.uid).whenComplete(() {
        Get.closeAllSnackbars();
        Get.offAllNamed('/Login/Main');
      });
    }
  }

  Future<bool> signUp(
      String email, String password, String name, var phone) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() async {
        UserModel _userData = UserModel(
          id: _auth.currentUser?.uid,
          name: name,
          phone: phone,
          email: email,
          cartItems: {},
          favItems: [],
          address: [],
        );

        if (await Database().createNewUser(_userData)) {
          Get.find<UserController>().userData = _userData;
        }
      });
      return true;
    } catch (e) {
      //Provided by Getx, No context needed.
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account Creation Failed"),
          messageText: Text(e.toString()));
      return false;
    }
  }

  Future<bool> signIn(String email, String pass) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) async {
        Get.find<UserController>().userData =
            await Database().getUser(_auth.currentUser!.uid);
        Get.find<ProductController>().setProduct =
            await ProductDatabase().getProductData();
      });
      return true;
    } catch (e) {
      Get.snackbar("About Signin", "Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Sign in Failed"),
          messageText: Text(e.toString()));
      return false;
    }
  }

  void updateCartItemsInDatabase(CartModel item) {
    Database().updateCart(_auth.currentUser!.uid, item);
  }

  void removeCartItemInDatabase(CartModel item) {
    Database().removeCartItem(_auth.currentUser!.uid, item);
  }

  void updateCartItemQty(CartModel item, bool toAdd) {
    Database().updateCartItemsQty(_auth.currentUser!.uid, item, toAdd);
  }

  void updateUserFavList(String? orderID) {
    Database().setFav(_auth.currentUser!.uid, orderID);
  }

  bool updateUserAddressList(List<Address> userAddress) {
    try {
      Database().updateExistingAddress(_auth.currentUser!.uid, userAddress);
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    try {
      _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAndToNamed("/Login");
    } catch (e) {
      Get.snackbar("Error Logging out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
