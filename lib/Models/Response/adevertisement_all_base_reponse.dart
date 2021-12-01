/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"User_Name":"Faizan Indivial","Category":"Generator","Advertisement_ID":1,"User_ID":2,"Category_ID":1,"Image":"/Documents/2/image_10012021_014052am_103.jpg","Created_By":null,"Created_Date":"2021-10-01T01:40:52.133","Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null,"Expiry_StartDate":"2021-07-09T00:00:00","Expiry_EndDate":"2021-12-10T23:59:00"},null]

class AdevertisementAllBaseReponse {
  AdevertisementAllBaseReponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  AdevertisementAllBaseReponse.fromJson(dynamic json) {
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

/// User_Name : "Faizan Indivial"
/// Category : "Generator"
/// Advertisement_ID : 1
/// User_ID : 2
/// Category_ID : 1
/// Image : "/Documents/2/image_10012021_014052am_103.jpg"
/// Created_By : null
/// Created_Date : "2021-10-01T01:40:52.133"
/// Active : true
/// Deleted : false
/// Last_Updated_by : null
/// Last_Updated_Date : null
/// Expiry_StartDate : "2021-07-09T00:00:00"
/// Expiry_EndDate : "2021-12-10T23:59:00"

class Result {
  Result({
      String? userName, 
      String? category, 
      int? advertisementID, 
      int? userID, 
      int? categoryID, 
      String? image, 
      dynamic createdBy, 
      String? createdDate, 
      bool? active, 
      bool? deleted, 
      dynamic lastUpdatedBy, 
      dynamic lastUpdatedDate, 
      String? expiryStartDate, 
      String? expiryEndDate,}){
    _userName = userName;
    _category = category;
    _advertisementID = advertisementID;
    _userID = userID;
    _categoryID = categoryID;
    _image = image;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _active = active;
    _deleted = deleted;
    _lastUpdatedBy = lastUpdatedBy;
    _lastUpdatedDate = lastUpdatedDate;
    _expiryStartDate = expiryStartDate;
    _expiryEndDate = expiryEndDate;
}

  Result.fromJson(dynamic json) {
    _userName = json['User_Name'];
    _category = json['Category'];
    _advertisementID = json['Advertisement_ID'];
    _userID = json['User_ID'];
    _categoryID = json['Category_ID'];
    _image = json['Image'];
    _createdBy = json['Created_By'];
    _createdDate = json['Created_Date'];
    _active = json['Active'];
    _deleted = json['Deleted'];
    _lastUpdatedBy = json['Last_Updated_by'];
    _lastUpdatedDate = json['Last_Updated_Date'];
    _expiryStartDate = json['Expiry_StartDate'];
    _expiryEndDate = json['Expiry_EndDate'];
  }
  String? _userName;
  String? _category;
  int? _advertisementID;
  int? _userID;
  int? _categoryID;
  String? _image;
  dynamic _createdBy;
  String? _createdDate;
  bool? _active;
  bool? _deleted;
  dynamic _lastUpdatedBy;
  dynamic _lastUpdatedDate;
  String? _expiryStartDate;
  String? _expiryEndDate;

  String? get userName => _userName;
  String? get category => _category;
  int? get advertisementID => _advertisementID;
  int? get userID => _userID;
  int? get categoryID => _categoryID;
  String? get image => _image;
  dynamic get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  bool? get active => _active;
  bool? get deleted => _deleted;
  dynamic get lastUpdatedBy => _lastUpdatedBy;
  dynamic get lastUpdatedDate => _lastUpdatedDate;
  String? get expiryStartDate => _expiryStartDate;
  String? get expiryEndDate => _expiryEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_Name'] = _userName;
    map['Category'] = _category;
    map['Advertisement_ID'] = _advertisementID;
    map['User_ID'] = _userID;
    map['Category_ID'] = _categoryID;
    map['Image'] = _image;
    map['Created_By'] = _createdBy;
    map['Created_Date'] = _createdDate;
    map['Active'] = _active;
    map['Deleted'] = _deleted;
    map['Last_Updated_by'] = _lastUpdatedBy;
    map['Last_Updated_Date'] = _lastUpdatedDate;
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