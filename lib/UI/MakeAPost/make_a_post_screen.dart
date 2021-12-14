import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Helpers/ImageProcessor.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/MakeAPost/Bloc/MakeAPostBloc.dart';
import 'package:testproject/Models/Response/sale_type_base_response.dart' as SALE_TYPE;


class MakePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<MakePost> implements ProgressDialogCodeListener {
  final _formKey = GlobalKey<FormState>();
  List<XFile> images = [];
  late MakeAPostBloc bloc = MakeAPostBloc(context);
  int image_replace_index = 0;
  bool replace_image = false;

  //controller here
  final postTypeCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    bloc.images.sink.add(images);


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
                              bloc.getSaleTypeList();
                            },
                            child: StreamBuilder(
                              stream: bloc.sale_type.stream,
                              builder: (BuildContext context, AsyncSnapshot<SALE_TYPE.Result> sale_type) {
                                return TextFormField(
                                controller: getController(sale_type.hasData ? sale_type.data!.itemSaleTypeName! : "Select"),
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
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(colors.color_primary)),
                                        gapPadding: 0.0),
                                    errorStyle: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .errorColor, // or any other color
                                    ),
                                    hintText: 'Select'),
                                style: TextStyle(fontSize: 16),
                              );
                                },
                            ),
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
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors.color_primary)),
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
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors.color_primary)),
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
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Color(colors.color_primary)),
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
                                                  errorBorder: OutlineInputBorder(
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
                                                  errorBorder: OutlineInputBorder(
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
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Amount (PKR) =",
                                              style: TextStyle(
                                                  color: Color(
                                                      colors.color_primary),
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
                                                errorBorder: OutlineInputBorder(
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
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: Color(colors.color_primary)),
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
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: Color(colors.color_primary)),
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
                          Padding(padding: EdgeInsets.only(top: 20),
                            child: Container(
                              height: 100,
                              child: StreamBuilder(
                                stream: bloc.images.stream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<XFile>> images) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: bloc.images.hasValue ? bloc
                                        .images.stream.value.length + 1 : 1,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return images.data!.length == index
                                          ? buildAddWidget()
                                          :
                                      buildImageWidget(
                                          bloc.images.stream.value[index],
                                          index);
                                    },

                                  );
                                },
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

                          // if (_formKey.currentState!
                          //     .validate()) {}
                          if (bloc.images.stream.value.length > 0)
                            ImageProcessor().decodeImageList(images, this);
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
  void initState() {
  }

  @override
  void onDismiss(String? error) {
    // TODO: implement onDismiss
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing)
      Factory().dismissProgressDialog(context);

    if (ConstantManager.IMAGE_SUCCESS == code) {
      if (data != null) {
        if (replace_image) {
          images[image_replace_index] = data as XFile;
          bloc.images.sink.add(images);
          replace_image = false;
        }
        else {
          images.add(data as XFile);
          bloc.images.sink.add(images);
        }
      }
    }
    else if (ConstantManager.IMAGE_UNSUCCESS == code) {
      Factory().showSnackbar(context, "Failure");
    }
    else if (ConstantManager.IMAGE_LIST_SUCCESS == code) {


      Factory().showSnackbar(context, "Success ${(data as List<String>).length}");
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing)
      Factory().showProgressDialog(context);
  }

  buildAddWidget() {
    return GestureDetector(
      onTap: () {
        Factory().showImageDialog(context, this);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey
          ),
          child: Icon(Icons.add, size: 100, color: Colors.white,),
        ),
      ),
    );
  }

  buildImageWidget(XFile value, int index) {
    File file = File(value.path);

    return Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.file(file, height: 100, width: 100, fit: BoxFit.fill),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        images.removeAt(index);
                        bloc.images.sink.add(images);
                      },
                      child: Icon(Icons.cancel, color: Colors.red, size: 30,),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        image_replace_index = index;
                        replace_image = true;
                        Factory().showImageDialog(context, this);
                      },
                      child: Icon(Icons.add_a_photo_rounded,
                        color: Color(colors.color_primary), size: 30,),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  getController(String value) {
    TextEditingController controller = TextEditingController();
    controller.text = value;
    return controller;
  }

}
