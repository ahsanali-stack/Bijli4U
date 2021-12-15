/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":1,"Brand_Name":"Jasco","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":2,"Brand_Name":"Honda","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":3,"Brand_Name":"Elemax","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":4,"Brand_Name":"Yamaha","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":5,"Brand_Name":"Homage","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":6,"Brand_Name":"EuroPower","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":7,"Brand_Name":"Grannitto","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":8,"Brand_Name":"Aurora","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":9,"Brand_Name":"Hyundai","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":10,"Brand_Name":"GreenPower","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":11,"Brand_Name":"Firman","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":12,"Brand_Name":"Lancin","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":13,"Brand_Name":"Dynamac","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":14,"Brand_Name":"Lifan","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":15,"Brand_Name":"EMPower","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":null},{"Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":16,"Brand_Name":"Angel","Created_By":null,"Created_Date":null,"Active":true,"Deleted":false,"Last_Updated_by":null,"Last_Updated_Date":"2021-08-15T02:50:56.467"}]

class BrandAllBaseResponse {
  BrandAllBaseResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  BrandAllBaseResponse.fromJson(dynamic json) {
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

/// Sub_Category_ID : 1
/// Sub_Category_Name : "Diesel Generator"
/// Brand_ID : 1
/// Brand_Name : "Jasco"
/// Created_By : null
/// Created_Date : null
/// Active : true
/// Deleted : false
/// Last_Updated_by : null
/// Last_Updated_Date : null

class Result {
  Result({
      int? subCategoryID, 
      String? subCategoryName, 
      int? brandID, 
      String? brandName, 
      dynamic createdBy, 
      dynamic createdDate, 
      bool? active, 
      bool? deleted, 
      dynamic lastUpdatedBy, 
      dynamic lastUpdatedDate,}){
    _subCategoryID = subCategoryID;
    _subCategoryName = subCategoryName;
    _brandID = brandID;
    _brandName = brandName;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _active = active;
    _deleted = deleted;
    _lastUpdatedBy = lastUpdatedBy;
    _lastUpdatedDate = lastUpdatedDate;
}

  Result.fromJson(dynamic json) {
    _subCategoryID = json['Sub_Category_ID'];
    _subCategoryName = json['Sub_Category_Name'];
    _brandID = json['Brand_ID'];
    _brandName = json['Brand_Name'];
    _createdBy = json['Created_By'];
    _createdDate = json['Created_Date'];
    _active = json['Active'];
    _deleted = json['Deleted'];
    _lastUpdatedBy = json['Last_Updated_by'];
    _lastUpdatedDate = json['Last_Updated_Date'];
  }
  int? _subCategoryID;
  String? _subCategoryName;
  int? _brandID;
  String? _brandName;
  dynamic _createdBy;
  dynamic _createdDate;
  bool? _active;
  bool? _deleted;
  dynamic _lastUpdatedBy;
  dynamic _lastUpdatedDate;

  int? get subCategoryID => _subCategoryID;
  String? get subCategoryName => _subCategoryName;
  int? get brandID => _brandID;
  String? get brandName => _brandName;
  dynamic get createdBy => _createdBy;
  dynamic get createdDate => _createdDate;
  bool? get active => _active;
  bool? get deleted => _deleted;
  dynamic get lastUpdatedBy => _lastUpdatedBy;
  dynamic get lastUpdatedDate => _lastUpdatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Sub_Category_ID'] = _subCategoryID;
    map['Sub_Category_Name'] = _subCategoryName;
    map['Brand_ID'] = _brandID;
    map['Brand_Name'] = _brandName;
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