
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';

import 'package:testproject/Models/Response/all_item_base_response.dart'
as ITEM;

import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class BuyBloc implements ProgressDialogCodeListener {
  BuildContext _context;

  BuyBloc(this._context);


  //
  final allItemBaseResponse = BehaviorSubject<ITEM.AllItemBaseResponse>();
  final itemsList = BehaviorSubject<List<ITEM.Result>>();



  getAllItems(int item_sale_type_id,int user_id) =>
      DataProvider().getItemsByUser(_context, this, item_sale_type_id,user_id);

  //Callback methods
  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);

    if (code == ConstantManager.ALL_ITEM_SUCCESS) {
      if ((data as ITEM.AllItemBaseResponse).result!.length > 0) {
        allItemBaseResponse.sink.add(data as ITEM.AllItemBaseResponse);
        itemsList.sink.add(allItemBaseResponse.value.result!);
      }
    } else if (code == ConstantManager.ALL_ITEM_UNSUCCESS) {
      Factory().showSnackbar(_context, message!);
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(_context);
  }
}
