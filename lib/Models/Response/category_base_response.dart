/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"ID":1,"Name":"Generator"},{"ID":26,"Name":"UPS"},{"ID":27,"Name":"Solar Panel"},{"ID":30,"Name":"Wind Mill"}]

class CategoryBaseResponse {
  CategoryBaseResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  CategoryBaseResponse.fromJson(dynamic json) {
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

/// ID : 1
/// Name : "Generator"

class Result {
  Result({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Result.fromJson(dynamic json) {
    _id = json['ID'];
    _name = json['Name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = _id;
    map['Name'] = _name;
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