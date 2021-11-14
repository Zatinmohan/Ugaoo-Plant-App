import 'dart:ui';

import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xffAEC48A);
const ksecondaryBackgroundColor = Color(0xffEEF3EA);
const kSecondaryTextColor = Color(0xffE9E9E9);
const kPrimaryTextColor = Color(0xff033823);
const kHeadingTextColor = Color(0xff333333);
const kDeailHeadingColor = Color(0xff4a4a4a);

late var height;
late var width;

var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: kBackgroundColor, width: 2.0));

var textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: Colors.green));

var customInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.grey),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: kBackgroundColor,
        width: 1.5,
      )),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: kHeadingTextColor,
      )),
);
