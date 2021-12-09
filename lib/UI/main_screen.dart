
import 'package:flutter/material.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/UI/Components/action_bar_simple.dart';
import 'package:testproject/UI/Favorite/favorite_screen.dart';
import 'package:testproject/UI/Home/home_screen.dart';
import 'package:testproject/UI/MakeAPost/make_a_post_screen.dart';
import 'package:testproject/UI/Notification/notification_screen.dart';
import 'package:testproject/UI/Settings/settings_screen.dart';
import 'package:testproject/main.dart';

import 'Components/action_bar_home_screen.dart';

void main() => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Test Application",
    home: HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen();
  }
}

class Screen extends State<HomeScreen> {
  late int current_index = 0;
  final pages = [Home(),Favorites(),MakePost(),NotificationScreen(),Settings()];

  onItemTap(int index){
    setState(() {
      current_index = index;
    });
  }



  // IndexedStack(
  // index: current_index,
  // children: pages,
  // )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:_buildScreen(),
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(colors.color_primary),
        unselectedItemColor: Colors.grey,
        onTap: onItemTap,
        currentIndex: current_index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Make a Post',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),


        ],
      ),
    );
  }

  Widget _buildScreen() {
    switch(current_index)
    {
      case 0:
        return Home();
      case 1:
        return Favorites();
      case 2:
        return MakePost();
      case 3:
        return NotificationScreen();
      case 4:
        return Settings();
    }
    return Container(
      child: Text("Error"),
      alignment: Alignment.center,
    );
  }

  PreferredSizeWidget buildAppBar() {
    switch(current_index)
    {
      case 0:
        return ActionBarHomeScreen().getActionBar(context);
      case 1:
        return ActionBarSimple().getAppBar(context,"Favorites",false,false,56);
      case 2:
        return ActionBarSimple().getAppBar(context,"Post",false,false,56);
      case 3:
        return ActionBarSimple().getAppBar(context,"Notifications",false,false,0.0);
      case 4:
        return ActionBarSimple().getAppBar(context,"Settings",false,false,0.0);
    }
    return ActionBarSimple().getAppBar(context,"Post",false,false,56);
  }



}
