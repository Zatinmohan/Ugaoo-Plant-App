import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Controller/Address/AddressFormController.dart';
import 'package:ugaoo/Screens/Address/UseLocation.dart';
import 'package:ugaoo/Screens/Address/customRadio.dart';
import 'package:ugaoo/misc/colors.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ksecondaryBackgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "New Address",
            style: TextStyle(
              color: kHeadingTextColor,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.055,
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.offAndToNamed('/Cart/Address'),
              icon: Icon(
                Icons.arrow_back_ios,
                color: kHeadingTextColor,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                  key: Get.find<AddressFormController>().addressFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              Get.find<AddressFormController>()
                                  .validator1(value),
                          controller: Get.find<AddressFormController>().name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "Full Name *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              Get.find<AddressFormController>()
                                  .validator1(value),
                          controller: Get.find<AddressFormController>().phone,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: customInputDecoration.copyWith(
                              counterText: '',
                              counterStyle: TextStyle(fontSize: 0),
                              labelText: "Phone no. *",
                              prefix: Text(
                                "+91 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ))),
                      SizedBox(height: 25.0),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            Get.find<AddressFormController>().validator1(value),
                        controller: Get.find<AddressFormController>().pincode,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: customInputDecoration.copyWith(
                            counterText: '',
                            counterStyle: TextStyle(fontSize: 0),
                            labelText: "Pincode *"),
                        onFieldSubmitted: (val) =>
                            Get.find<AddressFormController>()
                                .getStateAndCity(val),
                      ),
                      SizedBox(height: 25.0),
                      UseLocation(),
                      SizedBox(height: 25.0),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: Get.find<AddressFormController>().house,
                          validator: (value) =>
                              Get.find<AddressFormController>()
                                  .validator1(value),
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText:
                                  "Flat, House No, Building, Company *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          controller: Get.find<AddressFormController>().street,
                          validator: (value) =>
                              Get.find<AddressFormController>()
                                  .validator1(value),
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "Street Name, Area *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          controller:
                              Get.find<AddressFormController>().landmark,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "Landmark")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          controller: Get.find<AddressFormController>().city,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "City/District *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          controller: Get.find<AddressFormController>().state,
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "State *")),
                      SizedBox(height: 25.0),
                      Container(
                        width: width,
                        child: Text(
                          'Type',
                          style: TextStyle(
                            color: kHeadingTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.05,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1, child: CustomRadioWidget(value: "Home")),
                          Flexible(
                              flex: 1,
                              child: CustomRadioWidget(value: "Office")),
                          Flexible(
                              flex: 1,
                              child: CustomRadioWidget(
                                value: "Others",
                              )),
                        ],
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        width: width / 1.5,
                        height: width * 0.12,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kBackgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            onPressed: () {
                              Get.find<AddressFormController>().validateForm();
                            },
                            child: Text("Save Address")),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
