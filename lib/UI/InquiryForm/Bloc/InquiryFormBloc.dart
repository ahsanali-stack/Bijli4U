

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/add_enquiry.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class InquiryFormBloc implements ProgressDialogCodeListener {
  InquiryFormBloc(this.context);

  final BuildContext context;

  final application = BehaviorSubject<String>();
  final frequency = BehaviorSubject<String>();
  final operatingHrs = BehaviorSubject<String>();
  final fuelType = BehaviorSubject<String>();
  final startingMethod = BehaviorSubject<String>();
  final soundLevel = BehaviorSubject<String>();
  final voltageRequired = BehaviorSubject<String>();

  showApplicatonDialog(){
    showListDialog(101, ConstantManager.applications_list);
  }

  showFrequencyDialog(){
    showListDialog(102, ConstantManager.frequncy_list);
  }

  showOperatingHoursDialog(){
    showListDialog(103, ConstantManager.hours_list);
  }

  showFuelTypeDialog(){
    showListDialog(104, ConstantManager.fuel_type_list);
  }

  showStartingMethodDialog(){
    showListDialog(105, ConstantManager.starting_method_list);
  }

  showSoundLevel(){
    showListDialog(106, ConstantManager.sound_level_list);
  }

  showVotageRequired(){
    showListDialog(107, ConstantManager.voltage_list);
  }

  addEnquiry(AddEnquiry request) => DataProvider().addEnquiry(context, this, request);


  //general dialog for list
  showListDialog(int code, List<String> list) {
    String title = "";

    if(code == 101)
      title = "Application";
    else if(code == 102)
      title = "Frequency Of Uses";
    else if(code == 103)
      title = "Credit Hours";
    else if(code == 104)
      title = "Fuel Type";
    else if(code == 105)
      title = "Starting Method";
    else if(code == 106)
      title = "Sound Level";
    else if(code == 107)
      title = "Voltage Required";

    //Dialog here
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext _context) {
        final dialog = AlertDialog(
          title: Text("$title"),
          content: Container(
            width: double.maxFinite,
            child:  ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(_context).pop();

                    if(code == 101)
                      application.sink.add(list[index]);
                    else if(code == 102)
                      frequency.sink.add(list[index]);
                    else if(code == 103)
                      operatingHrs.sink.add(list[index]);
                    else if(code == 104)
                      fuelType.sink.add(list[index]);
                    else if(code == 105)
                      startingMethod.sink.add(list[index]);
                    else if(code == 106)
                      soundLevel.sink.add(list[index]);
                    else if(code == 107)
                      voltageRequired.sink.add(list[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("${list[index]}"),
                  ),
                );
              },
            ),
          ),
        );
        return dialog;
      },
    );
  }

  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    if(code == ConstantManager.ENQUIRY_SUCCESS)
      {
        Navigator.pop(context);
        Factory().showSnackbar(context, "Your Inquiry has submitted");
      }
    else if(code == ConstantManager.ENQUIRY_UNSUCCESS)
      {
        Factory().showSnackbar(context, message!);
      }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(context);
  }

}