import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/SearchBar/searchController.dart';
import 'package:ugaoo/misc/colors.dart';

class MainSerachTextField extends StatelessWidget {
  const MainSerachTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.0,
        child: TextField(
          controller: Get.find<SearchBarController>().searchBar,
          autofocus: true,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: ksecondaryBackgroundColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ksecondaryBackgroundColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: Get.find<SearchBarController>().onItemChange,
        ),
      ),
    );
  }
}
