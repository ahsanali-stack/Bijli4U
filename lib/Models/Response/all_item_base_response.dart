/// response : {"responseCode":0,"responseMessage":"Success"}
/// result : [{"Category_ID":1,"Category":"Generator","Sub_Category_ID":1,"Sub_Category_Name":"Diesel Generator","Brand_ID":2,"Brand_Name":"Honda","Business":"Individual","Capacity":"2.5","Amount":250000.00,"Unit_ID":1,"Unit_Type":"KW","Title_Name":"Honda Electric Start 2.5 KW Generator (EZ6500CXS)","Rating":0,"ImageUrl":"/Documents/2/image_10012021_031204PM_422.jpg","Item_ID":16,"User_ID":2,"Item_description":"Honda generators have earned a reputation for smooth, quiet operation, outstanding fuel efficiency and prolong toughness. The legendary Honda reliability makes Honda generators an ideal backup source for homes and business. It works as hard as you do, powered with renowned 4-stroke engines, offering wide range of 5KVA to 8KVA.• Outstanding fuel efficiency • Ideal backup • 4-stroke engines • Quiet operation ","Item_Sale_Type_ID":2,"Item_Sale_Type_Name":"Rent","Reviews":[{"User_ID":2,"User_Name":"Faizan Indivial","Item_ID":16,"Comments":"hello"}]},null]

class AllItemBaseResponse {
  AllItemBaseResponse({
      Response? response, 
      List<Result>? result,}){
    _response = response;
    _result = result;
}

