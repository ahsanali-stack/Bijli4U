/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"Appliance_ID":1,"Appliance_Name":"Energy Server Lights","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":2,"Appliance_Name":"LED Bulb","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":3,"Appliance_Name":"Tubelight","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":4,"Appliance_Name":"LED Tubelight","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":5,"Appliance_Name":"Spotlight","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":6,"Appliance_Name":"LED Spotlight","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":7,"Appliance_Name":"AC","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":8,"Appliance_Name":"Inverter AC","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":9,"Appliance_Name":"Conventional fridge (12-15 cubic ft.)","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":10,"Appliance_Name":"Inverter Fridge","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":11,"Appliance_Name":"Deep Freezer","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":12,"Appliance_Name":"Ceiling Fan","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":13,"Appliance_Name":"Exhaust Fan","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Appliance_ID":14,"Appliance_Name":"Bracket Fan","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null}]

class AppliancesBaseResponse {
  AppliancesBaseResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  AppliancesBaseResponse.fromJson(dynamic json) {
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

/// Appliance_ID : 1
/// Appliance_Name : "Energy Server Lights"
/// Created_By : null
/// Created_Date : null
/// Active : true
/// Deleted : false
/// Last_Updated_by : null
/// Last_Updated_Date : null

class Result {
  Result({
      int? applianceID, 
      String? applianceName, 
      dynamic createdBy, 
      dynamic createdDate, 
      bool? active, 
      bool? deleted, 
      dynamic lastUpdatedBy, 
      dynamic lastUpdatedDate,}){
    _applianceID = applianceID;
    _applianceName = applianceName;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _active = active;
    _deleted = deleted;
    _lastUpdatedBy = lastUpdatedBy;
    _lastUpdatedDate = lastUpdatedDate;
}

  Result.fromJson(dynamic json) {
    _applianceID = json['Appliance_ID'];
    _applianceName = json['Appliance_Name'];
    _createdBy = json['Created_By'];
    _createdDate = json['Created_Date'];
    _active = json['Active'];
    _deleted = json['Deleted'];
    _lastUpdatedBy = json['Last_Updated_by'];
    _lastUpdatedDate = json['Last_Updated_Date'];
  }
  int? _applianceID;
  String? _applianceName;
  dynamic _createdBy;
  dynamic _createdDate;
  bool? _active;
  bool? _deleted;
  dynamic _lastUpdatedBy;
  dynamic _lastUpdatedDate;

  int? get applianceID => _applianceID;
  String? get applianceName => _applianceName;
  dynamic get createdBy => _createdBy;
  dynamic get createdDate => _createdDate;
  bool? get active => _active;
  bool? get deleted => _deleted;
  dynamic get lastUpdatedBy => _lastUpdatedBy;
  dynamic get lastUpdatedDate => _lastUpdatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Appliance_ID'] = _applianceID;
    map['Appliance_Name'] = _applianceName;
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