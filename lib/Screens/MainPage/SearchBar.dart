import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/misc/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () => Get.toNamed('/Main/SearchList'),
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search, color: kHeadingTextColor),
        filled: true,
        fillColor: ksecondaryBackgroundColor,
        hintText: "Search Here",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(width: 0.0, style: BorderStyle.none)),
        contentPadding: EdgeInsets.all(20.0),
      ),
    );
  }
}
