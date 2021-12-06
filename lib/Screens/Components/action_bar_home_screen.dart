

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/login_response.dart';

class ActionBarHomeScreen {
  PreferredSizeWidget getActionBar(BuildContext context){
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: Color(colors.color_primary),
      title: Row(
        children: [
          GestureDetector(
            onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? value = prefs.getString(ConstantManager.USER_MODEL);
              LoginResponse res = LoginResponse.fromJson(jsonDecode(value!));
              Factory().showSnackbar(context, "${res.result!.userProfile!.userName}");
            },
            child: Container(
              width: Factory().getWidthOfScreen(context)/1.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,

              ),
              child: Padding(
                padding: EdgeInsets.only(left: 6,top: 8,bottom: 8,right: 6),
                child: Text("Honda, 5Kva, Piston",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                  ),),
              ),
            ),
          ),

        ],
      ),
      actions: [
        GestureDetector(
            onTap: (){
              Factory().showSnackbar(context, "Clicked");
            },
            child: Padding(
              padding: EdgeInsets.only(right:4 ),
              child: Icon(Icons.share_location_rounded),
            )
        )
      ],
      automaticallyImplyLeading: false,

      centerTitle: false,
    );
  }
}