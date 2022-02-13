import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/UserController.dart';
import 'package:ugaoo/misc/colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height * 0.25,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                      radius: height * 0.08,
                      backgroundColor: kBackgroundColor,
                      backgroundImage: AssetImage(
                        "assets/misc/profile.png",
                      )),
                ),
                SizedBox(width: 20.0),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Get.find<UserController>().userData.name}",
                        style: TextStyle(
                          color: kHeadingTextColor,
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "${Get.find<UserController>().userData.email}",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
