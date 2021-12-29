import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/Models/Requests/add_item_request.dart';
import 'package:testproject/Models/Requests/login_request.dart';
import 'package:testproject/Models/Requests/product_rating_request.dart';
import 'package:testproject/Models/Requests/registration_request.dart';
import 'package:testproject/Models/Requests/update_profile_request.dart';
import 'package:testproject/Models/Response/all_item_base_response.dart';
import 'package:testproject/Models/Response/appliances_base_response.dart';
import 'package:testproject/Models/Response/base_response.dart';
import 'package:testproject/Models/Response/brand_all_base_response.dart';
import 'package:testproject/Models/Response/category_all_base_reponse.dart';
import 'package:testproject/Models/Response/category_base_response.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/Models/Response/notification_all_response.dart';
import 'package:testproject/Models/Response/registration_response.dart';
import 'package:testproject/Models/Response/review_base_response.dart';
import 'package:testproject/Models/Response/sale_type_base_response.dart';
import 'package:testproject/Models/Response/sub_category_by_category_base_model.dart';
import 'package:testproject/Models/Response/unit_base_respnse.dart';
import 'package:testproject/Models/Requests/add_enquiry.dart';
import 'package:testproject/Models/Response/update_profile_base_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

import '../Models/Response/advertisement_all_base_response.dart';

