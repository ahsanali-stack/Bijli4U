import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/appliances_base_response.dart' as APPLIANCES;
import 'package:testproject/Models/Response/unit_base_respnse.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/LoadCalculator/item_load_calculator.dart';

class LoadCalculatorBloc implements ProgressDialogCodeListener{
  LoadCalculatorBloc(this.context);

  final BuildContext context;


  final item_list = BehaviorSubject<List<ItemWidget>>();
  late int item_index;
  late List<String> list;
  late List<String> appliances_list;



  removeItemAt(int index){
  List<ItemWidget> temp_list = item_list.stream.value;
    temp_list.removeAt(index);
    item_list.sink.add(temp_list);
  }

  getUnit() => DataProvider().getUnit(context, this);

  getAppliances() => DataProvider().getAppliances(context, this);

  getAppliancesAt(int index) {
    item_index = index;
    if(this.appliances_list != null && this.appliances_list.length>0)
      showListDialog(ConstantManager.APPLIANCES_SUCCESS, this.appliances_list);
    else
      getAppliances();
  }

  getUnitAt(int index){
    item_index = index;
    if(list != null && list.length>0)
      showListDialog(ConstantManager.UNIT_SUCCESS, list);
    else
      getUnit();
  }

  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing)
      Factory().dismissProgressDialog(context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing)
      Factory().dismissProgressDialog(context);

    if (ConstantManager.UNIT_SUCCESS == code) {
      if(data != null)
      {
        final _unitBaseRespnse = data as UnitBaseRespnse;
        if(_unitBaseRespnse != null && _unitBaseRespnse.result != null && _unitBaseRespnse.result!.length > 0)
        {
          List<Result> unit_list = _unitBaseRespnse.result!;
          if(unit_list!=null && unit_list.length > 0)
          {
            list = [];
            for (int i = 0; i < unit_list.length; i++) {
              list.add(unit_list[i].unitType!);
            }
          }
        }
      }
    }
    else if (ConstantManager.UNIT_UNSUCCESS == code) {
      Factory().showSnackbar(context, "Failure");
    }
    if (ConstantManager.APPLIANCES_SUCCESS == code) {
      if(data != null)
      {
        final appliances = data as APPLIANCES.AppliancesBaseResponse;
        if(appliances != null && appliances.result != null && appliances.result!.length > 0)
        {
          List<APPLIANCES.Result> appliances_list = appliances.result!;
          if(appliances_list!=null && appliances_list.length > 0)
          {
            this.appliances_list = [];
            for (int i = 0; i < appliances_list.length; i++) {
              this.appliances_list.add(appliances_list[i].applianceName!);
            }
          }
        }
      }
    }
    else if (ConstantManager.APPLIANCES_UNSUCCESS == code) {
      Factory().showSnackbar(context, "Failure");
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing)
      Factory().showProgressDialog(context);
  }

  showListDialog(int code, List<String> list) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext _context) {
        final dialog = AlertDialog(
          title: Text("Select"),
          content: Container(
            width: double.maxFinite,
            child:  ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(_context).pop();
                    if(code == ConstantManager.UNIT_SUCCESS)
                    {
                      item_list.stream.value[item_index].unit.sink.add(list[index]);
                    }
                    else if(code == ConstantManager.APPLIANCES_SUCCESS)
                    {
                      item_list.stream.value[item_index].appliance.sink.add(list[index]);
                    }
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

}