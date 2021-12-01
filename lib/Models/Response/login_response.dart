/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : {"VersionDetails":null,"Menus":{"dashboard":null,"Approval":null,"pages":null},"UserProfile":{"User_ID":2,"User_Name":"Faizan Indivial","First_Name":"Faizan","Middle_Name":"Anwer","Last_Name":"Ali","Mobile_Number":"03132870236","Whatapp_Number":"03132870236","DOB":"2021-05-17T00:00:00","Email":"Faizan1507c@gmail.com","Account_Level_ID":1,"Account_Level":"Selver","Certification":null,"Emergency_Contact":null,"Facebook_Link":null,"Image":"/Documents/2/image_10012021_035900PM_803.jpg","LinkIn_Profile_Link":null,"Location":null,"Rating":null,"Religious":null,"Status":"Active User","Twitter_Link":null,"YouTube_Profile":null,"User_Type_ID":2,"User_Type":"Mobile","Registration_Date":null,"CompanyProfile":null},"UserName":"Faizan Indivial"}

class LoginResponse {
  LoginResponse({
      Response? response, 
      Result? result,}){
    _response = response;
    _result = result;
}

  LoginResponse.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  Response? _response;
  Result? _result;

  Response? get response => _response;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// VersionDetails : null
/// Menus : {"dashboard":null,"Approval":null,"pages":null}
/// UserProfile : {"User_ID":2,"User_Name":"Faizan Indivial","First_Name":"Faizan","Middle_Name":"Anwer","Last_Name":"Ali","Mobile_Number":"03132870236","Whatapp_Number":"03132870236","DOB":"2021-05-17T00:00:00","Email":"Faizan1507c@gmail.com","Account_Level_ID":1,"Account_Level":"Selver","Certification":null,"Emergency_Contact":null,"Facebook_Link":null,"Image":"/Documents/2/image_10012021_035900PM_803.jpg","LinkIn_Profile_Link":null,"Location":null,"Rating":null,"Religious":null,"Status":"Active User","Twitter_Link":null,"YouTube_Profile":null,"User_Type_ID":2,"User_Type":"Mobile","Registration_Date":null,"CompanyProfile":null}
/// UserName : "Faizan Indivial"

class Result {
  Result({
      dynamic versionDetails, 
      Menus? menus, 
      UserProfile? userProfile, 
      String? userName,}){
    _versionDetails = versionDetails;
    _menus = menus;
    _userProfile = userProfile;
    _userName = userName;
}

  Result.fromJson(dynamic json) {
    _versionDetails = json['VersionDetails'];
    _menus = json['Menus'] != null ? Menus.fromJson(json['Menus']) : null;
    _userProfile = json['UserProfile'] != null ? UserProfile.fromJson(json['UserProfile']) : null;
    _userName = json['UserName'];
  }
  dynamic _versionDetails;
  Menus? _menus;
  UserProfile? _userProfile;
  String? _userName;

  dynamic get versionDetails => _versionDetails;
  Menus? get menus => _menus;
  UserProfile? get userProfile => _userProfile;
  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VersionDetails'] = _versionDetails;
    if (_menus != null) {
      map['Menus'] = _menus?.toJson();
    }
    if (_userProfile != null) {
      map['UserProfile'] = _userProfile?.toJson();
    }
    map['UserName'] = _userName;
    return map;
  }

}

/// User_ID : 2
/// User_Name : "Faizan Indivial"
/// First_Name : "Faizan"
/// Middle_Name : "Anwer"
/// Last_Name : "Ali"
/// Mobile_Number : "03132870236"
/// Whatapp_Number : "03132870236"
/// DOB : "2021-05-17T00:00:00"
/// Email : "Faizan1507c@gmail.com"
/// Account_Level_ID : 1
/// Account_Level : "Selver"
/// Certification : null
/// Emergency_Contact : null
/// Facebook_Link : null
/// Image : "/Documents/2/image_10012021_035900PM_803.jpg"
/// LinkIn_Profile_Link : null
/// Location : null
/// Rating : null
/// Religious : null
/// Status : "Active User"
/// Twitter_Link : null
/// YouTube_Profile : null
/// User_Type_ID : 2
/// User_Type : "Mobile"
/// Registration_Date : null
/// CompanyProfile : null

class UserProfile {
  UserProfile({
      int? userID, 
      String? userName, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? mobileNumber, 
      String? whatappNumber, 
      String? dob, 
      String? email, 
      int? accountLevelID, 
      String? accountLevel, 
      dynamic certification, 
      dynamic emergencyContact, 
      dynamic facebookLink, 
      String? image, 
      dynamic linkInProfileLink, 
      dynamic location, 
      dynamic rating, 
      dynamic religious, 
      String? status, 
      dynamic twitterLink, 
      dynamic youTubeProfile, 
      int? userTypeID, 
      String? userType, 
      dynamic registrationDate, 
      dynamic companyProfile,}){
    _userID = userID;
    _userName = userName;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _whatappNumber = whatappNumber;
    _dob = dob;
    _email = email;
    _accountLevelID = accountLevelID;
    _accountLevel = accountLevel;
    _certification = certification;
    _emergencyContact = emergencyContact;
    _facebookLink = facebookLink;
    _image = image;
    _linkInProfileLink = linkInProfileLink;
    _location = location;
    _rating = rating;
    _religious = religious;
    _status = status;
    _twitterLink = twitterLink;
    _youTubeProfile = youTubeProfile;
    _userTypeID = userTypeID;
    _userType = userType;
    _registrationDate = registrationDate;
    _companyProfile = companyProfile;
}

