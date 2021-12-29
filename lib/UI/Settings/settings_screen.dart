

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/UI/InquiryForm/InquiryFormScreen.dart';
import 'package:testproject/UI/Launcher/launcher_screen.dart';
import 'package:testproject/UI/LoadCalculator/load_calculator_screen.dart';
import 'package:testproject/UI/Products/tab_screen.dart' as Tab;
import 'package:testproject/UI/Profile/profile_screen.dart';
import 'package:testproject/UI/Review/review_screen.dart';
import 'package:testproject/UI/SignIn/sign_in_screen.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Settings> {
  String? name = "Unknown";
  String? image = "";
  bool isLogin = true;

  @override
  void initState() {
    getLoginResponse();

    // Factory().showSnackbar(context, "${_loginResponse.result!.userProfile!.userName}");
  }

  Future<void> getLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);

    setState(() {
      if (userprofile != null)
      {
        name = userprofile.userName;
        image = "${ConstantManager.image_base_url}${userprofile.image}";

      }
      else
      {
        isLogin = false;

      }
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          image!,
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(ConstantManager.no_preview,width: 100,height: 100,fit: BoxFit.fill,);
                          },
                        ),
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
                      child: GestureDetector(onTap: (){
                        Factory().changeScreen(context, () => InquiryScreen());
                      },child: Card(
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
                      ),)) : Container(),
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
                      child: GestureDetector(
                        onTap: (){
                          Factory().changeScreen(context, () => ProfileScreen());
                        },
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
                          signOut();
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
                          Factory().changeScreen(context, () => SignInScreen());
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

  void signOut() async{
    Factory().finishScreenCompletely(context, () => LauncherScreen());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(ConstantManager.USER_MODEL);
  }
}