  AllItemBaseResponse.fromJson(dynamic json) {
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

/// Category_ID : 1
/// Category : "Generator"
/// Sub_Category_ID : 1
/// Sub_Category_Name : "Diesel Generator"
/// Brand_ID : 2
/// Brand_Name : "Honda"
/// Business : "Individual"
/// Capacity : "2.5"
/// Amount : 250000.00
/// Unit_ID : 1
/// Unit_Type : "KW"
/// Title_Name : "Honda Electric Start 2.5 KW Generator (EZ6500CXS)"
/// Rating : 0
/// ImageUrl : "/Documents/2/image_10012021_031204PM_422.jpg"
/// Item_ID : 16
/// User_ID : 2
/// Item_description : "Honda generators have earned a reputation for smooth, quiet operation, outstanding fuel efficiency and prolong toughness. The legendary Honda reliability makes Honda generators an ideal backup source for homes and business. It works as hard as you do, powered with renowned 4-stroke engines, offering wide range of 5KVA to 8KVA.• Outstanding fuel efficiency • Ideal backup • 4-stroke engines • Quiet operation "
/// Item_Sale_Type_ID : 2
/// Item_Sale_Type_Name : "Rent"
/// Reviews : [{"User_ID":2,"User_Name":"Faizan Indivial","Item_ID":16,"Comments":"hello"}]

class Result {
  Result({
      int? categoryID, 
      String? category, 
      int? subCategoryID, 
      String? subCategoryName, 
      int? brandID, 
      String? brandName, 
      String? business, 
      String? capacity, 
      double? amount, 
      int? unitID, 
      String? unitType, 
      String? titleName, 
      int? rating, 
      String? imageUrl, 
      int? itemID, 
      int? userID, 
      String? itemDescription, 
      int? itemSaleTypeID, 
      String? itemSaleTypeName, 
      List<Reviews>? reviews,}){
    _categoryID = categoryID;
    _category = category;
    _subCategoryID = subCategoryID;
    _subCategoryName = subCategoryName;
    _brandID = brandID;
    _brandName = brandName;
    _business = business;
    _capacity = capacity;
    _amount = amount;
    _unitID = unitID;
    _unitType = unitType;
    _titleName = titleName;
    _rating = rating;
    _imageUrl = imageUrl;
    _itemID = itemID;
    _userID = userID;
    _itemDescription = itemDescription;
    _itemSaleTypeID = itemSaleTypeID;
    _itemSaleTypeName = itemSaleTypeName;
    _reviews = reviews;
}

  Result.fromJson(dynamic json) {
    _categoryID = json['Category_ID'];
    _category = json['Category'];
    _subCategoryID = json['Sub_Category_ID'];
    _subCategoryName = json['Sub_Category_Name'];
    _brandID = json['Brand_ID'];
    _brandName = json['Brand_Name'];
    _business = json['Business'];
    _capacity = json['Capacity'];
    _amount = json['Amount'];
    _unitID = json['Unit_ID'];
    _unitType = json['Unit_Type'];
    _titleName = json['Title_Name'];
    _rating = json['Rating'];
    _imageUrl = json['ImageUrl'];
    _itemID = json['Item_ID'];
    _userID = json['User_ID'];
    _itemDescription = json['Item_description'];
    _itemSaleTypeID = json['Item_Sale_Type_ID'];
    _itemSaleTypeName = json['Item_Sale_Type_Name'];
    if (json['Reviews'] != null) {
      _reviews = [];
      json['Reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
  }
  int? _categoryID;
  String? _category;
  int? _subCategoryID;
  String? _subCategoryName;
  int? _brandID;
  String? _brandName;
  String? _business;
  String? _capacity;
  double? _amount;
  int? _unitID;
  String? _unitType;
  String? _titleName;
  int? _rating;
  String? _imageUrl;
  int? _itemID;
  int? _userID;
  String? _itemDescription;
  int? _itemSaleTypeID;
  String? _itemSaleTypeName;
  List<Reviews>? _reviews;

  int? get categoryID => _categoryID;
  String? get category => _category;
  int? get subCategoryID => _subCategoryID;
  String? get subCategoryName => _subCategoryName;
  int? get brandID => _brandID;
  String? get brandName => _brandName;
  String? get business => _business;
  String? get capacity => _capacity;
  double? get amount => _amount;
  int? get unitID => _unitID;
  String? get unitType => _unitType;
  String? get titleName => _titleName;
  int? get rating => _rating;
  String? get imageUrl => _imageUrl;
  int? get itemID => _itemID;
  int? get userID => _userID;
  String? get itemDescription => _itemDescription;
  int? get itemSaleTypeID => _itemSaleTypeID;
  String? get itemSaleTypeName => _itemSaleTypeName;
  List<Reviews>? get reviews => _reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Category_ID'] = _categoryID;
    map['Category'] = _category;
    map['Sub_Category_ID'] = _subCategoryID;
    map['Sub_Category_Name'] = _subCategoryName;
    map['Brand_ID'] = _brandID;
    map['Brand_Name'] = _brandName;
    map['Business'] = _business;
    map['Capacity'] = _capacity;
    map['Amount'] = _amount;
    map['Unit_ID'] = _unitID;
    map['Unit_Type'] = _unitType;
    map['Title_Name'] = _titleName;
    map['Rating'] = _rating;
    map['ImageUrl'] = _imageUrl;
    map['Item_ID'] = _itemID;
    map['User_ID'] = _userID;
    map['Item_description'] = _itemDescription;
    map['Item_Sale_Type_ID'] = _itemSaleTypeID;
    map['Item_Sale_Type_Name'] = _itemSaleTypeName;
    if (_reviews != null) {
      map['Reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// User_ID : 2
/// User_Name : "Faizan Indivial"
/// Item_ID : 16
/// Comments : "hello"

class Reviews {
  Reviews({
      int? userID, 
      String? userName, 
      int? itemID, 
      String? comments,}){
    _userID = userID;
    _userName = userName;
    _itemID = itemID;
    _comments = comments;
}

  Reviews.fromJson(dynamic json) {
    _userID = json['User_ID'];
    _userName = json['User_Name'];
    _itemID = json['Item_ID'];
    _comments = json['Comments'];
  }
  int? _userID;
  String? _userName;
  int? _itemID;
  String? _comments;

  int? get userID => _userID;
  String? get userName => _userName;
  int? get itemID => _itemID;
  String? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_ID'] = _userID;
    map['User_Name'] = _userName;
    map['Item_ID'] = _itemID;
    map['Comments'] = _comments;
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