
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/UI/LoadCalculator/LoadCalculatorBloc.dart';
import 'package:testproject/UI/LoadCalculator/item_load_calculator.dart';

class LoadCalculatorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadCalculator();
  }

}

class LoadCalculator extends State<LoadCalculatorScreen>{
  List<ItemWidget> item_list = [];
  late LoadCalculatorBloc bloc;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    bloc = LoadCalculatorBloc();
    addItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Load Calculator"),
        backgroundColor: Color(colors.color_primary),
      ),
      body: Stack(
        textDirection: TextDirection.rtl,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 50),
              child: StreamBuilder(
                stream: bloc.item_list.stream,
                builder: (BuildContext context, AsyncSnapshot<List<Widget>> item_list)
                {
                  return Column(
                    children: item_list.hasData ? item_list.data! : [Container()],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.only(right: 10),child:FloatingActionButton(onPressed: (){ addItem();},heroTag: "btn1",backgroundColor: Color(colors.color_primary),child: Icon(Icons.add,color: Colors.white,),)),
                Padding(padding: EdgeInsets.only(right: 10,top: 10,bottom: 10),child:FloatingActionButton(onPressed: (){},heroTag: "btn2",backgroundColor: Color(colors.color_primary),child: Icon(Icons.calculate,color: Colors.white,),)),
                Container(
                  key: key,
                  color: Colors.white,
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text("Total Load",style: TextStyle(color: Color(colors.color_primary),fontSize: 16,fontFamily: 'Trebuc',fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("0 (KW)",style: TextStyle(color: Color(colors.color_primary),fontSize: 16,fontFamily: 'Trebuc',fontWeight: FontWeight.bold)),
                      ],
                    ),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addItem() {
    if(item_list.length != 0)
      item_list.add(ItemWidget(item_list.length-1,bloc));
    else
      item_list.add(ItemWidget(0,bloc));

    bloc.item_list.sink.add(item_list);
  }

  double getBottomPadding() {
    final keyContext = key.currentContext;
    late RenderBox box ;
    if (keyContext != null) {
      // widget is visible
       box = keyContext.findRenderObject() as RenderBox;
    }

    return box != null ? box.size.height : 50.0;
  }

}