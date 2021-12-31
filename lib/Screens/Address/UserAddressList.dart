import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Model/AddressDummy.dart';
import 'package:ugaoo/misc/colors.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartItemController _controller = Get.put(CartItemController());
    List<AddressDummy> dummyList;
    dummyList = _controller.addressList;

    return Container(child: Obx(() {
      return ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (BuildContext context, int index) {
          var type = dummyList[index].addressType;
          var street = dummyList[index].streetName;
          var pincode = dummyList[index].pincode;
          var phone = dummyList[index].mobile;
          var name = dummyList[index].name;
          var houseno = dummyList[index].houseno;
          var city = dummyList[index].city;
          var state = dummyList[index].state;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            height: height * 0.3,
            width: width,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: width,
                        child: Obx(
                          () => Radio(
                              value: index,
                              groupValue: _controller.addressIndex?.value,
                              activeColor: kBackgroundColor,
                              toggleable: true,
                              onChanged: (int? value) {
                                _controller.addressIndex?.value = value!;
                              }),
                        )),
                  ),
                  SizedBox(height: 10.0),
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "$name",
                                style: TextStyle(
                                  color: kHeadingTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.05,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5.0)),
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "$type",
                                  style: TextStyle(
                                    color: kHeadingTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: width * 0.035,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "$houseno, $street",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.045,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "$city - $pincode",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.045,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "$state",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.048,
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            "+91 $phone",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.048,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: width,
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed('/Address/NewAddress', arguments: [
                              _controller.addressList[index],
                              index
                            ]);
                          },
                          icon: Icon(Icons.edit)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }));
  }
}
