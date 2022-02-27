import 'package:flutter/material.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Screens/Address/UserAddressList.dart';
import 'package:ugaoo/misc/PageIndication.dart';
import 'package:ugaoo/misc/colors.dart';
import 'package:get/get.dart';

class AddressMain extends StatelessWidget {
  const AddressMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ksecondaryBackgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Address",
            style: TextStyle(
              color: kHeadingTextColor,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.055,
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: kHeadingTextColor,
              ))),
      body: Container(
          height: height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(flex: 1, child: PageIndicator(pageNo: 2)),
            SizedBox(height: 10.0),
            Flexible(
              flex: 5,
              child: AddressList(),
            )
          ])),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Get.find<AddressController>().setData(0, false);
                },
                child: Container(
                  width: width,
                  height: height * 0.08,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Add New Address",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w700,
                        color: kBackgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // if (dummyAddressList.isNotEmpty)
                  //   Get.toNamed('/Address/Payment');
                  // else {
                  //   final _snackbar = SnackBar(
                  //       content:
                  //           Text("Please add or select a address to continue"));
                  //   ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                  // }
                },
                child: Container(
                  width: width,
                  height: height * 0.08,
                  color: kBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
