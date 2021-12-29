import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:testproject/Models/Requests/login_request.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/SignIn/Bloc/SignInBloc.dart';
import 'package:testproject/UI/Navigator/main_screen.dart';


class SignInScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<SignInScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShowing = false;
  late SignInBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = SignInBloc(context);
    emailCtrl.text = "Faizan1507c@gmail.com";
    passwordCtrl.text = "Faizi1212";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Factory().getHeightOfScreen(context)-40,
                  maxHeight: Factory().getHeightOfScreen(context)-40,
                ),
                child:Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: Image.asset(ConstantManager.bijli4ULogoGif,
                              width: 100, height: 100),
                        )),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(ConstantManager.bijli4UNameImg,
                            width: 100, height: 100)),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: 300,
                            child: Text(
                              ConstantManager.slogan,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(colors.color_button_stroke)),
                            ))),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    12)),
                                color: Color(colors.color_primary)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 30, bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 20),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 8, right: 25),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: TextFormField(
                                          controller: emailCtrl,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return Strings.valueEmpty;
                                            }

                                            return null;
                                          },
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(
                                                  10.0),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(8))),
                                              hintText: ''),
                                          style: TextStyle(
                                              height: 1, fontSize: 18),
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 20),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25, top: 8, right: 25),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: TextFormField(
                                          controller: passwordCtrl,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return Strings.valueEmpty;
                                            }

                                            return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(
                                                  10.0),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(8))),
                                              hintText: ''),
                                          style: TextStyle(
                                              height: 1, fontSize: 18),
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 25, top: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text("Sending Message"),
                                          ));
                                        },
                                        child: Text(
                                          "Forget Password?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: ElevatedButton(
                                        onPressed: () async {

                                          Map<String, dynamic> deviceData;
                                          late String os;
                                          late String brandLogin;
                                          late int apiLevelLogin;
                                          late String modelLogin;
                                          if(Factory().isAndroid(context))
                                          {
                                            deviceData = Factory().readAndroidBuildData(await DeviceInfoPlugin().androidInfo);
                                            os = "Android";
                                            brandLogin = deviceData['brand'];
                                            apiLevelLogin = deviceData['version.sdkInt'];
                                            modelLogin = deviceData['model'];

                                            // Factory().showSnackbar(context, os+'\n'+brandLogin+'\n'+apiLevelLogin.toString()+'\n'+modelLogin);
                                          }else if(Factory().isIos(context))
                                          {
                                            deviceData = Factory().readIosDeviceInfo(await DeviceInfoPlugin().iosInfo);
                                            os = "IOS";
                                            brandLogin = "systemName";
                                            apiLevelLogin = deviceData['systemVersion'];
                                            modelLogin = deviceData['model'];
                                          }

                                          if (_formKey.currentState!
                                              .validate()) {
                                            LoginRequest req = LoginRequest(
                                                userTypeID: "2",
                                                email: emailCtrl.text.toString(),
                                                userName: "",
                                                password: passwordCtrl.text.toString(),
                                                oSLogin: os,
                                                brandLogin: brandLogin,
                                                apiLevelLogin: apiLevelLogin.toString(),
                                                modelLogin: modelLogin,
                                                imei: "imei");
                                            // DataProvider().sign_in(
                                            //     context, this,
                                            //     req
                                            // );

                                            bloc.signIn(req);
                                          }

                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                left: 40, right: 40),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(colors
                                                        .color_button_stroke))),
                                            fixedSize: Size(double.nan, 45),
                                            primary: Colors.white),
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontFamily: 'Trebuc',
                                            color: Color(colors.color_primary),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              )),
        ));
  }

}
