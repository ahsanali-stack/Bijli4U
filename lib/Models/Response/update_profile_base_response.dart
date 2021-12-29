/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : {"Image":"/Documents/1/image_08062021_013757pm_714.jpg"}

class UpdateProfileBaseResponse {
  UpdateProfileBaseResponse({
      Response? response, 
      Result? result,}){
    _response = response;
    _result = result;
}

  UpdateProfileBaseResponse.fromJson(dynamic json) {
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

/// Image : "/Documents/1/image_08062021_013757pm_714.jpg"

class Result {
  Result({
      String? image,}){
    _image = image;
}

  Result.fromJson(dynamic json) {
    _image = json['Image'];
  }
  String? _image;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Image'] = _image;
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