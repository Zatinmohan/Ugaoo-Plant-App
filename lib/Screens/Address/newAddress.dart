import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Controller/pincodeAPI.dart';
import 'package:ugaoo/Model/AddressDummy.dart';
import 'package:ugaoo/Screens/Address/UseLocation.dart';
import 'package:ugaoo/Screens/Address/customRadio.dart';
import 'package:ugaoo/misc/colors.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PincodeAPI _controller = Get.put(PincodeAPI());
    CartItemController _addressController = Get.find();

    late TextEditingController? _city = TextEditingController();
    late TextEditingController? _state = TextEditingController();
    TextEditingController _name = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _pincode = TextEditingController();
    TextEditingController _house = TextEditingController();
    TextEditingController _street = TextEditingController();
    TextEditingController? _landmark = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    bool _editData = false;

    var data;
    if (Get.arguments != null) {
      _editData = true;
      data = Get.arguments;
      print(data[0].name);
      print(data[0].mobile);
      print(data[0].pincode);
      print(data[0].houseno);
      print(data[0].streetName);
      print(data[0].nearby);
      print(data[0].addressType);
    }

    _name.text = _editData ? data[0].name : '';
    _phone.text = _editData ? data[0].mobile.toString() : '';
    _pincode.text = _editData ? data[0].pincode.toString() : '';
    _house.text = _editData ? data[0].houseno : '';
    _street.text = _editData ? data[0].streetName : '';
    _landmark.text = _editData ? data[0].nearby : '';
    _controller.addressType.value = _editData ? data[0].addressType : "None";

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
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return '* Required';
                          },
                          controller: _name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "Full Name *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return '* Required';
                          },
                          controller: _phone,
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
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return '* Required';
                        },
                        controller: _pincode,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _house,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return '* Required';
                          },
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText:
                                  "Flat, House No, Building, Company *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return '* Required';
                          },
                          textCapitalization: TextCapitalization.words,
                          decoration: customInputDecoration.copyWith(
                              labelText: "Street Name, Area *")),
                      SizedBox(height: 25.0),
                      TextFormField(
                          controller: _landmark,
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
                              if (_formKey.currentState!.validate() &&
                                  _controller.addressType.value != "None") {
                                if (_editData) {
                                  _addressController.addressList[data[1]].name =
                                      _name.text;

                                  _addressController
                                          .addressList[data[1]].addressType =
                                      _controller.addressType.value;

                                  _addressController.addressList[data[1]]
                                      .mobile = int.parse(_phone.text);

                                  _addressController.addressList[data[1]]
                                      .houseno = _house.text;

                                  _addressController.addressList[data[1]]
                                      .streetName = _street.text;

                                  _addressController.addressList[data[1]]
                                      .pincode = int.parse(_pincode.text);

                                  _addressController.addressList[data[1]]
                                      .nearby = _landmark.text;
                                } else {
                                  AddressDummy addressObject = AddressDummy(
                                      _controller.addressType.value,
                                      _house.text,
                                      _street.text,
                                      int.parse(_pincode.text),
                                      _name.text,
                                      int.parse(_phone.text),
                                      _state.text,
                                      _city.text,
                                      _landmark.text);

                                  _addressController.addAddress(addressObject);
                                }

                                Get.back();
                              } else if (_controller.addressType.value ==
                                      "None" ||
                                  _formKey.currentState!.validate() == false) {
                                final snackBar = SnackBar(
                                  content: Text("Please fill all the details"),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
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
