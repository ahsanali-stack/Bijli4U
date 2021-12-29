
import 'package:flutter/gestures.dart';
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


class HomeScreen extends StatefulWidget {
  final int current_index;
  HomeScreen(this.current_index);


  @override
  State<StatefulWidget> createState() {
    return MainScreen();
  }

}

class MainScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{
  final pages = [Home(),Favorites(),MakePost(),NotificationScreen(),Settings()];
  late MainScreenBloc bloc;



  @override
  void initState() {
    bloc = MainScreenBloc();
    bloc.onItemTap(widget.current_index);



    // Factory().showSnackbar(context, "Yes");
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
          body: IndexedStack(
            index: current_index.hasData ? current_index.data : 0,
            children: pages,
          ),
          appBar: current_index.hasData ? buildAppBar(current_index.data!) : buildAppBar(0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color(colors.color_primary),
            unselectedItemColor: Colors.grey,
            onTap: onItemTap,
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

  // Widget _buildScreen(current_index) {
  //   switch(current_index)
  //   {
  //     case 0:
  //       return bloc.home.stream.value;
  //     case 1:
  //       return bloc.favorite.stream.value;
  //     case 2:
  //       return bloc.make_a_post.stream.value;
  //     case 3:
  //       return bloc.notification.stream.value;
  //     case 4:
  //       return bloc.setting.stream.value;
  //   }
  //   return Container(
  //     child: Text("Error"),
  //     alignment: Alignment.center,
  //   );
  // }

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


  void onItemTap(int value) {
    bloc.current_index.sink.add(value);
  }
}
