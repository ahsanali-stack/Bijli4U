/// User_Type_ID : 2
/// Category_ID : 1
/// Brand_ID : 1
/// Sub_Category_ID : 1
/// User_ID : 2
/// Item_Sale_Type_ID : 1
/// Amount : 58.26
/// Capacity : "5v"
/// Unit_ID : "1"
/// Item_Description : "Faizan"
/// Title_Name : "Test"
/// ImageUrl : ["/9j/4AAQSkZJRgABAQAAAQABAAD/"]

class AddItemRequest {
  AddItemRequest({
      int? userTypeID, 
      int? categoryID, 
      int? brandID, 
      int? subCategoryID, 
      int? userID, 
      int? itemSaleTypeID, 
      double? amount, 
      String? capacity, 
      String? unitID, 
      String? itemDescription, 
      String? titleName, 
      List<String>? imageUrl,}){
    _userTypeID = userTypeID;
    _categoryID = categoryID;
    _brandID = brandID;
    _subCategoryID = subCategoryID;
    _userID = userID;
    _itemSaleTypeID = itemSaleTypeID;
    _amount = amount;
    _capacity = capacity;
    _unitID = unitID;
    _itemDescription = itemDescription;
    _titleName = titleName;
    _imageUrl = imageUrl;
}

  AddItemRequest.fromJson(dynamic json) {
    _userTypeID = json['User_Type_ID'];
    _categoryID = json['Category_ID'];
    _brandID = json['Brand_ID'];
    _subCategoryID = json['Sub_Category_ID'];
    _userID = json['User_ID'];
    _itemSaleTypeID = json['Item_Sale_Type_ID'];
    _amount = json['Amount'];
    _capacity = json['Capacity'];
    _unitID = json['Unit_ID'];
    _itemDescription = json['Item_Description'];
    _titleName = json['Title_Name'];
    _imageUrl = json['ImageUrl'] != null ? json['ImageUrl'].cast<String>() : [];
  }
  int? _userTypeID;
  int? _categoryID;
  int? _brandID;
  int? _subCategoryID;
  int? _userID;
  int? _itemSaleTypeID;
  double? _amount;
  String? _capacity;
  String? _unitID;
  String? _itemDescription;
  String? _titleName;
  List<String>? _imageUrl;

  int? get userTypeID => _userTypeID;
  int? get categoryID => _categoryID;
  int? get brandID => _brandID;
  int? get subCategoryID => _subCategoryID;
  int? get userID => _userID;
  int? get itemSaleTypeID => _itemSaleTypeID;
  double? get amount => _amount;
  String? get capacity => _capacity;
  String? get unitID => _unitID;
  String? get itemDescription => _itemDescription;
  String? get titleName => _titleName;
  List<String>? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_Type_ID'] = _userTypeID;
    map['Category_ID'] = _categoryID;
    map['Brand_ID'] = _brandID;
    map['Sub_Category_ID'] = _subCategoryID;
    map['User_ID'] = _userID;
    map['Item_Sale_Type_ID'] = _itemSaleTypeID;
    map['Amount'] = _amount;
    map['Capacity'] = _capacity;
    map['Unit_ID'] = _unitID;
    map['Item_Description'] = _itemDescription;
    map['Title_Name'] = _titleName;
    map['ImageUrl'] = _imageUrl;
    return map;
  }

}