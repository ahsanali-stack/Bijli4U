/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"Notification_ID":1,"User_ID":2,"User_Name":"Faizan Indivial","Category_ID":1,"Category":"Generator","Notification_Title":"5Kv Generator","Notification_Description":"Gas Genrator","Notification_Logo":"/Documents/2/image_09302021_102659pm_047.jpg","Notification_StartTime_Slot":1625799600,"Notification_EndTime_Slot":1625803200,"Expiry_StartDate":"2021-07-09T00:00:00","Expiry_EndDate":"2021-12-10T23:59:00"},null]

class NotificationAllResponse {
  NotificationAllResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  NotificationAllResponse.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  Response? _response;
  List<Result>? _result;

  Response? get response => _response;
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Notification_ID : 1
/// User_ID : 2
/// User_Name : "Faizan Indivial"
/// Category_ID : 1
/// Category : "Generator"
/// Notification_Title : "5Kv Generator"
/// Notification_Description : "Gas Genrator"
/// Notification_Logo : "/Documents/2/image_09302021_102659pm_047.jpg"
/// Notification_StartTime_Slot : 1625799600
/// Notification_EndTime_Slot : 1625803200
/// Expiry_StartDate : "2021-07-09T00:00:00"
/// Expiry_EndDate : "2021-12-10T23:59:00"

class Result {
  Result({
      int? notificationID, 
      int? userID, 
      String? userName, 
      int? categoryID, 
      String? category, 
      String? notificationTitle, 
      String? notificationDescription, 
      String? notificationLogo, 
      int? notificationStartTimeSlot, 
      int? notificationEndTimeSlot, 
      String? expiryStartDate, 
      String? expiryEndDate,}){
    _notificationID = notificationID;
    _userID = userID;
    _userName = userName;
    _categoryID = categoryID;
    _category = category;
    _notificationTitle = notificationTitle;
    _notificationDescription = notificationDescription;
    _notificationLogo = notificationLogo;
    _notificationStartTimeSlot = notificationStartTimeSlot;
    _notificationEndTimeSlot = notificationEndTimeSlot;
    _expiryStartDate = expiryStartDate;
    _expiryEndDate = expiryEndDate;
}

  Result.fromJson(dynamic json) {
    _notificationID = json['Notification_ID'];
    _userID = json['User_ID'];
    _userName = json['User_Name'];
    _categoryID = json['Category_ID'];
    _category = json['Category'];
    _notificationTitle = json['Notification_Title'];
    _notificationDescription = json['Notification_Description'];
    _notificationLogo = json['Notification_Logo'];
    _notificationStartTimeSlot = json['Notification_StartTime_Slot'];
    _notificationEndTimeSlot = json['Notification_EndTime_Slot'];
    _expiryStartDate = json['Expiry_StartDate'];
    _expiryEndDate = json['Expiry_EndDate'];
  }
  int? _notificationID;
  int? _userID;
  String? _userName;
  int? _categoryID;
  String? _category;
  String? _notificationTitle;
  String? _notificationDescription;
  String? _notificationLogo;
  int? _notificationStartTimeSlot;
  int? _notificationEndTimeSlot;
  String? _expiryStartDate;
  String? _expiryEndDate;

  int? get notificationID => _notificationID;
  int? get userID => _userID;
  String? get userName => _userName;
  int? get categoryID => _categoryID;
  String? get category => _category;
  String? get notificationTitle => _notificationTitle;
  String? get notificationDescription => _notificationDescription;
  String? get notificationLogo => _notificationLogo;
  int? get notificationStartTimeSlot => _notificationStartTimeSlot;
  int? get notificationEndTimeSlot => _notificationEndTimeSlot;
  String? get expiryStartDate => _expiryStartDate;
  String? get expiryEndDate => _expiryEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Notification_ID'] = _notificationID;
    map['User_ID'] = _userID;
    map['User_Name'] = _userName;
    map['Category_ID'] = _categoryID;
    map['Category'] = _category;
    map['Notification_Title'] = _notificationTitle;
    map['Notification_Description'] = _notificationDescription;
    map['Notification_Logo'] = _notificationLogo;
    map['Notification_StartTime_Slot'] = _notificationStartTimeSlot;
    map['Notification_EndTime_Slot'] = _notificationEndTimeSlot;
    map['Expiry_StartDate'] = _expiryStartDate;
    map['Expiry_EndDate'] = _expiryEndDate;
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