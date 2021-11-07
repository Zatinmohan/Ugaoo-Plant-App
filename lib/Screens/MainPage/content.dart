import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/misc/colors.dart';
import 'package:ugaoo/misc/imagesEg.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: seed_images.length,
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: (0.48 * height) / height,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Get.toNamed('/Login/Main/Detail', arguments: {
                    'image': seed_images[index],
                  }),
              child: Stack(children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: width,
                      height: width * 0.5,
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 10.0, bottom: 25),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product",
                                  style: TextStyle(
                                    color: kHeadingTextColor,
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 2.5),
                                Text(
                                  "Family",
                                  style: TextStyle(
                                    color: kDeailHeadingColor,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.5),
                                Text(
                                  "Rs. 250",
                                  style: TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: width * 0.065,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    // color: Colors.black,

                    child: Hero(
                      tag: seed_images[index],
                      child: Image.network(
                        seed_images[index],
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ]));
        });
  }
}
