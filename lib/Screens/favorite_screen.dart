

import 'package:flutter/cupertino.dart';

class Favorites extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Favorites>{
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: Text("Favorite"),
    );
  }

}