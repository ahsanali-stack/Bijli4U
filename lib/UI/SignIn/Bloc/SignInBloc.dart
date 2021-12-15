import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/login_request.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

import '../../Navigator/main_screen.dart';

class SignInBloc implements ProgressDialogCodeListener{
  BuildContext _context;
  final _loginResponse = BehaviorSubject<LoginResponse>();
  Stream<LoginResponse> get loginStream => _loginResponse.stream;
  StreamSink<LoginResponse> get loginSink => _loginResponse.sink;

  signIn(LoginRequest request) => DataProvider().sign_in(_context, this, request);




  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(_context);

    if(code == ConstantManager.SIGN_IN_SUCCESS)
    {
      Factory().finishScreenCompletely(_context, () => HomeScreen());
    }
    else if(code == ConstantManager.SIGN_IN_UNSUCCESS)
    {
      Factory().showSnackbar(_context, message!);
    }
  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(_context);
  }

  SignInBloc(this._context);
}