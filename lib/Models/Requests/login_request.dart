/// User_Type_ID : "2"
/// Email : "Faizan1507c@gmail.com"
/// User_Name : "Faizan"
/// Password : "Faizi1212"
/// OS_Login : "Android"
/// Brand_Login : "Oppo"
/// Api_Level_Login : "Level 1"
/// Model_Login : "F Pro 11"
/// Imei : "151215524"

class LoginRequest {
  LoginRequest({
      required String userTypeID,
      required String email,
      required String userName,
      required String password,
      required String oSLogin,
      required String brandLogin,
      required String apiLevelLogin,
      required String modelLogin,
      required String imei,}){
    _userTypeID = userTypeID;
    _email = email;
    _userName = userName;
    _password = password;
    _oSLogin = oSLogin;
    _brandLogin = brandLogin;
    _apiLevelLogin = apiLevelLogin;
    _modelLogin = modelLogin;
    _imei = imei;
}

  LoginRequest.fromJson(dynamic json) {
    _userTypeID = json['User_Type_ID'];
    _email = json['Email'];
    _userName = json['User_Name'];
    _password = json['Password'];
    _oSLogin = json['OS_Login'];
    _brandLogin = json['Brand_Login'];
    _apiLevelLogin = json['Api_Level_Login'];
    _modelLogin = json['Model_Login'];
    _imei = json['Imei'];
  }
  late String _userTypeID;
  late String _email;
  late String _userName;
  late String _password;
  late String _oSLogin;
  late String _brandLogin;
  late String _apiLevelLogin;
  late String _modelLogin;
  late String _imei;

  String get userTypeID => _userTypeID;
  String get email => _email;
  String get userName => _userName;
  String get password => _password;
  String get oSLogin => _oSLogin;
  String get brandLogin => _brandLogin;
  String get apiLevelLogin => _apiLevelLogin;
  String get modelLogin => _modelLogin;
  String get imei => _imei;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_Type_ID'] = this._userTypeID;
    map['Email'] = this._email;
    map['User_Name'] = this._userName;
    map['Password'] = this._password;
    map['OS_Login'] = this._oSLogin;
    map['Brand_Login'] = this._brandLogin;
    map['Api_Level_Login'] = this._apiLevelLogin;
    map['Model_Login'] = this._modelLogin;
    map['Imei'] = this._imei;
    return map;
  }

}