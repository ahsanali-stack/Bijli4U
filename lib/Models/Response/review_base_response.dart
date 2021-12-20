/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"User_ID":2,"User_Name":"Faizan Indivial","First_Name":"Faizan","Middle_Name":"Anwer","Last_Name":"Ali","Mobile_Number":"03132870236","Whatapp_Number":"03132870236","DOB":"2021-05-17T00:00:00","Email":"Faizan1507c@gmail.com","Account_Level":"Selver","Certification":null,"Emergency_Contact":null,"Facebook_Link":null,"Image":"/Documents/2/image_10012021_035900PM_803.jpg","LinkIn_Profile_Link":null,"Location":null,"Rating":null,"Seller_Rating":null,"Religious":null,"Status":"Active User","Twitter_Link":null,"YouTube_Profile":null,"User_Type":"Mobile","Registration_Date":null,"ItemsDetail":{"Item_ID":15,"Category_ID":1,"Sub_Category_ID":1,"Brand_ID":2,"Title_Name":"Honda Electric Start 2.5 KW Generator (EZ6500CXS)","Item_Description":"Honda generators have earned a reputation for smooth, quiet operation, outstanding fuel efficiency and prolong toughness.\n\n• Outstanding fuel efficiency\n• Ideal backup\n• 4-stroke engines\n• Quiet operation","Capacity":"2.5","ImageUrl":"/Documents/2/image_10012021_030930PM_474.jpg,/Documents/2/image_10012021_030930PM_480.jpg","Item_Sale_Type_Name":"Buy"},"CompanyProfile":[]},null]

