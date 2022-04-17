import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/SearchBar/searchController.dart';
import 'package:ugaoo/Screens/Search/SearchHistory.dart';
import 'package:ugaoo/Screens/Search/emptyList.dart';
import 'package:ugaoo/Screens/Search/serachTextField.dart';
import 'package:ugaoo/misc/colors.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: MainSerachTextField(),
        ),
        body: Get.find<SearchBarController>().isListEmpty
            ? ListEmpty()
            : SearchHistory(),
      ),
    );
  }
}
