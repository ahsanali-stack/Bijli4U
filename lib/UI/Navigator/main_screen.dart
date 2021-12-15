
import 'package:flutter/material.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/UI/Components/action_bar_simple.dart';
import 'package:testproject/UI/Favorite/favorite_screen.dart';
import 'package:testproject/UI/Home/home_screen.dart';
import 'package:testproject/UI/MakeAPost/make_a_post_screen.dart';
import 'package:testproject/UI/Navigator/Bloc/MainScreenBloc.dart';
import 'package:testproject/UI/Notification/notification_screen.dart';
import 'package:testproject/UI/Settings/settings_screen.dart';
import 'package:testproject/main.dart';

import '../Components/action_bar_home_screen.dart';

void main() => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Test Application",
    home: HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreen();
  }
}

class MainScreen extends State<HomeScreen> {
  final pages = [Home(),Favorites(),MakePost(),NotificationScreen(),Settings()];
  static final MainScreenBloc bloc = MainScreenBloc();
  int current_index = 0;


  @override
  void initState() {
    bloc.pages.sink.add(pages);
    bloc.buildScreen();
    bloc.onItemTap(0);
  } // IndexedStack(
  // index: current_index,
  // children: pages,
  // )
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(stream: bloc.current_index.stream,
      builder: (BuildContext context, AsyncSnapshot<int> current_index) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: _buildScreen(current_index.hasData ? current_index.data : 0),
          appBar: current_index.hasData ? buildAppBar(current_index.data!) : buildAppBar(0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color(colors.color_primary),
            unselectedItemColor: Colors.grey,
            onTap: bloc.onItemTap,
            currentIndex: current_index.hasData ? current_index.data! : 0,
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
          )
      );
      },);
  }

  Widget _buildScreen(current_index) {
    switch(current_index)
    {
      case 0:
        return bloc.home.value;
      case 1:
        return bloc.favorite.value;
      case 2:
        return bloc.make_a_post.value;
      case 3:
        return bloc.notification.value;
      case 4:
        return bloc.setting.value;
    }
    return Container(
      child: Text("Error"),
      alignment: Alignment.center,
    );
  }

  PreferredSizeWidget buildAppBar(int current_index) {
    switch(current_index)
    {
      case 0:
        return ActionBarHomeScreen().getActionBar(context);
      case 1:
        return ActionBarSimple().getAppBar(context,"Favorites",false,false,56);
      case 2:
        return ActionBarSimple().getAppBar(context,"Selling Form",false,false,56);
      case 3:
        return ActionBarSimple().getAppBar(context,"Notifications",false,false,0.0);
      case 4:
        return ActionBarSimple().getAppBar(context,"Settings",false,false,0.0);
    }
    return ActionBarSimple().getAppBar(context,"Selling Form",false,false,56);
  }



}
