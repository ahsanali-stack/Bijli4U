import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetails();
  }
}

class ProductDetails extends State<ProductDetailsScreen> {
  int tab_index = 0;
  int index = 0;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 160.0,
                floating: false,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                  ConstantManager.generator_img,
                  fit: BoxFit.contain,
                )),
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            this.index = index;
                          });
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 2, right: 2, bottom: 4),
                          child: Container(
                              decoration: this.index == index
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: Color(
                                              colors.color_button_stroke)))
                                  : null,
                              child: Image.asset(
                                ConstantManager.generator_img,
                                fit: BoxFit.contain,
                              )),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Generator",
                      style: TextStyle(
                          fontFamily: "Trebuc",
                          color: Color(colors.color_primary), fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Honda Electric Start 2.5 KW Generator (EZ6500CXS)",
                      style: TextStyle(
                          fontFamily: "Trebuc",
                          color: Color(colors.color_primary),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Honda Electric Start 2.5 KW Generator (EZ6500CXS) Honda Electric Start 2.5 KW Generator (EZ6500CXS) (EZ6500CXS)",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Trebuc",
                          color: Color(colors.color_primary), fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Honda",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Trebuc",
                          color: Color(colors.color_primary),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "PKR2.0",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Trebuc",
                          color: Color.fromRGBO(colors.color_price.red, colors.color_price.green, colors.color_price.blue, 100),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(
                    color: Color(colors.color_primary),
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    decoration:
                    BoxDecoration(color: Color.fromRGBO(colors.color_highlight.red, colors.color_highlight.green, colors.color_highlight.blue, 100)),
                    width: double.maxFinite,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Service Provider",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Trebuc",
                                  color: Color(colors.color_primary),
                                  fontSize: 16)),
                          Text("ALLIED ENGINEERING",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: "Trebuc",
                                  color: Color(colors.color_primary),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:40),
                child:  DefaultTabController(
                  length: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(flex: 1,child:InkWell(
                              onTap: (){
                                setState(() {
                                  tab_index = 0;
                                });
                              },
                              child:  Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: tab_index == 0 ? BorderSide(
                                            width: 6,
                                            color: Color(colors.color_button_stroke)
                                        ) : BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        left: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        right: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Align(alignment: Alignment.center,child: Text("Description",style: TextStyle(fontSize: 16,color: Color(colors.color_primary)),),),
                                ),
                              )),
                          ),
                          Expanded(flex: 1,child: InkWell(
                              onTap: (){
                                setState(() {
                                  tab_index = 1;

                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 6,
                                            color: Color(colors.color_button_stroke)
                                        ),
                                        left: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        right: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Align(alignment: Alignment.center,child: Text("Specification",style: TextStyle(fontSize: 16,color: Color(colors.color_primary)),)),
                                ),
                              )),
                          ),
                          Expanded(flex: 1,child:InkWell(
                              onTap: (){
                                setState(() {
                                  tab_index = 2;
                                });
                              },
                              child:  Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 6,
                                            color: Color(colors.color_button_stroke)
                                        ),
                                        left: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        ),
                                        right: BorderSide(
                                            width: 1,
                                            color: Color(colors.color_primary)
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Align(alignment: Alignment.center,child: Text("Reviews",style: TextStyle(fontSize: 16,color: Color(colors.color_primary)),)),
                                ),
                              )),
                          )
                        ],
                      )
                    ],
                  ),

                ),)
              ],
            ),
          )),
    );
  }
}
