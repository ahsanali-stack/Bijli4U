

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Helpers/ImageProcessor.dart';
import 'package:testproject/Models/Requests/update_profile_request.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/Profile/Bloc/ProfileBloc.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Profile();
  }

}
class Profile extends State<ProfileScreen> implements ProgressDialogCodeListener{
  late ProfileBloc bloc;
  final _formKey = GlobalKey<FormState>();
  var firstNameCtrl = TextEditingController();
  var lastNameCtrl = TextEditingController();
  var phoneNoCtrl = TextEditingController();
  var image_file ;


  @override
  void initState() {
    bloc = ProfileBloc(context);
    bloc.isEnable.sink.add(false);
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: bloc.userProfile.stream,
            builder: (BuildContext context, AsyncSnapshot<UserProfile> userProfile) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Color(colors.color_primary)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  widthFactor: double.maxFinite,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50.0),
                                        child: Image.network(
                                          Factory().get_image_url(userProfile.hasData ? userProfile.data!.image! : ""),
                                          height: 100.0,
                                          width: 100.0,
                                          fit: BoxFit.fill,
                                          errorBuilder: (context, error, stackTrace) {
                                            return image_file != null ? Image.file(File(image_file.path),width: 100,height: 100,fit: BoxFit.fill,) : Image.asset(ConstantManager.no_preview,width: 100,height: 100,fit: BoxFit.fill,);
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        child: StreamBuilder(
                                          stream: bloc.isEnable.stream,
                                          builder: (BuildContext context, AsyncSnapshot<bool> isEnable) {
                                            return isEnable.hasData && isEnable.data! ?
                                            GestureDetector(
                                              onTap: (){ Factory().showImageDialog(context, this);},
                                              child: Icon(Icons.add_circle_rounded,color: Colors.white,size: 35),) :
                                            Container();
                                          },
                                        ),left: 70,top: 70,)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Align(
                                    widthFactor: double.maxFinite,
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: (){
                                        bloc.isEnable.sink.add(true);
                                      },
                                      child: Icon(Icons.mode_edit,size: 30,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  "${userProfile.hasData ? userProfile.data!.firstName : ""} ${userProfile.hasData ? userProfile.data!.lastName : ""}",
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ))
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
                    child: Row(
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                              color: Color(colors.color_primary),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6,left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: StreamBuilder(
                        stream: bloc.isEnable.stream,
                        builder: (BuildContext context, AsyncSnapshot<bool> isEnable) {
                          return TextFormField(
                            controller: firstNameCtrl = Factory().getController(userProfile.hasData ? userProfile.data!.firstName! : ""),
                            enabled: isEnable.hasData ? isEnable.data : false,
                            // controller: emailCtrl,
                            keyboardType: TextInputType.text,
                            textAlignVertical: TextAlignVertical.center,
                            //validate email address
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Strings.valueEmpty;
                              }

                              return null;
                            },
                            //end here
                            decoration: InputDecoration(
                              // errorText: validateEmail
                              //     ? emailError
                              //     : null,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                errorStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .errorColor, // or any other color
                                ),
                                hintText: 'First Name'),
                            style: TextStyle(fontSize: 16),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                              color: Color(colors.color_primary),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6,left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: StreamBuilder(
                        stream: bloc.isEnable.stream,
                        builder: (BuildContext context, AsyncSnapshot<bool> isEnable) {
                          return TextFormField(
                            controller: lastNameCtrl = Factory().getController(userProfile.hasData ? userProfile.data!.lastName! : ""),
                            enabled: isEnable.hasData ? isEnable.data : false,
                            // controller: emailCtrl,
                            keyboardType: TextInputType.text,
                            textAlignVertical: TextAlignVertical.center,
                            //validate email address
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Strings.valueEmpty;
                              }

                              return null;
                            },
                            //end here
                            decoration: InputDecoration(
                              // errorText: validateEmail
                              //     ? emailError
                              //     : null,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                errorStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .errorColor, // or any other color
                                ),
                                hintText: 'Last Name'),
                            style: TextStyle(fontSize: 16),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Contact No",
                          style: TextStyle(
                              color: Color(colors.color_primary),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6,left: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: StreamBuilder(
                        stream: bloc.isEnable.stream,
                        builder: (BuildContext context, AsyncSnapshot<bool> isEnable) {
                          return TextFormField(
                            controller: phoneNoCtrl = Factory().getController(userProfile.hasData ? userProfile.data!.mobileNumber! : ""),
                            enabled: isEnable.hasData ? isEnable.data : false,
                            // controller: emailCtrl,
                            keyboardType: TextInputType.text,
                            textAlignVertical: TextAlignVertical.center,
                            //validate email address
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Strings.valueEmpty;
                              }

                              return null;
                            },
                            //end here
                            decoration: InputDecoration(
                              // errorText: validateEmail
                              //     ? emailError
                              //     : null,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors
                                            .color_primary)),
                                    gapPadding: 0.0),
                                errorStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .errorColor, // or any other color
                                ),
                                hintText: 'Phone number'),
                            style: TextStyle(fontSize: 16),
                          );
                        },
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: bloc.isEnable.stream,
                    builder: (BuildContext context, AsyncSnapshot<bool> isEnable) {
                      return isEnable.hasData && isEnable.data == true ?
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate())
                              {
                                if(image_file != null)
                                  ImageProcessor().decodeImage(image_file, this);
                                else {
                                  bloc.updateProfile(
                                    UpdateProfileRequest(
                                      userID: bloc.userProfile.stream.value.userID,
                                      firstName: firstNameCtrl.text.toString(),
                                      lastName: lastNameCtrl.text.toString(),
                                      mobileNumber: phoneNoCtrl.text.toString()
                                    )
                                  );
                                }
                              }
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
                              "Update",
                              style: TextStyle(
                                fontFamily: 'Trebuc',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                      ) :
                      Container();
                    },
                  ),
                ],
              );
            },
          ),
        )
      )
    );
  }

  void setData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);

    if(userprofile!=null)
      {
        bloc.userProfile.sink.add(userprofile);
      }
  }

  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    if(code == ConstantManager.IMAGE_SUCCESS){
      // Factory().showSnackbar(context, message!);
        UserProfile userProfile = bloc.userProfile.stream.value;
        userProfile.image = "No Image";
        image_file = data as XFile;
        bloc.userProfile.sink.add(userProfile);
    }
    else if(code == ConstantManager.IMAGE_UNSUCCESS)
      {
        Factory().showSnackbar(context, message!);
      }
    else if(code == ConstantManager.IMAGE_LIST_SUCCESS)
      {
        Factory().showSnackbar(context, message!);
        bloc.updateProfile(
            UpdateProfileRequest(
                userID: bloc.userProfile.stream.value.userID,
                firstName: firstNameCtrl.text.toString(),
                lastName: lastNameCtrl.text.toString(),
                mobileNumber: phoneNoCtrl.text.toString(),
                image: data
            )
        );
      }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(context);
  }

}