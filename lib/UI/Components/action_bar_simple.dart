import 'package:flutter/material.dart';
import 'package:testproject/Colors/Colors.dart';

class ActionBarSimple{
  AppBar getAppBar(BuildContext context,String title,bool isCentre,bool automaticallyImplyLeading,double height)
  {
    return AppBar(
      title: Text(title),
      centerTitle: isCentre,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Color(colors.color_primary),
      toolbarHeight: height,
    );
  }
}