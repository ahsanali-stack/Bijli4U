import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/Models/Requests/login_request.dart';
import 'package:testproject/Models/Requests/registration_request.dart';
import 'package:testproject/Models/Response/adevertisement_all_base_reponse.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/Models/Response/notification_all_response.dart';
import 'package:testproject/Models/Response/registration_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

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

    final response = await http.post(
      Uri.parse(ConstantManager.base_url + "User/SystemUserRegistration"),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: _request.toJson(),
    );

    if (response.statusCode == 200) {
      // then parse the JSON.
      RegistrationResponse res =
          RegistrationResponse.fromJson(jsonDecode(response.body));
      if (res.response!.responseCode == 0)
        _progressDialogCodeListener.onHide(
            ConstantManager.SIGN_UP_SUCCESS, "Success", Null);
      else if (res.response!.responseCode == 1)
        _progressDialogCodeListener.onHide(ConstantManager.SIGN_UP_UNSUCCESS,
            "${res.response!.responseMessage}", Null);
    } else {
      // then throw an exception.
      _progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
          RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.body);
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

    final response = await http.post(
      Uri.parse(ConstantManager.base_url + "User/SystemUserLogin"),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      // then parse the JSON.
      LoginResponse res = LoginResponse.fromJson(jsonDecode(response.body));
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
          throw Exception('Failed to create.' + response.body);
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

    final response = await http.get(
      Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetNotificationtAll"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // then parse the JSON.
      NotificationAllResponse res =
          NotificationAllResponse.fromJson(jsonDecode(response.body));
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
          throw Exception('Failed to create.' + response.body);
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

    final response = await http.get(
      Uri.parse(ConstantManager.base_url + "MemberShipAccount/SystemGetAdvertisementAll"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // then parse the JSON.
      AdevertisementAllBaseReponse res =
      AdevertisementAllBaseReponse.fromJson(jsonDecode(response.body));
      if (res.response!.responseCode == 0) {
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_AD_SUCCESS, "Success", res);
      } else if (res.response!.responseCode == 1)
        progressDialogCodeListener.onHide(
            ConstantManager.ALL_AD_UNSUCCESS,
            res.response!.responseMessage,
            Null);
    } else {
      // then throw an exception.
      progressDialogCodeListener.onDismiss("error");
      RegistrationResponse res =
      // RegistrationResponse.fromJson(jsonDecode(response.body));
      throw Exception('Failed to create.' + response.body);
    }
  }


}
