

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/Strings.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/UI/Components/action_bar_simple.dart';
import 'package:testproject/UI/InquiryForm/Bloc/InquiryFormBloc.dart';
import 'package:testproject/Models/Requests/add_enquiry.dart';


class InquiryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Inquiry();
  }

}

class Inquiry extends State<InquiryScreen>
{
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameCtrl = TextEditingController();
    final phoneNoCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    var applicationCtrl = TextEditingController();
    var frequencyCtrl = TextEditingController();
    var operatingHrsCtrl = TextEditingController();
    var fuelTypeCtrl = TextEditingController();
    var startingMethodCtrl = TextEditingController();
    var soundLevelCtrl = TextEditingController();
    var voltageCtrl = TextEditingController();
    final powerCtrl = TextEditingController();
    final appliancesCtrl = TextEditingController();
    final bloc = InquiryFormBloc(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionBarSimple().getAppBar(context, "Inquiry From", false, true, 56),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Contact Name",
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
                  padding: EdgeInsets.only(top: 4),
                  child: TextFormField(
                    enabled: true,
                    controller: nameCtrl,
                    keyboardType: TextInputType.name,
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
                        hintText: 'Enter Contact Name'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text(
                      "Phone Number",
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
                ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: TextFormField(
                    enabled: true,
                    controller: phoneNoCtrl,
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
                        hintText: 'Enter Contact Number'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Email Address",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: TextFormField(
                    enabled: true,
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
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
                        hintText: 'Enter Email Address'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Application",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showApplicatonDialog();
                    },
                    child: StreamBuilder(
                      stream: bloc.application,
                      builder: (BuildContext context, AsyncSnapshot<String> application) {
                        return TextFormField(
                          enabled: false,
                          controller: applicationCtrl = Factory().getController(application.hasData ? application.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Frequency Of Uses",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showFrequencyDialog();
                    },
                    child: StreamBuilder(
                      stream: bloc.frequency.stream,
                      builder: (BuildContext context, AsyncSnapshot<String> frequency) {
                        return TextFormField(
                          enabled: false,
                          controller: frequencyCtrl = Factory().getController(frequency.hasData ? frequency.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Operating Hours",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showOperatingHoursDialog();
                    },
                    child: StreamBuilder(
                      stream: bloc.operatingHrs.stream,
                      builder: (BuildContext context, AsyncSnapshot<String> hours) {
                        return TextFormField(
                          enabled: false,
                          controller: operatingHrsCtrl = Factory().getController(hours.hasData ? hours.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },

                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Fuel Type",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showFuelTypeDialog();
                    },
                    child: StreamBuilder(
                      stream: bloc.fuelType.stream,
                      builder: (BuildContext context, AsyncSnapshot<String> fuel) {
                        return TextFormField(
                          enabled: false,
                          controller: fuelTypeCtrl = Factory().getController(fuel.hasData ? fuel.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Starting Method",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showStartingMethodDialog();
                    }
                    ,child: StreamBuilder(
                    stream: bloc.startingMethod.stream,
                    builder: (BuildContext context, AsyncSnapshot<String> startingMethod) {
                      return  TextFormField(
                        enabled: false,
                        controller: startingMethodCtrl = Factory().getController(startingMethod.hasData ? startingMethod.data! : ""),
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
                            hintText: 'Choose an option'),
                        style: TextStyle(fontSize: 16),
                      );
                    },
                  ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Sound Level",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showSoundLevel();
                    },
                    child: StreamBuilder(
                      stream: bloc.soundLevel.stream,
                      builder: (BuildContext context, AsyncSnapshot<String> soundLevel) {
                        return TextFormField(
                          enabled: false,
                          controller: soundLevelCtrl = Factory().getController(soundLevel.hasData ? soundLevel.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Voltage Required",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: (){
                      bloc.showVotageRequired();
                    },
                    child: StreamBuilder(
                      stream: bloc.voltageRequired.stream,
                      builder: (BuildContext context, AsyncSnapshot<String> voltage) {
                        return TextFormField(
                          enabled: false,
                          controller: voltageCtrl = Factory().getController(voltage.hasData ? voltage.data! : ""),
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
                              hintText: 'Choose an option'),
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Total Power Required (kW)",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: TextFormField(
                    enabled: true,
                    controller: powerCtrl,
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
                        hintText: 'Enter Power'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        "List All Appliances Beign Powered",
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
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: TextFormField(
                    scrollPhysics: ScrollPhysics(),
                    maxLines: 3,
                    minLines: 3,
                    enabled: true,
                    controller: appliancesCtrl,
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
                            vertical: 10.0,
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
                        hintText: 'Enter a list'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.addEnquiry(
                            AddEnquiry(
                              contactName: nameCtrl.text.toString(),
                              phoneNumber: phoneNoCtrl.text.toString(),
                              email: emailCtrl.text.toString(),
                              application: appliancesCtrl.text.toString(),
                              frequencyUse: frequencyCtrl.text.toString(),
                              operatingHours: operatingHrsCtrl.text.toString(),
                              fuelType: fuelTypeCtrl.text.toString(),
                              startingMethod: startingMethodCtrl.text.toString(),
                              soundLevel: soundLevelCtrl.text.toString(),
                              voltageRequired: voltageCtrl.text.toString(),
                              listAllAppliancesBeingPowered: appliancesCtrl.text.toString(),
                              otherDetailsSpecicalRequirementAdditions: ""
                            )
                          );
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
                ),
              ],
            ),
          )
        ),
      )
    );
  }

}