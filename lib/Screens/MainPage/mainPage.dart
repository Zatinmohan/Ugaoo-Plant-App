import 'package:flutter/material.dart';
import 'package:ugaoo/misc/categoryList.dart';
import 'package:ugaoo/misc/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int categoryIndex = 0;
  final TextEditingController _controller = TextEditingController();

  List<Tab> _getMultipleTabs() {
    switch (categoryIndex) {
      case 0:
        return sub_seeds;
      case 1:
        return sub_plants;
      case 2:
        return sub_pots;
      case 3:
        return sub_tools;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _getMultipleTabs().length,
      child: Scaffold(
        appBar: AppBar(
            elevation: 4.0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.40),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon:
                            Icon(Icons.search, color: kHeadingTextColor),
                        filled: true,
                        fillColor: ksecondaryBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                width: 0.0, style: BorderStyle.none)),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: kHeadingTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.07),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 55.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("Tapped");
                                  categoryIndex = index;
                                });
                              },
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: index == categoryIndex
                                      ? kBackgroundColor
                                      : ksecondaryBackgroundColor,
                                ),
                                padding: EdgeInsets.all(5.0),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("${mainCategories[index]}",
                                        style: TextStyle(
                                          color: index == categoryIndex
                                              ? Colors.white
                                              : kBackgroundColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.05,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    _getMultipleTabs().length != 0
                        ? TabBar(
                            isScrollable: true,
                            indicatorColor: kBackgroundColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: _getMultipleTabs(),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.045,
                            ),
                            labelColor: kHeadingTextColor,
                            unselectedLabelColor: kBackgroundColor,
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            )),
        // body: TabBarView(children: []),
      ),
    );
  }
}
