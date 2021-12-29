/// User_ID : 1
/// First_Name : "Syed Faizan"
/// Middle_Name : "null"
/// Last_Name : "Ali"
/// DOB : "2021-05-17T00:00:00"
/// Certification : null
/// Gender : null
/// Location : null
/// Mobile_Number : "03132870236"
/// Whatapp_Number : "03132870236"
/// Registration_Date : null
/// Religious : null
/// Twitter_Link : null
/// YouTube_Profile : null
/// LinkIn_Profile_Link : null
/// Facebook_Link : null
/// Emergency_Contact : null
/// Image : null

class UpdateProfileRequest {
  UpdateProfileRequest({
      int? userID, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? dob, 
      dynamic certification, 
      dynamic gender, 
      dynamic location, 
      String? mobileNumber, 
      String? whatappNumber, 
      dynamic registrationDate, 
      dynamic religious, 
      dynamic twitterLink, 
      dynamic youTubeProfile, 
      dynamic linkInProfileLink, 
      dynamic facebookLink, 
      dynamic emergencyContact, 
      dynamic image,}){
    _userID = userID;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _dob = dob;
    _certification = certification;
    _gender = gender;
    _location = location;
    _mobileNumber = mobileNumber;
    _whatappNumber = whatappNumber;
    _registrationDate = registrationDate;
    _religious = religious;
    _twitterLink = twitterLink;
    _youTubeProfile = youTubeProfile;
    _linkInProfileLink = linkInProfileLink;
    _facebookLink = facebookLink;
    _emergencyContact = emergencyContact;
    _image = image;
}

  UpdateProfileRequest.fromJson(dynamic json) {
    _userID = json['User_ID'];
    _firstName = json['First_Name'];
    _middleName = json['Middle_Name'];
    _lastName = json['Last_Name'];
    _dob = json['DOB'];
    _certification = json['Certification'];
    _gender = json['Gender'];
    _location = json['Location'];
    _mobileNumber = json['Mobile_Number'];
    _whatappNumber = json['Whatapp_Number'];
    _registrationDate = json['Registration_Date'];
    _religious = json['Religious'];
    _twitterLink = json['Twitter_Link'];
    _youTubeProfile = json['YouTube_Profile'];
    _linkInProfileLink = json['LinkIn_Profile_Link'];
    _facebookLink = json['Facebook_Link'];
    _emergencyContact = json['Emergency_Contact'];
    _image = json['Image'];
  }
  int? _userID;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _dob;
  dynamic _certification;
  dynamic _gender;
  dynamic _location;
  String? _mobileNumber;
  String? _whatappNumber;
  dynamic _registrationDate;
  dynamic _religious;
  dynamic _twitterLink;
  dynamic _youTubeProfile;
  dynamic _linkInProfileLink;
  dynamic _facebookLink;
  dynamic _emergencyContact;
  dynamic _image;

  int? get userID => _userID;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get dob => _dob;
  dynamic get certification => _certification;
  dynamic get gender => _gender;
  dynamic get location => _location;
  String? get mobileNumber => _mobileNumber;
  String? get whatappNumber => _whatappNumber;
  dynamic get registrationDate => _registrationDate;
  dynamic get religious => _religious;
  dynamic get twitterLink => _twitterLink;
  dynamic get youTubeProfile => _youTubeProfile;
  dynamic get linkInProfileLink => _linkInProfileLink;
  dynamic get facebookLink => _facebookLink;
  dynamic get emergencyContact => _emergencyContact;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['User_ID'] = _userID;
    map['First_Name'] = _firstName;
    map['Middle_Name'] = _middleName;
    map['Last_Name'] = _lastName;
    map['DOB'] = _dob;
    map['Certification'] = _certification;
    map['Gender'] = _gender;
    map['Location'] = _location;
    map['Mobile_Number'] = _mobileNumber;
    map['Whatapp_Number'] = _whatappNumber;
    map['Registration_Date'] = _registrationDate;
    map['Religious'] = _religious;
    map['Twitter_Link'] = _twitterLink;
    map['YouTube_Profile'] = _youTubeProfile;
    map['LinkIn_Profile_Link'] = _linkInProfileLink;
    map['Facebook_Link'] = _facebookLink;
    map['Emergency_Contact'] = _emergencyContact;
    map['Image'] = _image;
    return map;
  }

}