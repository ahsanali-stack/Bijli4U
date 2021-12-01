/// response : {"responseCode":1,"responseMessage":"User name already exists."}
/// result : null

class RegistrationResponse {
  RegistrationResponse({
      Response? response, 
      dynamic result,}){
    _response = response;
    _result = result;
}

  RegistrationResponse.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
    _result = json['result'];
  }
  Response? _response;
  dynamic _result;

  Response? get response => _response;
  dynamic get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    map['result'] = _result;
    return map;
  }

}

/// responseCode : 1
/// responseMessage : "User name already exists."

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