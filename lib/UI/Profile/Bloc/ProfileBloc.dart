import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/update_profile_request.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/Models/Response/update_profile_base_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:testproject/UI/Navigator/main_screen.dart';

class ProfileBloc implements ProgressDialogCodeListener{
  ProfileBloc(this.context);
  BuildContext context;

  final userProfile = BehaviorSubject<UserProfile>();
  final isEnable = BehaviorSubject<bool>();
  late UpdateProfileRequest temp_model;


  updateProfile(UpdateProfileRequest request){
    temp_model = request;
    DataProvider().updateProfile(context, this, request);
  }


  @override
  void onDismiss(String? error) {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    Factory().showSnackbar(context, error!);


  }

  @override
  void onHide(int code, String? message, Object data) async {
    if (ConstantManager.isShowing) Factory().dismissProgressDialog(context);

    if(code == ConstantManager.PROFILE_SUCCESS){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      LoginResponse? loginResponse = Factory().getLoginResponse(prefs);
      loginResponse!.result!.userProfile!.firstName = temp_model.firstName;
      loginResponse.result!.userProfile!.lastName = temp_model.lastName;
      loginResponse.result!.userProfile!.mobileNumber = temp_model.mobileNumber;
        loginResponse.result!.userProfile!.image = (data as UpdateProfileBaseResponse).result!.image;
      //
      Factory().updateUserProfile(loginResponse,prefs);
      //
      Factory().finishScreenCompletely(context, () => HomeScreen(4));
    }
    else if(code == ConstantManager.PROFILE_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    }


  }

  @override
  void onShow() {
    if (!ConstantManager.isShowing) Factory().showProgressDialog(context);
  }

}