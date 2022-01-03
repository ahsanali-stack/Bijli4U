import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

import '../ConstantManager/ConstantManager.dart';

class Factory {

  changeScreenWithDelay(BuildContext context, Widget Function() screen, int timeInSeconds) {
    Timer(Duration(seconds: timeInSeconds),()=>{
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (BuildContext context) { return screen(); }))
    });

  }

  finishScreenCompletely(BuildContext context, Widget Function() screen) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => screen()),
        (route) => false);
  }

  is_validated_fields(BuildContext context, List<String> list) {
    for (var value in list) {
      if (value == null && value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Empty Field's"),
        ));
        return false;
      }
    }
    return true;
  }

  changeScreen(BuildContext context, Widget Function() screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen()),
    );
  }

  getHeightOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  getWidthOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  isValidEmail(email) {
    RegExp regEx = RegExp(ConstantManager.emailPattern);
    if (regEx.hasMatch(email!)) {
      return true;
    }
    // else
    //   {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text("Please enter a valid email address"),
    //     ));
    //   }
    return false;
  }

  // ProgressDialog getProgressDialog(BuildContext context,message){
  //   ProgressDialog pr = ProgressDialog(context);
  //   pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
  //   pr.style(
  //       progressWidget: CircularProgressIndicator(),
  //     message: message,
  //
  //   );
  //
  //   return pr;
  // }

  Future<bool> is_connectivity_available(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // Factory().showSnackbar(context, "Mobile");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // Factory().showSnackbar(context, "Mobile");
      return true;
    } else {
      // Factory().showSnackbar(context, "Nothing");
      return false;
    }
  }

  showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  bool isAndroid(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android)
      return true;
    else
      return false;
  }

  bool isIos(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS)
      return true;
    else
      return false;
  }

  Future<void> getModel(BuildContext context, String model) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');
    model = androidInfo.model;
  }

  Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  get_string_date_from_unix(int time_in_seconds) {
    final f = new DateFormat('dd-MM-yyyy');

    return f
        .format(DateTime.fromMillisecondsSinceEpoch(time_in_seconds * 1000));
  }

  String get_image_url(String url) {
    return "${ConstantManager.image_base_url}${url}";
  }

  getDioOption() {
    return BaseOptions(
      baseUrl: ConstantManager.base_url,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
  }

  Future<void> showProgressDialog(BuildContext context) async {
    ConstantManager.isShowing = true;
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        final dialog = AlertDialog(
          content: SingleChildScrollView(
            child: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Please wait",
                    style: TextStyle(
                      color: Color(colors.color_primary),
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        return dialog;
      },
    );
  }

  dismissProgressDialog(BuildContext context) {
    ConstantManager.isShowing = false;
    Navigator.of(context).pop();
  }

  showImageDialog(BuildContext context,
      ProgressDialogCodeListener progressDialogCodeListener) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext _context) {
        final dialog = AlertDialog(
          title: Text("Select"),
          content: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(_context).pop();
                    getFromCamera(context, progressDialogCodeListener);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Camera"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(_context).pop();
                    getFromGallery(context, progressDialogCodeListener);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Gallery"),
                  ),
                )
              ],
            ),
          ),
        );
        return dialog;
      },
    );
  }

  getFromGallery(
      BuildContext context, ProgressDialogCodeListener listener) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      listener.onHide(ConstantManager.IMAGE_SUCCESS, "SUCCESS", image);
      // File? imageFile = File(pickedFile.path);
    } else {
      listener.onHide(
          ConstantManager.IMAGE_UNSUCCESS, "Error while capturing image", Null);
    }
  }

  getFromCamera(
      BuildContext context, ProgressDialogCodeListener listener) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      listener.onHide(ConstantManager.IMAGE_SUCCESS, "SUCCESS", image);
      // File? imageFile = File(pickedFile.path);
    } else {
      listener.onHide(
          ConstantManager.IMAGE_UNSUCCESS, "Error while capturing image", Null);
    }
  }

  getUserModel(SharedPreferences prefs) {
    String? value = prefs.getString(ConstantManager.USER_MODEL);
    var res;
    if (value != null)
      {
        res = LoginResponse.fromJson(jsonDecode(value));
      }

    return res != null ? res.result!.userProfile! : null;
  }

  getLoginResponse(SharedPreferences prefs) {
    String? value = prefs.getString(ConstantManager.USER_MODEL);
    LoginResponse res = LoginResponse.fromJson(jsonDecode(value!));
    return res != null ? res : null;
  }

  getController(String value) {
    TextEditingController controller = TextEditingController();
    controller.text = value;
    return controller;
  }

  void updateUserProfile(LoginResponse loginResponse, SharedPreferences prefs) {
    prefs.setString(ConstantManager.USER_MODEL, jsonEncode(loginResponse));
  }

  Future<bool> isLocationPermissionGranted() async{
    var _permissionGranted = await Location().hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await Location().requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<bool> isLocationServiceEnable() async{
    var _serviceEnabled = await Location().serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Location().requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    return true;
  }
}
