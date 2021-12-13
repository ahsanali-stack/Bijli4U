
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class MakePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<MakePost> implements ProgressDialogCodeListener{
  final _formKey = GlobalKey<FormState>();
  final postTypeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Select Post Type",
                          style: TextStyle(
                              color: Color(colors.color_primary), fontSize: 12),
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
                        controller: postTypeCtrl,
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
                        //end here
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
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Select'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Select Category",
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextFormField(
                        controller: postTypeCtrl,
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
                        //end here
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
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Select'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Select Sub Category",
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextFormField(
                        controller: postTypeCtrl,
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
                        //end here
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
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Select'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Select Brand",
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextFormField(
                        controller: postTypeCtrl,
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
                        //end here
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
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Select'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 12, right: 12, bottom: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
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
                                            "Capacity",
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
                                          controller: postTypeCtrl,
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
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Color(colors
                                                          .color_primary)),
                                                  gapPadding: 0.0),
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
                                        child: TextFormField(
                                          controller: postTypeCtrl,
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
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Color(colors
                                                          .color_primary)),
                                                  gapPadding: 0.0),
                                              hintText: 'Select'),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Amount (PKR) =",
                                          style: TextStyle(
                                              color: Color(colors.color_primary),
                                              fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 10,
                                          color: Colors.red,
                                        )
                                      ],
                                    )),
                                Expanded(
                                  flex: 1,
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: TextFormField(
                                    controller: postTypeCtrl,
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
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Color(colors
                                                    .color_primary)),
                                            gapPadding: 0.0),
                                        hintText: 'Type'),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ))
                              ],
                            ))
                      ],
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                              color: Color(colors.color_primary), fontSize: 12),
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
                        controller: postTypeCtrl,
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
                        //end here
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
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Type'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Description",
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextFormField(
                        controller: postTypeCtrl,
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
                        //end here
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
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(colors.color_primary)),
                                gapPadding: 0.0),
                            hintText: 'Type'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap:(){
                        Factory().showImageDialog(context, this);
                      },
                      child: Container(
                        height: 100,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey
                              ),
                              child: Icon(Icons.add,size: 100,color: Colors.white,),
                            );
                          },

                        ),
                      ),
                    ),)
                  ],
                ),
              ),
            ),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!
                          .validate()) {
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 40, right: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .all(
                              Radius.circular(8)),
                          side: BorderSide(
                              width: 1,
                              color: Color(colors
                                  .color_button_stroke))),
                      fixedSize: Size(double.maxFinite, 45),
                      primary: Color(
                          colors.color_primary)),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: 'Trebuc',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }

  @override
  void onDismiss(String? error) {
    // TODO: implement onDismiss
  }

  @override
  void onHide(int code, String? message, Object data) {
    // TODO: implement onHide
  }

  @override
  void onShow() {
    // TODO: implement onShow
  }
}
