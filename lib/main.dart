import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/UI/Launcher/launcher_screen.dart';
import 'package:testproject/UI/Navigator/main_screen.dart';
import 'package:testproject/UI/SignIn/sign_in_screen.dart';
import 'package:location/location.dart';

import 'Models/Response/login_response.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen2(),
    ));

class SplashScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenWidget();
  }
}

class SplashScreenWidget extends State<SplashScreen2>
    with TickerProviderStateMixin {
    late AnimationController controller;


    @override
  void initState() {
      changeScreen(context);
  }

  @override
  Widget build(BuildContext context) {

    late Animation<Offset> offset ;

    setState(() {

      controller =
          AnimationController(vsync: this, duration: Duration(seconds: 3));
      offset = Tween<Offset>(begin: Offset(0, 20), end: Offset.zero)
          .animate(controller);
      controller.forward();
    });


    return Builder(
      builder: (BuildContext context){
        return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ConstantManager.bijli4ULogoGif,
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                      ),
                      SlideTransition(
                        position: offset,
                        child:
                        Image.asset(ConstantManager.bijli4UNameImg, width: 120,
                          height: 120,
                          alignment: Alignment.center,),)


                    ],
                  ),
                ));
      }
    );
  }

  void changeScreen(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile? userprofile = Factory().getUserModel(prefs);

    if(userprofile != null)
      {
        Factory().changeScreenWithDelay(context, () => HomeScreen(0), 5);
      }
    else {
      Factory().changeScreenWithDelay(context, () => LauncherScreen(), 5);
    }
  }

    @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}