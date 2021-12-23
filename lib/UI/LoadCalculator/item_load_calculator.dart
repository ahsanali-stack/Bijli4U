
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/UI/LoadCalculator/LoadCalculatorBloc.dart';

class ItemWidget extends StatefulWidget{

  ItemWidget(this.i, this.bloc);

  final int i;
  final LoadCalculatorBloc bloc;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Item(i,bloc);
  }

}

class Item extends State<ItemWidget>{
  Item(this.index, this.bloc);

  final int index;
  final LoadCalculatorBloc bloc;

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    bloc.removeItemAt(index);
                  },
                  child: Icon(Icons.cancel,color: Color(colors.color_primary),),
                )
            ),
            Row(
              children: [
                Text(
                  "Appliance",
                  style: TextStyle(
                      color: Color(colors.color_primary),
                      fontSize: 12),
                ),
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: (){
                },
                child: TextFormField(
                  enabled: false,
                  // controller: emailCtrl,
                  keyboardType: TextInputType.text,
                  textAlignVertical: TextAlignVertical.center,
                  //validate email address
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Strings.valueEmpty;
                    }
                    return null;
                  },
                  // end here
                  decoration: InputDecoration(

                    // errorText: validateEmail
                    //     ? emailError
                    //     : null,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      disabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1.0,
                              color: Color(colors
                                  .color_primary)),
                          gapPadding: 0.0),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1.0,
                              color: Color(colors
                                  .color_primary)),
                          gapPadding: 0.0),
                      errorStyle: TextStyle(
                        color: Theme
                            .of(context)
                            .errorColor, // or any other color
                      ),
                      hintText: 'Select'),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Power",
                                  style: TextStyle(
                                      color:
                                      Color(colors.color_primary),
                                      fontSize: 12),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Colors.red,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: TextFormField(
                                enabled: true,
                                // controller: emailCtrl,
                                keyboardType: TextInputType.number,
                                textAlignVertical:
                                TextAlignVertical.center,
                                //validate email address
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return Strings.valueEmpty;
                                  }

                                  return null;
                                },
                                //end here
                                decoration: InputDecoration(
                                  // errorText: validateEmail
                                  //     ? emailError
                                  //     : null,
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 10),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(colors
                                                .color_primary)),
                                        gapPadding: 0.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(colors
                                                .color_primary)),
                                        gapPadding: 0.0),
                                    errorStyle: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .errorColor, // or any other color
                                    ),
                                    hintText: 'Type'),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Unit",
                                  style: TextStyle(
                                      color:
                                      Color(colors.color_primary),
                                      fontSize: 12),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Colors.red,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: TextFormField(
                                  enabled: false,
                                  // controller: emailCtrl,
                                  keyboardType: TextInputType.text,
                                  textAlignVertical:
                                  TextAlignVertical.center,
                                  //validate email address
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return Strings.valueEmpty;
                                    }

                                    return null;
                                  },
                                  //end here
                                  decoration: InputDecoration(
                                    // errorText: validateEmail
                                    //     ? emailError
                                    //     : null,
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 0.0,
                                          horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(colors
                                                  .color_primary)),
                                          gapPadding: 0.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(colors
                                                  .color_primary)),
                                          gapPadding: 0.0),
                                      errorStyle: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .errorColor, // or any other color
                                      ),
                                      hintText: 'Select'),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.chevron_left,color: Color(colors.color_primary),size: 40,),
                    Container(color: Colors.black,width: 40,height: 1,),
                    Padding(padding: EdgeInsets.only(left: 6,right: 5),child:Text("1",style: TextStyle(color: Color(colors.color_primary),fontFamily: 'Trebuc',fontSize: 20))),
                    Container(color: Colors.black,width: 40,height: 1,),
                    Icon(Icons.chevron_right,color: Color(colors.color_primary),size: 40,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}