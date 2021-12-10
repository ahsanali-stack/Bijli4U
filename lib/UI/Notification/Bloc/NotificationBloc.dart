import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/notification_all_response.dart';
import 'package:observable/observable.dart' as OB;
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class NotificationBloc implements ProgressDialogCodeListener{
  late BuildContext context;
final _allNotificationsBaseResponse = BehaviorSubject<NotificationAllResponse>();
//Sink here
Stream<NotificationAllResponse> get allNoficationStream => _allNotificationsBaseResponse.stream;
StreamSink<NotificationAllResponse> get allNotificationSink => _allNotificationsBaseResponse.sink;

// get All Notification
getAllNofication() => DataProvider().getAllNotifications(context, this);

  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    if(code == ConstantManager.ALL_NOTIFICATION_SUCCESS)
    {
      // response = ;
      if((data as NotificationAllResponse).result!.length>0)
      {
        allNotificationSink.add(data as NotificationAllResponse);
      }
    }
    else if(code == ConstantManager.ALL_NOTIFICATION_UNSUCCESS)
    {
      Factory().showSnackbar(context, message!);
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(context);
}

  NotificationBloc(this.context);
}