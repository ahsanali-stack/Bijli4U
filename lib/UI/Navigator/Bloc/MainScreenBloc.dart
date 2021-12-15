import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/UI/Favorite/favorite_screen.dart';
import 'package:testproject/UI/Home/home_screen.dart';
import 'package:testproject/UI/MakeAPost/make_a_post_screen.dart';
import 'package:testproject/UI/Navigator/main_screen.dart';
import 'package:testproject/UI/Notification/notification_screen.dart' as Notification;
import 'package:testproject/UI/Settings/settings_screen.dart';
import 'package:testproject/test.dart';

class MainScreenBloc{

  final current_index = BehaviorSubject<int>();
  final pages = BehaviorSubject<List<Widget>>();
  final home = BehaviorSubject<Home>();
  final favorite = BehaviorSubject<Favorites>();
  final make_a_post = BehaviorSubject<MakePost>();
  final notification = BehaviorSubject<Notification.NotificationScreen>();
  final setting = BehaviorSubject<Settings>();

  onItemTap(int index){
    current_index.sink.add(index);
  }

  buildScreen(){
    home.sink.add(Home());
    favorite.sink.add(Favorites());
    make_a_post.sink.add(MakePost());
    notification.sink.add(Notification.NotificationScreen());
    setting.sink.add(Settings());
  }



  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return home.stream.value;
      case 1:
        return favorite.stream.value;
      case 2:
        return make_a_post.stream.value;
      case 3:
        return notification.stream.value;
      case 4:
        return setting.stream.value;
    }
    return home.stream.value;
  }
}