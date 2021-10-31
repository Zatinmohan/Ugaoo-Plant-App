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
          childAspectRatio: (1.2 * width) / height,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed('/Login/Main/Detail', arguments: {
              'image': seed_images[index],
            }),
            child: Card(
              color: Colors.white,
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Stack(
                children: [
                  Hero(
                    tag: seed_images[index],
                    child: Image.network(
                      seed_images[index],
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => print("NULL"),
                          icon: Icon(Icons.favorite_border),
                        ),
                      ),
                      ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: width * 0.14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: Text(
                            "Product",
                            style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
