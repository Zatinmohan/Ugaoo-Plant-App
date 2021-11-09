import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';
import 'package:ugaoo/misc/imagesEg.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: height * 0.30,
            // color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      margin: EdgeInsets.only(top: 35.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  flex: 2, child: SizedBox(width: width * 0.2)),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Product 1",
                                        style: TextStyle(
                                          color: kHeadingTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.065,
                                        )),
                                    SizedBox(height: 5.0),
                                    Text("Rs. 250",
                                        style: TextStyle(
                                          color: kBackgroundColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.065,
                                        )),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () => print("+"),
                                        icon: Icon(Icons.add)),
                                    SizedBox(height: 5.0),
                                    Text("1",
                                        style: TextStyle(
                                          color: kHeadingTextColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.05,
                                        )),
                                    SizedBox(height: 5.0),
                                    IconButton(
                                        onPressed: () => print("-"),
                                        icon: Icon(Icons.remove)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Image.network(seed_images[index])),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: IconButton(
                              onPressed: () => print("Delete"),
                              icon: Icon(
                                Icons.delete_rounded,
                                size: width * 0.05,
                              )),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
