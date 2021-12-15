import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/add_item_request.dart';
import 'package:testproject/Models/Response/brand_all_base_response.dart' as BRAND;
import 'package:testproject/Models/Response/category_all_base_reponse.dart' as CAT;
import 'package:testproject/Models/Response/sale_type_base_response.dart';
import 'package:testproject/Models/Response/sub_category_by_category_base_model.dart' as SUB;
import 'package:testproject/Models/Response/unit_base_respnse.dart' as UNIT;
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/MakeAPost/make_a_post_screen.dart';
import 'package:testproject/UI/Navigator/Bloc/MainScreenBloc.dart';
import 'package:testproject/UI/Navigator/main_screen.dart';

class MakeAPostBloc implements ProgressDialogCodeListener {
  BuildContext context;

  MakeAPostBloc(this.context);

  final images = BehaviorSubject<List<XFile>>();
  final base64_image_list = BehaviorSubject<List<String>>();
  final sale_type_base_response = BehaviorSubject<SaleTypeBaseResponse>();
  final sale_type_list = BehaviorSubject<List<Result>>();
  final sale_type = BehaviorSubject<Result>();
  //
  final category_all_base_response = BehaviorSubject<CAT.CategoryAllBaseReponse>();
  final category_list = BehaviorSubject<List<CAT.Result>>();
  final category_item = BehaviorSubject<CAT.Result>();
  //
  final sub_cat_base = BehaviorSubject<SUB.SubCategoryByCategoryBaseModel>();
  final sub_cat_list =  BehaviorSubject<List<SUB.Result>>();
  final sub_cat_item = BehaviorSubject<SUB.Result>();
  //
  final brand_all_base = BehaviorSubject<BRAND.BrandAllBaseResponse>();
  final brand_all_list = BehaviorSubject<List<BRAND.Result>>();
  final brand_item = BehaviorSubject<BRAND.Result>();
  //
  final unit_base_response = BehaviorSubject<UNIT.UnitBaseRespnse>();
  final unit_list = BehaviorSubject<List<UNIT.Result>>();
  final unit_item = BehaviorSubject<UNIT.Result>();


  //methods
  addImage(XFile file) {
    images.stream.value.add(file);
  }

  //
  getSaleTypeList() => DataProvider().getSaleType(context, this);
  //
  getCategoryAll() => DataProvider().getCategoryAll(context, this);
  //
  getSubCatByCat(cat_id) => DataProvider().getSubCatByCat(context, this, cat_id);
  //
  getBrandAll() => DataProvider().getBrandAll(context, this);
  //
  getUnit() => DataProvider().getUnit(context, this);
  //
  addItem(AddItemRequest request) => DataProvider().addItem(context, this, request);

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
    } else if(code == ConstantManager.ALl_CATEGORY_SUCCESS){
      if(data != null)
        {
          category_all_base_response.sink.add(data as CAT.CategoryAllBaseReponse);
          if(category_all_base_response.stream.hasValue && category_all_base_response.stream.value.result!.length > 0)
            {
              category_list.sink.add(category_all_base_response.stream.value.result!);
              if(category_list.stream.hasValue && category_list.stream.value.length > 0)
                {
                  List<String> list = [];
                  for (int i = 0; i < category_list.value.length; i++) {
                    list.add(category_list.stream.value[i].category!);
                  }
                  showListDialog(code, list);
                }
            }
        }
    }else if(code == ConstantManager.ALl_CATEGORY_UNSUCCESS){
      Factory().showSnackbar(context, message!);
    } else if(code == ConstantManager.SUB_CAT_SUCCESS){
      if(data != null)
      {
        sub_cat_base.sink.add(data as SUB.SubCategoryByCategoryBaseModel);
        if(sub_cat_base.stream.hasValue && sub_cat_base.stream.value.result!.length > 0)
        {
          sub_cat_list.sink.add(sub_cat_base.stream.value.result!);
          if(sub_cat_list.stream.hasValue && sub_cat_list.stream.value.length > 0)
          {
            List<String> list = [];
            for (int i = 0; i < sub_cat_list.value.length; i++) {
              list.add(sub_cat_list.stream.value[i].name!);
            }
            showListDialog(code, list);
          }
        }
      }
    }
    else if(code == ConstantManager.SUB_CAT_UNSUCCESS)
    {
      Factory().showSnackbar(context, message!);
    }else if(code == ConstantManager.BRAND_ALL_SUCCESS){
      if(data != null)
      {
        brand_all_base.sink.add(data as BRAND.BrandAllBaseResponse);
        if(brand_all_base.stream.hasValue && brand_all_base.stream.value.result!.length > 0)
        {
          brand_all_list.sink.add(brand_all_base.stream.value.result!);
          if(brand_all_list.stream.hasValue && brand_all_list.stream.value.length > 0)
          {
            List<String> list = [];
            for (int i = 0; i < brand_all_list.value.length; i++) {
              list.add(brand_all_list.stream.value[i].brandName!);
            }
            showListDialog(code, list);
          }
        }
      }
    }
    else if(code == ConstantManager.BRAND_ALL_UNSUCCESS)
    {
      Factory().showSnackbar(context, message!);
    }else if(code == ConstantManager.UNIT_SUCCESS){
      if(data != null)
      {
        unit_base_response.sink.add(data as UNIT.UnitBaseRespnse);
        if(unit_base_response.stream.hasValue && unit_base_response.stream.value.result!.length > 0)
        {
          unit_list.sink.add(unit_base_response.stream.value.result!);
          if(unit_list.stream.hasValue && unit_list.stream.value.length > 0)
          {
            List<String> list = [];
            for (int i = 0; i < unit_list.value.length; i++) {
              list.add(unit_list.stream.value[i].unitType!);
            }
            showListDialog(code, list);
          }
        }
      }
    }
    else if(code == ConstantManager.UNIT_UNSUCCESS)
    {
      Factory().showSnackbar(context, message!);
    }
    else if(code == ConstantManager.ADD_ITEM_SUCCESS)
    {
      Factory().showSnackbar(context, "Done");
      
      MainScreen.bloc.pages.stream.value.removeAt(2);
      MainScreen.bloc.pages.stream.value.insert(2, MakePost());
      // MainScreen.bloc.pages.sink.add(list);
      MainScreen.bloc.current_index.sink.add(0);

      
    }else if(code == ConstantManager.ADD_ITEM_UNSUCCESS)
    {
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
                  if (code == ConstantManager.SALE_TYPE_SUCCESS)
                    {
                      sale_type.sink.add(sale_type_list.value[index]);
                      print("Select ${sale_type.stream.value.itemSaleTypeName}");
                    }
                  else if(code == ConstantManager.ALl_CATEGORY_SUCCESS) {
                    category_item.sink.add(category_list.stream.value[index]);
                  }
                  else if(code == ConstantManager.SUB_CAT_SUCCESS)
                    {
                      sub_cat_item.sink.add(sub_cat_list.stream.value[index]);
                    }
                  else if(code == ConstantManager.BRAND_ALL_SUCCESS)
                  {
                    brand_item.sink.add(brand_all_list.stream.value[index]);
                  }
                  else if(code == ConstantManager.UNIT_SUCCESS)
                  {
                    unit_item.sink.add(unit_list.stream.value[index]);
                  }
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
