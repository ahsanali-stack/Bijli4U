

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/UI/LoadCalculator/load_calculator.dart';
import 'package:testproject/UI/Products/tab_screen.dart' as Tab;
import 'package:testproject/UI/Review/review_screen.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Settings> {
  String? name = "Unknown";
  String? image = "${ConstantManager.image_base_url}";
  bool isLogin = true;

  @override
  void initState() {
    getLoginResponse();

    // Factory().showSnackbar(context, "${_loginResponse.result!.userProfile!.userName}");
  }

  Future<void> getLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);

    if (userprofile != null)
      setState(() {
        name = userprofile.userName;
        image = "${ConstantManager.image_base_url}${userprofile.image}";
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: double.minPositive,
        ),
        child: Column(
          children: [
            Container(
                width: double.maxFinite,
                decoration: BoxDecoration(color: Color(colors.color_primary)),
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(image!),
                        //${_loginResponse.result!.userProfile!.image}
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            name!,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ))
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  isLogin ? InkWell(
                    onTap: (){
                      Factory().changeScreen(context, () => Tab.Tab());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Product",
                                style: TextStyle(
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ) : Container(),
                  isLogin ? InkWell(
                    onTap: (){
                      Factory().changeScreen(context, () => ReviewScreen());
                    },
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 0),
                        child: Card(
                          color: Colors.white,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Product Review",
                                  style: TextStyle(
                                      color: Color(colors.color_primary),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_right)
                              ],
                            ),
                          ),
                        )),
                  ): Container(),
                  isLogin ? Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Rent Product",
                                style: TextStyle(
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      )) : Container(),
                  isLogin ? Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Ask for Quote?",
                                style: TextStyle(
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      )) : Container(),
                  isLogin ? Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "FAQ and Policy",
                                style: TextStyle(
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      )) : Container(),
                  isLogin ? Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      )) : Container(),
                  isLogin ? InkWell (
                    onTap: (){
                      Factory().changeScreen(context, () => LoadCalculatorScreen());
                    },
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 0),
                        child: Card(
                          color: Colors.white,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Load Calculator",
                                  style: TextStyle(
                                      color: Color(colors.color_primary),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_right)
                              ],
                            ),
                          ),
                        )),
                  ): Container(),
                  isLogin ? Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: 40, right: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(8)),
                                side: BorderSide(
                                    width: 1,
                                    color: Color(colors
                                        .color_button_stroke))),
                            fixedSize: Size(double.nan, 45),
                            primary: Color(
                                colors.color_primary)),
                        child: Text(
                          "Sign Out",
                          style: TextStyle(
                            fontFamily: 'Trebuc',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                  ) : Container(),
                  !isLogin ? Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: 40, right: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(8)),
                                side: BorderSide(
                                    width: 1,
                                    color: Color(colors
                                        .color_button_stroke))),
                            fixedSize: Size(double.nan, 45),
                            primary: Color(
                                colors.color_primary)),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: 'Trebuc',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                  ) : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