class ReviewBaseResponse {
  ReviewBaseResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  ReviewBaseResponse.fromJson(dynamic json) {
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

/// User_ID : 2
/// User_Name : "Faizan Indivial"
/// First_Name : "Faizan"
/// Middle_Name : "Anwer"
/// Last_Name : "Ali"
/// Mobile_Number : "03132870236"
/// Whatapp_Number : "03132870236"
/// DOB : "2021-05-17T00:00:00"
/// Email : "Faizan1507c@gmail.com"
/// Account_Level : "Selver"
/// Certification : null
/// Emergency_Contact : null
/// Facebook_Link : null
/// Image : "/Documents/2/image_10012021_035900PM_803.jpg"
/// LinkIn_Profile_Link : null
/// Location : null
/// Rating : null
/// Seller_Rating : null
/// Religious : null
/// Status : "Active User"
/// Twitter_Link : null
/// YouTube_Profile : null
/// User_Type : "Mobile"
/// Registration_Date : null
/// ItemsDetail : {"Item_ID":15,"Category_ID":1,"Sub_Category_ID":1,"Brand_ID":2,"Title_Name":"Honda Electric Start 2.5 KW Generator (EZ6500CXS)","Item_Description":"Honda generators have earned a reputation for smooth, quiet operation, outstanding fuel efficiency and prolong toughness.\n\n• Outstanding fuel efficiency\n• Ideal backup\n• 4-stroke engines\n• Quiet operation","Capacity":"2.5","ImageUrl":"/Documents/2/image_10012021_030930PM_474.jpg,/Documents/2/image_10012021_030930PM_480.jpg","Item_Sale_Type_Name":"Buy"}
/// CompanyProfile : []

class Result {
  Result({
      int? userID, 
      String? userName, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? mobileNumber, 
      String? whatappNumber, 
      String? dob, 
      String? email, 
      String? accountLevel, 
      dynamic certification, 
      dynamic emergencyContact, 
      dynamic facebookLink, 
      String? image, 
      dynamic linkInProfileLink, 
      dynamic location, 
      dynamic rating, 
      dynamic sellerRating, 
      dynamic religious, 
      String? status, 
      dynamic twitterLink, 
      dynamic youTubeProfile, 
      String? userType, 
      dynamic registrationDate, 
      ItemsDetail? itemsDetail, 
      List<dynamic>? companyProfile,}){
    _userID = userID;
    _userName = userName;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _whatappNumber = whatappNumber;
    _dob = dob;
    _email = email;
    _accountLevel = accountLevel;
    _certification = certification;
    _emergencyContact = emergencyContact;
    _facebookLink = facebookLink;
    _image = image;
    _linkInProfileLink = linkInProfileLink;
    _location = location;
    _rating = rating;
    _sellerRating = sellerRating;
    _religious = religious;
    _status = status;
    _twitterLink = twitterLink;
    _youTubeProfile = youTubeProfile;
    _userType = userType;
    _registrationDate = registrationDate;
    _itemsDetail = itemsDetail;
    _companyProfile = companyProfile;
}

  Result.fromJson(dynamic json) {
    _userID = json['User_ID'];
    _userName = json['User_Name'];
    _firstName = json['First_Name'];
    _middleName = json['Middle_Name'];
    _lastName = json['Last_Name'];
    _mobileNumber = json['Mobile_Number'];
    _whatappNumber = json['Whatapp_Number'];
    _dob = json['DOB'];
    _email = json['Email'];
    _accountLevel = json['Account_Level'];
    _certification = json['Certification'];
    _emergencyContact = json['Emergency_Contact'];
    _facebookLink = json['Facebook_Link'];
    _image = json['Image'];
    _linkInProfileLink = json['LinkIn_Profile_Link'];
    _location = json['Location'];
    _rating = json['Rating'];
    _sellerRating = json['Seller_Rating'];
    _religious = json['Religious'];
    _status = json['Status'];
    _twitterLink = json['Twitter_Link'];
    _youTubeProfile = json['YouTube_Profile'];
    _userType = json['User_Type'];
    _registrationDate = json['Registration_Date'];
    _itemsDetail = json['ItemsDetail'] != null ? ItemsDetail.fromJson(json['ItemsDetail']) : null;
    // if (json['CompanyProfile'] != null) {
    //   _companyProfile = [];
    //   json['CompanyProfile'].forEach((v) {
    //     _companyProfile?.add(dynamic.fromJson(v));
    //   });
    // }
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
  String? _accountLevel;
  dynamic _certification;
  dynamic _emergencyContact;
  dynamic _facebookLink;
  String? _image;
  dynamic _linkInProfileLink;
  dynamic _location;
  dynamic _rating;
  dynamic _sellerRating;
  dynamic _religious;
  String? _status;
  dynamic _twitterLink;
  dynamic _youTubeProfile;
  String? _userType;
  dynamic _registrationDate;
  ItemsDetail? _itemsDetail;
  List<dynamic>? _companyProfile;

  int? get userID => _userID;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get mobileNumber => _mobileNumber;
  String? get whatappNumber => _whatappNumber;
  String? get dob => _dob;
  String? get email => _email;
  String? get accountLevel => _accountLevel;
  dynamic get certification => _certification;
  dynamic get emergencyContact => _emergencyContact;
  dynamic get facebookLink => _facebookLink;
  String? get image => _image;
  dynamic get linkInProfileLink => _linkInProfileLink;
  dynamic get location => _location;
  dynamic get rating => _rating;
  dynamic get sellerRating => _sellerRating;
  dynamic get religious => _religious;
  String? get status => _status;
  dynamic get twitterLink => _twitterLink;
  dynamic get youTubeProfile => _youTubeProfile;
  String? get userType => _userType;
  dynamic get registrationDate => _registrationDate;
  ItemsDetail? get itemsDetail => _itemsDetail;
  List<dynamic>? get companyProfile => _companyProfile;

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
    map['Account_Level'] = _accountLevel;
    map['Certification'] = _certification;
    map['Emergency_Contact'] = _emergencyContact;
    map['Facebook_Link'] = _facebookLink;
    map['Image'] = _image;
    map['LinkIn_Profile_Link'] = _linkInProfileLink;
    map['Location'] = _location;
    map['Rating'] = _rating;
    map['Seller_Rating'] = _sellerRating;
    map['Religious'] = _religious;
    map['Status'] = _status;
    map['Twitter_Link'] = _twitterLink;
    map['YouTube_Profile'] = _youTubeProfile;
    map['User_Type'] = _userType;
    map['Registration_Date'] = _registrationDate;
    if (_itemsDetail != null) {
      map['ItemsDetail'] = _itemsDetail?.toJson();
    }
    if (_companyProfile != null) {
      map['CompanyProfile'] = _companyProfile?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Item_ID : 15
/// Category_ID : 1
/// Sub_Category_ID : 1
/// Brand_ID : 2
/// Title_Name : "Honda Electric Start 2.5 KW Generator (EZ6500CXS)"
/// Item_Description : "Honda generators have earned a reputation for smooth, quiet operation, outstanding fuel efficiency and prolong toughness.\n\n• Outstanding fuel efficiency\n• Ideal backup\n• 4-stroke engines\n• Quiet operation"
/// Capacity : "2.5"
/// ImageUrl : "/Documents/2/image_10012021_030930PM_474.jpg,/Documents/2/image_10012021_030930PM_480.jpg"
/// Item_Sale_Type_Name : "Buy"

class ItemsDetail {
  ItemsDetail({
      int? itemID, 
      int? categoryID, 
      int? subCategoryID, 
      int? brandID, 
      String? titleName, 
      String? itemDescription, 
      String? capacity, 
      String? imageUrl, 
      String? itemSaleTypeName,}){
    _itemID = itemID;
    _categoryID = categoryID;
    _subCategoryID = subCategoryID;
    _brandID = brandID;
    _titleName = titleName;
    _itemDescription = itemDescription;
    _capacity = capacity;
    _imageUrl = imageUrl;
    _itemSaleTypeName = itemSaleTypeName;
}

  ItemsDetail.fromJson(dynamic json) {
    _itemID = json['Item_ID'];
    _categoryID = json['Category_ID'];
    _subCategoryID = json['Sub_Category_ID'];
    _brandID = json['Brand_ID'];
    _titleName = json['Title_Name'];
    _itemDescription = json['Item_Description'];
    _capacity = json['Capacity'];
    _imageUrl = json['ImageUrl'];
    _itemSaleTypeName = json['Item_Sale_Type_Name'];
  }
  int? _itemID;
  int? _categoryID;
  int? _subCategoryID;
  int? _brandID;
  String? _titleName;
  String? _itemDescription;
  String? _capacity;
  String? _imageUrl;
  String? _itemSaleTypeName;

  int? get itemID => _itemID;
  int? get categoryID => _categoryID;
  int? get subCategoryID => _subCategoryID;
  int? get brandID => _brandID;
  String? get titleName => _titleName;
  String? get itemDescription => _itemDescription;
  String? get capacity => _capacity;
  String? get imageUrl => _imageUrl;
  String? get itemSaleTypeName => _itemSaleTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = _itemID;
    map['Category_ID'] = _categoryID;
    map['Sub_Category_ID'] = _subCategoryID;
    map['Brand_ID'] = _brandID;
    map['Title_Name'] = _titleName;
    map['Item_Description'] = _itemDescription;
    map['Capacity'] = _capacity;
    map['ImageUrl'] = _imageUrl;
    map['Item_Sale_Type_Name'] = _itemSaleTypeName;
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