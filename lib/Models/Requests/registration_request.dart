class RegistrationRequest {
  late String userTypeID;
  late String email;
  late String userName;
  late String cNIC;

  RegistrationRequest({required this.userTypeID, required this.email, required this.userName, required this.cNIC});

  RegistrationRequest.fromJson(Map<String, dynamic> json) {
    userTypeID = json['User_Type_ID'];
    email = json['Email'];
    userName = json['User_Name'];
    cNIC = json['CNIC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_Type_ID'] = this.userTypeID;
    data['Email'] = this.email;
    data['User_Name'] = this.userName;
    data['CNIC'] = this.cNIC;
    return data;
  }
}
