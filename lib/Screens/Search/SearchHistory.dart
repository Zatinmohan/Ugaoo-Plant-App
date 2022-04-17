import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/SearchBar/searchController.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: Get.find<SearchBarController>().dummyList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                  "${Get.find<SearchBarController>().dummyList[index].productName}"));
        },
      ),
    );
  }
}
