import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/UI/SignIn/sign_in_screen.dart';
import 'package:testproject/UI/SignUp/sign_up_screen.dart';

void main() => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Test Application",
    home: LauncherScreen());

class LauncherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Color(colors.color_primary),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/header.png",
            width: Factory().getWidthOfScreen(context),
            height: Factory().getHeightOfScreen(context) / 2.3,
            fit: BoxFit.fill,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                "assets/images/bijli4u2.png",
                width: 250,
                height: 250,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30,left: 30,right: 30,top: 20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                      onPressed: press,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                              ,side: BorderSide(
                              width: 1,
                              color: Color(colors.color_button_stroke)
                          )
                          ),
                          fixedSize: Size(double.maxFinite, 45),
                          primary: Colors.white),
                      child: Text(
                        "Explore Store",
                        style: TextStyle(
                          fontFamily: 'Trebuc',
                          color: Color(colors.color_primary),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                      ))),
              Padding(padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                      onPressed: ()=>Factory().changeScreen(context, () => SignInScreen()),
                      style: ElevatedButton.styleFrom(

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                              ,side: BorderSide(
                              width: 1,
                              color: Color(colors.color_button_stroke)
                          )
                          ),
                          fixedSize: Size(double.maxFinite, 45),
                          primary: Colors.white),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: 'Trebuc',
                          color: Color(colors.color_primary),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                      ))),
                  Padding(padding: const EdgeInsets.only(bottom: 0),
                      child: ElevatedButton(
                          onPressed: ()=> Factory().changeScreen(context, () => SignUpScreen()),
                          style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                  ,side: BorderSide(
                                  width: 1,
                                  color: Color(colors.color_button_stroke)
                              )
                              ),
                              fixedSize: Size(double.maxFinite, 45),
                              primary: Colors.white),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: 'Trebuc',
                              color: Color(colors.color_primary),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,),
                          ))),
                ],
              ),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );

    // Image.asset("assets/images/bijli4uname.jpg",width: 120,height: 120,alignment: Alignment.center,)
  }

  void press() {
  }
}
