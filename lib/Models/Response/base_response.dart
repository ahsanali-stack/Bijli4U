/// response : {"responseCode":0,"responseMessage":"Success"}

class BaseResponse {
  BaseResponse({
      Response? response,}){
    _response = response;
}

  BaseResponse.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;

  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
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