import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class LoadCalculatorBloc{

  final item_list = BehaviorSubject<List<Widget>>();


  removeItemAt(int index){
    List<Widget> temp_list = item_list.stream.value;
    temp_list.removeAt(index);
    item_list.sink.add(temp_list);
  }

}