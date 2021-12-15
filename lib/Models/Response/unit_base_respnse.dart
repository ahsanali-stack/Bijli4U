/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"Unit_ID":1,"Unit_Type":"KW","Created_By":null,"Created_Date":"2021-07-15T15:30:06.387","Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":"2021-07-14T00:00:00"},{"Unit_ID":2,"Unit_Type":"W","Created_By":null,"Created_Date":"2021-07-15T15:30:06.387","Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":"2021-07-14T00:00:00"}]

class UnitBaseRespnse {
  UnitBaseRespnse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  UnitBaseRespnse.fromJson(dynamic json) {
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

/// Unit_ID : 1
/// Unit_Type : "KW"
/// Created_By : null
/// Created_Date : "2021-07-15T15:30:06.387"
/// Active : true
/// Deleted : false
/// Last_Updated_by : null
/// Last_Updated_Date : "2021-07-14T00:00:00"

class Result {
  Result({
      int? unitID, 
      String? unitType, 
      dynamic createdBy, 
      String? createdDate, 
      bool? active, 
      bool? deleted, 
      dynamic lastUpdatedBy, 
      String? lastUpdatedDate,}){
    _unitID = unitID;
    _unitType = unitType;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _active = active;
    _deleted = deleted;
    _lastUpdatedBy = lastUpdatedBy;
    _lastUpdatedDate = lastUpdatedDate;
}

  Result.fromJson(dynamic json) {
    _unitID = json['Unit_ID'];
    _unitType = json['Unit_Type'];
    _createdBy = json['Created_By'];
    _createdDate = json['Created_Date'];
    _active = json['Active'];
    _deleted = json['Deleted'];
    _lastUpdatedBy = json['Last_Updated_by'];
    _lastUpdatedDate = json['Last_Updated_Date'];
  }
  int? _unitID;
  String? _unitType;
  dynamic _createdBy;
  String? _createdDate;
  bool? _active;
  bool? _deleted;
  dynamic _lastUpdatedBy;
  String? _lastUpdatedDate;

  int? get unitID => _unitID;
  String? get unitType => _unitType;
  dynamic get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  bool? get active => _active;
  bool? get deleted => _deleted;
  dynamic get lastUpdatedBy => _lastUpdatedBy;
  String? get lastUpdatedDate => _lastUpdatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Unit_ID'] = _unitID;
    map['Unit_Type'] = _unitType;
    map['Created_By'] = _createdBy;
    map['Created_Date'] = _createdDate;
    map['Active'] = _active;
    map['Deleted'] = _deleted;
    map['Last_Updated_by'] = _lastUpdatedBy;
    map['Last_Updated_Date'] = _lastUpdatedDate;
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