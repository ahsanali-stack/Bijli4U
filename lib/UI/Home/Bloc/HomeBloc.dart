import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/advertisement_all_base_response.dart' as AD;
import 'package:testproject/Models/Response/all_item_base_response.dart' as ITEM;
import 'package:testproject/Models/Response/category_all_base_reponse.dart' as CAT;
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class HomeBloc implements ProgressDialogCodeListener{
  BuildContext _context;
  HomeBloc(this._context);

  final _showing = BehaviorSubject<bool>();
  Stream<bool> get showingStream => _showing.stream;
  StreamSink<bool> get showingSink => _showing.sink;
  //
  final advertisementAllBaseResponse = BehaviorSubject<AD.AdvertisementAllBaseResponse>();
  final advertisementList = BehaviorSubject<List<AD.Result>>();
  //
  final categoryAllBaseResponse = BehaviorSubject<CAT.CategoryAllBaseReponse>();
  final categoryList = BehaviorSubject<List<CAT.Result>>();
  //
  final allItemBaseResponse = BehaviorSubject<ITEM.AllItemBaseResponse>();
  final itemsList = BehaviorSubject<List<ITEM.Result>>();
  //
  final mIndex = BehaviorSubject<int>();
  final toggleIndex = BehaviorSubject<int>();

  //methods here
  getAllAdvertisement() => DataProvider().getAllAdvertisement(_context, this);
  getAllCategory() => DataProvider().getCategoryAll(_context, this);
  getAllItems(int item_sale_type_id) => DataProvider().getAllItems(_context, this, item_sale_type_id);
  getItemByCategory(int item_sale_type_id,int category_id) => DataProvider().getAllItemsByCategory(_context, this, item_sale_type_id, category_id);

  //Callback methods
  @override
  void onDismiss(String? error) {
    showingSink.add(false);
  }

  @override
  void onHide(int code, String? message, Object data) {
    showingSink.add(false);

    if (code == ConstantManager.ALL_AD_SUCCESS) {
      if ((data as AD.AdvertisementAllBaseResponse).result!.length > 0) {
        advertisementAllBaseResponse.sink.add(data as AD.AdvertisementAllBaseResponse);
        advertisementList.sink.add(advertisementAllBaseResponse.stream.value.result!);
      }
    } else if (code == ConstantManager.ALL_AD_UNSUCCESS) {
      Factory().showSnackbar(_context, message!);
    }
    else if (code == ConstantManager.ALl_CATEGORY_SUCCESS) {
      if ((data as CAT.CategoryAllBaseReponse).result!.length > 0) {
        categoryAllBaseResponse.sink.add(data as CAT.CategoryAllBaseReponse);
        List<CAT.Result> catList = [];
        catList.add(CAT.Result(categoryID:0,category:"All",createdBy:null,createdDate:"",active:true,deleted:false,lastUpdatedDate: "",lastUpdatedBy: ""));
        catList.addAll(categoryAllBaseResponse.stream.value.result!);
        categoryList.sink.add(catList);
      }
    }
    else if (code == ConstantManager.ALl_CATEGORY_UNSUCCESS) {
      Factory().showSnackbar(_context, message!);
    }
    else if (code == ConstantManager.ALL_ITEM_SUCCESS) {
      if ((data as ITEM.AllItemBaseResponse).result!.length > 0) {
        allItemBaseResponse.sink.add(data as ITEM.AllItemBaseResponse);
        itemsList.sink.add(allItemBaseResponse.value.result!);

      }
    }
    else if (code == ConstantManager.ALL_ITEM_UNSUCCESS) {
      Factory().showSnackbar(_context, message!);
    }
  }

  @override
  void onShow() {
    // showingSink.add(true);

    _showMyDialog();

  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}