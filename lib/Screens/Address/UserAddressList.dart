import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Model/userModel.dart';
import 'package:ugaoo/misc/colors.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      return ListView.builder(
        itemCount: Get.find<AddressController>().totalAddress,
        itemBuilder: (BuildContext context, int index) {
          Address _address = Get.find<AddressController>().savedAddress![index];
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
                        child: Obx(() => Radio(
                              value: index,
                              groupValue: Get.find<AddressController>()
                                  .selectIndexValue,
                              activeColor: kBackgroundColor,
                              toggleable: true,
                              onChanged: (int? value) {
                                Get.find<AddressController>()
                                    .changeValue(value);
                              },
                            ))),
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
                                "${_address.addressName}",
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
                                  "${_address.addressType}",
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
                            "${_address.addressFlat}, ${_address.addressStreet}",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.045,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${_address.addressCity} - ${_address.addressPincode}",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.045,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${_address.addressState}",
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.048,
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            "+91 ${_address.addressPhone}",
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
                            Get.find<AddressController>().setData(index, true);
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
