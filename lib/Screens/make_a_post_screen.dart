

import 'package:flutter/cupertino.dart';

class MakePost extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<MakePost>{
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: Text("Make A Post"),
    );
  }

}