import 'dart:async';

import 'package:flutter/cupertino.dart';
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
  final categoryList = PublishSubject<List<CAT.Result>>();
  //
  final allItemBaseResponse = BehaviorSubject<ITEM.AllItemBaseResponse>();
  final itemsList = BehaviorSubject<List<ITEM.Result>>();

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
        categoryList.sink.add(categoryAllBaseResponse.stream.value.result!);
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
    showingSink.add(true);
  }
}