import 'package:flutter/material.dart';
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
import 'package:testproject/Models/Requests/registration_request.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/Launcher/launcher_screen.dart';
import 'package:testproject/UI/SignUp/Bloc/SignUpBloc.dart';

void main() =>
    MaterialApp(
        title: "Sign Up Screen",
        debugShowCheckedModeBanner: false,
        home: SignUpScreen());

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen();
  }
}

class Screen extends State<SignUpScreen> implements ProgressDialogCodeListener {
  void presss() {}
  final emailCtrl = TextEditingController();
  final userNameCtrl = TextEditingController();
  final cnicCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShowing = false;
  late SignUpBloc bloc;


  @override
  void initState() {
    bloc = SignUpBloc(context);
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    userNameCtrl.dispose();
    cnicCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: bloc.showingStream,
          builder: (BuildContext context, AsyncSnapshot<bool> isShowing) {
            return ModalProgressHUD(
              inAsyncCall: isShowing.hasData ? isShowing.data! : false,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: Factory().getHeightOfScreen(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  width: 300,
                                  child: Text(
                                    ConstantManager.slogan,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            colors.color_button_stroke)),
                                  ))),
                        ),
                        Align(
                          child: Padding(
                              padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 40),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                    color: Color(colors.color_primary)),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Register",
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
                                              keyboardType:
                                              TextInputType.emailAddress,
                                              textAlignVertical:
                                              TextAlignVertical.center,
                                              //validate email address
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return Strings.valueEmpty;
                                                } else if (!Factory()
                                                    .isValidEmail(
                                                    value.toString()))
                                                  return Strings.emailInvalid;

                                                return null;
                                              },
                                              //end here
                                              decoration: InputDecoration(
                                                // errorText: validateEmail
                                                //     ? emailError
                                                //     : null,
                                                  contentPadding:
                                                  EdgeInsets.all(10.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(8))),
                                                  hintText: 'Enter Email'),
                                              style:
                                              TextStyle(
                                                  height: 1, fontSize: 18),
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, top: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Username",
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
                                              //validate
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return Strings.valueEmpty;
                                                }

                                                return null;
                                              },
                                              //ends here
                                              controller: userNameCtrl,
                                              keyboardType: TextInputType.text,
                                              textAlignVertical:
                                              TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.all(10.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(8))),
                                                  hintText: 'Enter Username'),
                                              style:
                                              TextStyle(
                                                  height: 1, fontSize: 18),
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, top: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "CNIC",
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
                                              //validate
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return Strings.valueEmpty;
                                                } else if (value.length != 15) {
                                                  return Strings.invalidCnic;
                                                }

                                                return null;
                                              },
                                              //ends here
                                              controller: cnicCtrl,
                                              inputFormatters: [
                                                ConstantManager
                                                    .maskCnicFormatter
                                              ],
                                              keyboardType: TextInputType
                                                  .number,
                                              textAlignVertical:
                                              TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.all(10.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(8))),
                                                  hintText: '00000-0000000-0'),
                                              style:
                                              TextStyle(
                                                  height: 1, fontSize: 18),
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  // DataProvider().sign_up(
                                                  //     context,
                                                  //     this,
                                                  //     RegistrationRequest(
                                                  //         userTypeID: "2",
                                                  //         email: emailCtrl.text
                                                  //             .toString(),
                                                  //         userName: userNameCtrl
                                                  //             .text
                                                  //             .toString(),
                                                  //         cNIC: cnicCtrl.text
                                                  //             .toString()));\

                                                  bloc.signUp(RegistrationRequest(
                                                              userTypeID: "2",
                                                              email: emailCtrl.text
                                                                  .toString(),
                                                              userName: userNameCtrl
                                                                  .text
                                                                  .toString(),
                                                              cNIC: cnicCtrl.text
                                                                  .toString()));
                                                }
                                              });
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
                                                primary: Colors.white),
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                fontFamily: 'Trebuc',
                                                color: Color(
                                                    colors.color_primary),
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
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  void onDismiss(String? error) {
    if (isShowing)
      setState(() {
        isShowing = false;
      });
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (isShowing)
      setState(() {
        isShowing = false;
      });


    if (code == ConstantManager.SIGN_UP_SUCCESS) {
      Factory().finishScreenCompletely(context, () => LauncherScreen());
    } else if (code == ConstantManager.SIGN_UP_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    }
  }

  @override
  void onShow() {
    if (!isShowing)
      setState(() {
        isShowing = true;
      });
  }
}
