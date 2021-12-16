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

  onItemTap(int index){
    current_index.sink.add(index);
  }

}