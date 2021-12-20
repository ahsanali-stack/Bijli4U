
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/product_rating_request.dart';
import 'package:testproject/Models/Response/review_base_response.dart';


import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/Review/review_screen.dart';

class RateexperienceBloc implements ProgressDialogCodeListener {
  BuildContext _context;

  RateexperienceBloc(this._context);


  addProductRating(ProductRatingRequest request) =>
      DataProvider().addProductRating(_context,this,request);

  //Callback methods
  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);
      Navigator.pop(_context);
    if (code == ConstantManager.ALL_ITEM_SUCCESS) {

    } else if (code == ConstantManager.ALL_ITEM_UNSUCCESS) {
      Factory().showSnackbar(_context, message!);
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(_context);
  }
}
