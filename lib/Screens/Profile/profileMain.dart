import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/Profile/logout.dart';
import 'package:ugaoo/Screens/Profile/otherMenu.dart';
import 'package:ugaoo/Screens/Profile/userCard.dart';
import 'package:ugaoo/Screens/Profile/version.dart';
import 'package:ugaoo/misc/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ksecondaryBackgroundColor,
            centerTitle: true,
            title: Text(
              "Profile",
              style: TextStyle(
                color: kHeadingTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(
              color: kHeadingTextColor,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                UserCard(),
                SizedBox(height: 20.0),
                OtherMenu(),
                SizedBox(height: 20.0),
                Logout(),
                Spacer(),
                Version(),
              ],
            ),
          )),
    );
  }
}
