import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Helpers/ImageProcessor.dart';
import 'package:testproject/Models/Requests/add_item_request.dart';
import 'package:testproject/Models/Response/brand_all_base_response.dart' as BRAND;
import 'package:testproject/Models/Response/category_all_base_reponse.dart' as CAT;
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/Models/Response/sub_category_by_category_base_model.dart' as SUB;
import 'package:testproject/Models/Response/unit_base_respnse.dart' as UNIT;
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/MakeAPost/Bloc/MakeAPostBloc.dart';
import 'package:testproject/Models/Response/sale_type_base_response.dart' as SALE_TYPE;
import 'package:testproject/UI/Navigator/main_screen.dart';


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
  var postTypeCtrl = TextEditingController();
  var categoryCtrl = TextEditingController();
  var subCatCtrl = TextEditingController();
  var brandCtrl = TextEditingController();
  var capacityCtrl = TextEditingController();
  var unitCtrl = TextEditingController();
  var typeCtrl = TextEditingController();
  var amountCtrl = TextEditingController();
  var titleCtrl = TextEditingController();
  var descriptionCtrl = TextEditingController();


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
                                controller: postTypeCtrl = getController(sale_type.hasData ? sale_type.data!.itemSaleTypeName! : ""),
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
                          child: GestureDetector(
                            onTap: (){
                              bloc.getCategoryAll();
                            },
                            child: StreamBuilder(
                              stream: bloc.category_item.stream,
                              builder: (BuildContext context, AsyncSnapshot<CAT.Result> category_item) {
                                return TextFormField(
                                  controller: categoryCtrl = getController(category_item.hasData ? category_item.data!.category! : ""),
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
                          child: GestureDetector(
                            onTap: (){
                              if(!categoryCtrl.text.isEmpty)
                                {
                                  bloc.getSubCatByCat(bloc.category_item.hasValue ?  bloc.category_item.value.categoryID : 0);
                                }
                              else{
                                Factory().showSnackbar(context, "Please select category");
                              }
                            },
                            child: StreamBuilder(
                              stream: bloc.sub_cat_item.stream, 
                              builder: (BuildContext context, AsyncSnapshot<SUB.Result> sub_cat_item) {
                                return TextFormField(
                                  controller: subCatCtrl = getController(sub_cat_item.hasData ? sub_cat_item.data!.name! : ""),
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
                          child: GestureDetector(
                            onTap: (){
                              bloc.getBrandAll();
                            },
                            child: StreamBuilder(
                              stream: bloc.brand_item,
                              builder: (BuildContext context, AsyncSnapshot<BRAND.Result> brand_item) {
                                return TextFormField(
                                  controller: brandCtrl = getController(brand_item.hasData ? brand_item.data!.brandName! : ""),
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
                                );
                              },

                            ),
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
                                              controller: capacityCtrl,
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
                                                bloc.getUnit();
                                              },
                                              child: StreamBuilder(
                                                stream: bloc.unit_item.stream,
                                                builder: (BuildContext context, AsyncSnapshot<UNIT.Result> unit_item) { 
                                                  return TextFormField(
                                                    controller: unitCtrl = getController(unit_item.hasData ? unit_item.data!.unitType! : ""),
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
                                                  );
                                                },
                                              ),
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
                                            controller: amountCtrl,
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
                                                contentPadding: EdgeInsets.symmetric(
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
                              controller: titleCtrl,
                              enabled: true,
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
                              controller: descriptionCtrl,
                              enabled: true,
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
                                      return images.hasData && images.data!.length != index
                                          ? buildImageWidget(
                                          bloc.images.stream.value[index],
                                          index)
                                          : buildAddWidget();
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
                          if (_formKey.currentState!.validate()) {
                            if (bloc.images.stream.value.length > 0)
                              ImageProcessor().decodeImageList(images, this);
                            else
                              Factory().showSnackbar(context, "Please insert photos");
                          }
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
      bloc.base64_image_list.sink.add(data as List<String>);
      // Factory().showSnackbar(context, "Success ${bloc.base64_image_list.stream.value.length}");
      //
      addItem();


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

  void addItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);
    bloc.addItem(AddItemRequest(
      userTypeID: userprofile.userTypeID,
      categoryID: bloc.category_item.stream.value.categoryID,
      brandID: bloc.brand_item.stream.value.brandID,
      subCategoryID: bloc.sub_cat_item.stream.value.id,
      userID: userprofile.userID,
      itemSaleTypeID: bloc.sale_type.stream.value.itemSaleTypeID,
      amount: double.parse(amountCtrl.text),
      capacity: capacityCtrl.text,
      unitID: bloc.unit_item.stream.value.unitID.toString(),
      itemDescription: descriptionCtrl.text,
      titleName: titleCtrl.text,
      imageUrl: bloc.base64_image_list.stream.value
    ));


  }

}
