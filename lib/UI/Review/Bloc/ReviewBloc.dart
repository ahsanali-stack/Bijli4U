
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/review_base_response.dart';


import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class ReviewBloc implements ProgressDialogCodeListener {
  BuildContext _context;

  ReviewBloc(this._context);


  //
  final allItemBaseResponse = BehaviorSubject<ReviewBaseResponse>();
  final itemsList = BehaviorSubject<List<Result>>();



  getRatingByUser(int user_id) =>
      DataProvider().getRatingListByUser(_context,this,user_id);

  //Callback methods
  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);

    if (code == ConstantManager.ALL_ITEM_SUCCESS) {
      if ((data as ReviewBaseResponse).result!.length > 0) {
        allItemBaseResponse.sink.add(data as ReviewBaseResponse);
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
