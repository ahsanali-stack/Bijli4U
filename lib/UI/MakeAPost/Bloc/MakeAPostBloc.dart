import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/sale_type_base_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class MakeAPostBloc implements ProgressDialogCodeListener {
  BuildContext context;

  MakeAPostBloc(this.context);

  final images = BehaviorSubject<List<XFile>>();
  final sale_type_base_response = BehaviorSubject<SaleTypeBaseResponse>();
  final sale_type_list = BehaviorSubject<List<Result>>();
  final sale_type = BehaviorSubject<Result>();

  //methods
  addImage(XFile file) {
    images.stream.value.add(file);
  }

  //
  getSaleTypeList() => DataProvider().getSaleType(context, this);

  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    if (code == ConstantManager.SALE_TYPE_SUCCESS) {
      if (data != null) {
        sale_type_base_response.sink.add(data as SaleTypeBaseResponse);
        if (sale_type_base_response.hasValue &&
            sale_type_base_response.stream.value.result!.length > 0) {
          sale_type_list.sink.add(sale_type_base_response.stream.value.result!);
          if (sale_type_list.hasValue && sale_type_list.value.length > 0) {
            List<String> list = [];
            for (int i = 0; i < sale_type_list.value.length; i++) {
              list.add(sale_type_list.stream.value[i].itemSaleTypeName!);
            }
            showListDialog(code, list);
          }
        }
      }
    } else if (code == ConstantManager.SALE_TYPE_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(context);
  }

  showListDialog(int code, List<String> list) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext _context) {
        final dialog = AlertDialog(
          title: Text("Select"),
          content: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(_context).pop();
                  // if (code == ConstantManager.SALE_TYPE_SUCCESS)
                    sale_type.sink.add(sale_type_list.value[index]);
                    print("Select ${sale_type.stream.value.itemSaleTypeName}");
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("${list[index]}"),
                ),
              );
            },
          ),
        );
        return dialog;
      },
    );
  }
}
