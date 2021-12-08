import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/registration_request.dart';
import 'package:testproject/Models/Response/registration_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/Launcher/launcher_screen.dart';
import 'package:testproject/UI/main_screen.dart';

class SignUpBloc implements ProgressDialogCodeListener{
  late BuildContext _context;
  SignUpBloc(this._context);
  final _showing = BehaviorSubject<bool>();
  Stream<bool> get showingStream => _showing.stream;
  StreamSink<bool> get showingSink => _showing.sink;
  //
  final _signUpReponse = BehaviorSubject<RegistrationResponse>();
  Stream<RegistrationResponse> get baseReponseStream => _signUpReponse.stream;
  StreamSink<RegistrationResponse> get baseResponseSink => _signUpReponse.sink;


  //sign method
  signUp(RegistrationRequest request) => DataProvider().sign_up(_context, this, request);




  @override
  void onDismiss(String? error) {
    showingSink.add(false);
  }

  @override
  void onHide(int code, String? message, Object data) {
    showingSink.add(false);

    if (code == ConstantManager.SIGN_UP_SUCCESS) {
      Factory().finishScreenCompletely(_context, () => LauncherScreen());
    } else if (code == ConstantManager.SIGN_UP_UNSUCCESS) {
      // _finishActivity.add(false);
      Factory().showSnackbar(_context, message!);
    }
  }

  @override
  void onShow() {
    showingSink.add(true);

  }
}