class DataProvider {
  void sign_up(
      BuildContext _context,
      ProgressDialogCodeListener _progressDialogCodeListener,
      RegistrationRequest _request) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(_context, "No Connectivity");
      return;
    }

    if (_progressDialogCodeListener != null)
      _progressDialogCodeListener.onShow();

    // final response = await http.post(
    //   Uri.parse(ConstantManager.base_url + "User/SystemUserRegistration"),
    //   // headers: <String, String>{
    //   //   'Content-Type': 'application/json; charset=UTF-8',
    //   // },
    //   body: _request.toJson(),
    // );
    var dio = Dio(Factory().getDioOption());
    final response = await dio.request('User/SystemUserRegistration',
        options: Options(method: 'POST'), data: _request.toJson());

    if (response.statusCode == 200) {
      // then parse the JSON.
      RegistrationResponse res = RegistrationResponse.fromJson(response.data);
      if (res.response!.responseCode == 0)
        _progressDialogCodeListener.onHide(
            ConstantManager.SIGN_UP_SUCCESS, "Success", Null);
      else if (res.response!.responseCode == 1)
        _progressDialogCodeListener.onHide(ConstantManager.SIGN_UP_UNSUCCESS,
            "${res.response!.responseMessage}", Null);
    } else {
      // then throw an exception.
      _progressDialogCodeListener.onDismiss("error");
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void sign_in(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      LoginRequest request) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.post(
    //   Uri.parse(ConstantManager.base_url + "User/SystemUserLogin"),
    //   // headers: <String, String>{
    //   //   'Content-Type': 'application/json; charset=UTF-8',
    //   // },
    //   body: request.toJson(),
    // );

    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('User/SystemUserLogin',
        options: Options(method: 'POST'), data: request.toJson());

    if (response.statusCode == 200) {
      // then parse the JSON.
      LoginResponse res = LoginResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.SIGN_IN_SUCCESS, "Success", Null);
        //save user model
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(ConstantManager.USER_MODEL, jsonEncode(res));
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.SIGN_IN_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getAllNotifications(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetNotificationtAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'MemberShipAccount/SystemGetNotificationtAll',
      options: Options(method: 'GET'),
    );

    if (response.statusCode == 200) {
      // then parse the JSON.
      NotificationAllResponse res =
          NotificationAllResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_NOTIFICATION_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_NOTIFICATION_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getAllAdvertisement(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'MemberShipAccount/SystemGetAdvertisementAll',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      AdvertisementAllBaseResponse res =
          AdvertisementAllBaseResponse.fromJson(response.data);
      if (res.response != null && res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_AD_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ALL_AD_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getCategory(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemCategory',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      CategoryBaseResponse res = CategoryBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALl_CATEGORY_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.ALl_CATEGORY_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getAllItems(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      int item_sale_type_id) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemGetAllItem',
        options: Options(method: 'POST'),
        data: {"Item_Sale_Type_ID": item_sale_type_id});
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      AllItemBaseResponse res = AllItemBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_ITEM_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ALL_ITEM_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getAllItemsByCategory(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      int item_sale_type_id,
      int category_id) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemGetAllItemByCategory',
        options: Options(method: 'POST'),
        data: {
          "Item_Sale_Type_ID": item_sale_type_id,
          "Category_ID": category_id
        });
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      AllItemBaseResponse res = AllItemBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_ITEM_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ALL_ITEM_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getSaleType(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    final response = await dio.request(
      'Item/SystemGetItemsSaleType',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      SaleTypeBaseResponse res = SaleTypeBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.SALE_TYPE_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.SALE_TYPE_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getCategoryAll(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    // final response = await http.get(
    //   Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemCategoryAll',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      CategoryAllBaseReponse res =
          CategoryAllBaseReponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALl_CATEGORY_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.ALl_CATEGORY_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getSubCatByCat(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener, int cat_id) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());

    final response = await dio.request(
      'Item/SystemSubCategorybyCategory',
      options: Options(method: 'POST'),
      data: {"Category_ID": "1"},
    );


    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      SubCategoryByCategoryBaseModel res =
      SubCategoryByCategoryBaseModel.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.SUB_CAT_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.SUB_CAT_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          // RegistrationResponse.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getBrandAll(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemBrandAll',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      BrandAllBaseResponse res =
      BrandAllBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.BRAND_ALL_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.BRAND_ALL_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getUnit(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemGetUnit',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      UnitBaseRespnse res =
      UnitBaseRespnse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.UNIT_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.UNIT_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> addItem(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,AddItemRequest request) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemAddItem',
      options: Options(method: 'POST'),
      data: request.toJson()
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      UnitBaseRespnse res =
      UnitBaseRespnse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ADD_ITEM_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.ADD_ITEM_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getItemsByUser(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      int item_sale_type_id,int user_id) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

  //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemGetAllItem',
        options: Options(method: 'POST'),
        data: {
          "Item_Sale_Type_ID":item_sale_type_id,
          "User_ID":user_id
        });
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      AllItemBaseResponse res = AllItemBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_ITEM_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ALL_ITEM_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void getRatingListByUser(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      int user_id) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemGetAllItemsRatingByUser',
        options: Options(method: 'POST'),
        data: {
          "User_ID":user_id
        });
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      ReviewBaseResponse res = ReviewBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_ITEM_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ALL_ITEM_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void addProductRating(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      ProductRatingRequest request) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemAddProductRating',
        options: Options(method: 'POST'),
        data: request.toJson());
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      ReviewBaseResponse res = ReviewBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.RATING_SUCCESS, "Success", Null);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.RATING_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  Future<void> getAppliances(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request(
      'Item/SystemGetAppliances',
      options: Options(method: 'GET'),
    );
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      AppliancesBaseResponse res =
      AppliancesBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.APPLIANCES_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.APPLIANCES_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void addEnquiry(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      AddEnquiry request) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('Item/SystemAddEnquiry',
        options: Options(method: 'POST'),
        data: request.toJson());
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      BaseResponse res = BaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ENQUIRY_SUCCESS, "Success", Null);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.ENQUIRY_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }

  void updateProfile(
      BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener,
      UpdateProfileRequest request) async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Factory().showSnackbar(context, "No Connectivity");
      return;
    }

    if (progressDialogCodeListener != null) progressDialogCodeListener.onShow();

    //
    var dio = Dio(Factory().getDioOption());
    // await Future.wait([dio.post('/info'), dio.get('/token')]);
    final response = await dio.request('User/SystemAddUserProfile',
        options: Options(method: 'POST'),
        data: request.toJson());
    print("Data Here:" + response.data.toString());

    if (response.statusCode == 200) {
      // then parse the JSON.
      UpdateProfileBaseResponse res = UpdateProfileBaseResponse.fromJson(response.data);
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.PROFILE_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(ConstantManager.PROFILE_UNSUCCESS,
            res.response!.responseMessage, Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.statusMessage!);
    }
  }
}
