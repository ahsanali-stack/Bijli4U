/// User_ID : 2
/// Item_ID : 14
/// Rating : 3
/// Description : "Delivery Issue"
/// Seller_Rating : 2
/// Seller_Description : "Delivery Issue"

class ProductRatingRequest {
  ProductRatingRequest({
      int? userID, 
      int? itemID, 
      int? rating, 
      String? description, 
      int? sellerRating, 
      String? sellerDescription,}){
    _userID = userID;
    _itemID = itemID;
    _rating = rating;
    _description = description;
    _sellerRating = sellerRating;
    _sellerDescription = sellerDescription;
}

  ProductRatingRequest.fromJson(dynamic json) {
    _userID = json['User_ID'];
    _itemID = json['Item_ID'];
    _rating = json['Rating'];
    _description = json['Description'];
    _sellerRating = json['Seller_Rating'];
    _sellerDescription = json['Seller_Description'];
  }
  int? _userID;
  int? _itemID;
  int? _rating;
  String? _description;
  int? _sellerRating;
  String? _sellerDescription;

  int? get userID => _userID;
  int? get itemID => _itemID;
  int? get rating => _rating;
  String? get description => _description;
  int? get sellerRating => _sellerRating;
  String? get sellerDescription => _sellerDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_ID'] = _userID;
    map['Item_ID'] = _itemID;
    map['Rating'] = _rating;
    map['Description'] = _description;
    map['Seller_Rating'] = _sellerRating;
    map['Seller_Description'] = _sellerDescription;
    return map;
  }

}