  UserProfile.fromJson(dynamic json) {
    _userID = json['User_ID'];
    _userName = json['User_Name'];
    _firstName = json['First_Name'];
    _middleName = json['Middle_Name'];
    _lastName = json['Last_Name'];
    _mobileNumber = json['Mobile_Number'];
    _whatappNumber = json['Whatapp_Number'];
    _dob = json['DOB'];
    _email = json['Email'];
    _accountLevelID = json['Account_Level_ID'];
    _accountLevel = json['Account_Level'];
    _certification = json['Certification'];
    _emergencyContact = json['Emergency_Contact'];
    _facebookLink = json['Facebook_Link'];
    _image = json['Image'];
    _linkInProfileLink = json['LinkIn_Profile_Link'];
    _location = json['Location'];
    _rating = json['Rating'];
    _religious = json['Religious'];
    _status = json['Status'];
    _twitterLink = json['Twitter_Link'];
    _youTubeProfile = json['YouTube_Profile'];
    _userTypeID = json['User_Type_ID'];
    _userType = json['User_Type'];
    _registrationDate = json['Registration_Date'];
    _companyProfile = json['CompanyProfile'];
  }
  int? _userID;
  String? _userName;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _mobileNumber;
  String? _whatappNumber;
  String? _dob;
  String? _email;
  int? _accountLevelID;
  String? _accountLevel;
  dynamic _certification;
  dynamic _emergencyContact;
  dynamic _facebookLink;
  String? _image;
  dynamic _linkInProfileLink;
  dynamic _location;
  dynamic _rating;
  dynamic _religious;
  String? _status;
  dynamic _twitterLink;
  dynamic _youTubeProfile;
  int? _userTypeID;
  String? _userType;
  dynamic _registrationDate;
  dynamic _companyProfile;

  int? get userID => _userID;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get mobileNumber => _mobileNumber;
  String? get whatappNumber => _whatappNumber;
  String? get dob => _dob;
  String? get email => _email;
  int? get accountLevelID => _accountLevelID;
  String? get accountLevel => _accountLevel;
  dynamic get certification => _certification;
  dynamic get emergencyContact => _emergencyContact;
  dynamic get facebookLink => _facebookLink;
  String? get image => _image;
  dynamic get linkInProfileLink => _linkInProfileLink;
  dynamic get location => _location;
  dynamic get rating => _rating;
  dynamic get religious => _religious;
  String? get status => _status;
  dynamic get twitterLink => _twitterLink;
  dynamic get youTubeProfile => _youTubeProfile;
  int? get userTypeID => _userTypeID;
  String? get userType => _userType;
  dynamic get registrationDate => _registrationDate;
  dynamic get companyProfile => _companyProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_ID'] = _userID;
    map['User_Name'] = _userName;
    map['First_Name'] = _firstName;
    map['Middle_Name'] = _middleName;
    map['Last_Name'] = _lastName;
    map['Mobile_Number'] = _mobileNumber;
    map['Whatapp_Number'] = _whatappNumber;
    map['DOB'] = _dob;
    map['Email'] = _email;
    map['Account_Level_ID'] = _accountLevelID;
    map['Account_Level'] = _accountLevel;
    map['Certification'] = _certification;
    map['Emergency_Contact'] = _emergencyContact;
    map['Facebook_Link'] = _facebookLink;
    map['Image'] = _image;
    map['LinkIn_Profile_Link'] = _linkInProfileLink;
    map['Location'] = _location;
    map['Rating'] = _rating;
    map['Religious'] = _religious;
    map['Status'] = _status;
    map['Twitter_Link'] = _twitterLink;
    map['YouTube_Profile'] = _youTubeProfile;
    map['User_Type_ID'] = _userTypeID;
    map['User_Type'] = _userType;
    map['Registration_Date'] = _registrationDate;
    map['CompanyProfile'] = _companyProfile;
    return map;
  }

}

/// dashboard : null
/// Approval : null
/// pages : null

class Menus {
  Menus({
      dynamic dashboard, 
      dynamic approval, 
      dynamic pages,}){
    _dashboard = dashboard;
    _approval = approval;
    _pages = pages;
}

  Menus.fromJson(dynamic json) {
    _dashboard = json['dashboard'];
    _approval = json['Approval'];
    _pages = json['pages'];
  }
  dynamic _dashboard;
  dynamic _approval;
  dynamic _pages;

  dynamic get dashboard => _dashboard;
  dynamic get approval => _approval;
  dynamic get pages => _pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dashboard'] = _dashboard;
    map['Approval'] = _approval;
    map['pages'] = _pages;
    return map;
  }

}

/// responseCode : 0
/// responseMessage : "Success"

class Response {
  Response({
      int? responseCode, 
      String? responseMessage,}){
    _responseCode = responseCode;
    _responseMessage = responseMessage;
}

  Response.fromJson(dynamic json) {
    _responseCode = json['responseCode'];
    _responseMessage = json['responseMessage'];
  }
  int? _responseCode;
  String? _responseMessage;

  int? get responseCode => _responseCode;
  String? get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = _responseCode;
    map['responseMessage'] = _responseMessage;
    return map;
  }

}