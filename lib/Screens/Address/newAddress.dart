import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/pincodeAPI.dart';
import 'package:ugaoo/Screens/Address/UseLocation.dart';
import 'package:ugaoo/Screens/Address/customRadio.dart';
import 'package:ugaoo/misc/colors.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PincodeAPI _controller = Get.put(PincodeAPI());
    late TextEditingController? _city = TextEditingController();
    late TextEditingController? _state = TextEditingController();

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
              onPressed: () => Get.back(),
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
                  child: Column(
                children: [
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: customInputDecoration.copyWith(
                          labelText: "Full Name *")),
                  SizedBox(height: 25.0),
                  TextFormField(
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
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: customInputDecoration.copyWith(
                        counterText: '',
                        counterStyle: TextStyle(fontSize: 0),
                        labelText: "Pincode *"),
                    onFieldSubmitted: (val) {
                      if (val.isNotEmpty && val.length == 6) {
                        _controller.fetchData(val);
                      }
                    },
                  ),
                  SizedBox(height: 25.0),
                  UseLocation(),
                  SizedBox(height: 25.0),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: customInputDecoration.copyWith(
                          labelText: "Flat, House No, Building, Company *")),
                  SizedBox(height: 25.0),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: customInputDecoration.copyWith(
                          labelText: "Street Name, Area *")),
                  SizedBox(height: 25.0),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: customInputDecoration.copyWith(
                          labelText: "Landmark")),
                  SizedBox(height: 25.0),
                  Obx(() {
                    if (_controller.pincodeData.value.postOffice != null)
                      _city.text = _controller.getCity()!;
                    else
                      _city.clear();
                    return TextFormField(
                        enabled: false,
                        textInputAction: TextInputAction.next,
                        controller: _city,
                        textCapitalization: TextCapitalization.words,
                        decoration: customInputDecoration.copyWith(
                            labelText: "City/District *"));
                  }),
                  SizedBox(height: 25.0),
                  Obx(() {
                    if (_controller.pincodeData.value.postOffice != null)
                      _state.text = _controller.getState()!;
                    else
                      _state.clear();
                    return TextFormField(
                        controller: _state,
                        enabled: false,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: customInputDecoration.copyWith(
                            labelText: "State *"));
                  }),
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
                          flex: 1, child: CustomRadioWidget(value: "Office")),
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
                        onPressed: () => print("Submit"),
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
