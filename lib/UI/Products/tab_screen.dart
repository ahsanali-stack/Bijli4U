

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/UI/Products/Bloc/RentBloc.dart';
import 'package:testproject/UI/Products/buy_tab.dart';
import 'package:testproject/UI/Products/rent_tab.dart';

import 'Bloc/BuyBloc.dart';

class Tab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabScreen();
  }

}

class TabScreen extends State<Tab>{
  late Rent rent ;
  late Buy buy ;
  static late RentBloc rentBloc;
  static late BuyBloc buyBloc;

  @override
  void initState() {
    // setData();
    //
    rent = Rent();
    buy = Buy();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Products"),
          backgroundColor: Color(colors.color_primary),
      bottom: TabBar(
        tabs: [
          Padding(padding: EdgeInsets.only(top: 0,bottom: 15),child: Text("RENT", style: TextStyle(fontWeight: FontWeight.bold))),
          Padding(padding: EdgeInsets.only(top: 0,bottom: 15),child: Text("BUY", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),),
          body: TabBarView(
            children: [
              rent,
              buy
            ],
          ),
    ));

  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);
    //
    rentBloc = RentBloc(context);
    rentBloc.getAllItems(1, userprofile.userID!);
    buyBloc = BuyBloc(context);
    buyBloc.getAllItems(2, userprofile.userID!);
  }


}