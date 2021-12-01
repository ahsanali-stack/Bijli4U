import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/login_response.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Settings> {

  late LoginResponse _loginResponse;
  String? name = "Unknown";
  String? image = "${ConstantManager.image_base_url}";

  @override
  void initState() {

    getLoginResponse();



    // Factory().showSnackbar(context, "${_loginResponse.result!.userProfile!.userName}");
  }



  Future<void> getLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(ConstantManager.USER_MODEL);
      _loginResponse = LoginResponse.fromJson(jsonDecode(value!));

    setState(() {
      name = _loginResponse.result!.userProfile!.userName;
      image = "${ConstantManager.image_base_url}${_loginResponse.result!.userProfile!.image}";
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
                        backgroundImage: NetworkImage(
                            image!),//${_loginResponse.result!.userProfile!.image}
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
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0,bottom: 0),
                      child: GestureDetector(
                        onTap: ()=>{
                          Factory().showSnackbar(context, "${_loginResponse.result!.userProfile!.userName}")
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
                        )),
                      ),
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 0),
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


                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
