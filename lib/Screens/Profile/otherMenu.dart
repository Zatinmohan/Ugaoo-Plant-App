import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class OtherMenu extends StatelessWidget {
  const OtherMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.37,
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                title: Text("Orders"),
              ),
              ListTile(
                title: Text("Addresses"),
              ),
              ListTile(
                title: Text("My Card"),
              ),
              ListTile(
                title: Text("Contact us"),
              ),
            ]).toList(),
          )),
    );
  }
}
