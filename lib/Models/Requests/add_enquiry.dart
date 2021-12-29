/// Contact_Name : "Test"
/// Phone_Number : "00000000"
/// Email : "test@yahoo.com"
/// Application : "Domestic"
/// Frequency_Use : "Daily"
/// Operating_Hours : "2-5 hours each run"
/// Fuel_Type : "Petrol"
/// Starting_Method : "Automatic start"
/// Sound_Level : "Automatic start"
/// Voltage_Required : "10v 50hz single phase"
/// List_All_Appliances_Being_Powered : "Test"
/// Other_Details_SpecicalRequirement_Additions : "Test"

class AddEnquiry {
  AddEnquiry({
      String? contactName, 
      String? phoneNumber, 
      String? email, 
      String? application, 
      String? frequencyUse, 
      String? operatingHours, 
      String? fuelType, 
      String? startingMethod, 
      String? soundLevel, 
      String? voltageRequired, 
      String? listAllAppliancesBeingPowered, 
      String? otherDetailsSpecicalRequirementAdditions,}){
    _contactName = contactName;
    _phoneNumber = phoneNumber;
    _email = email;
    _application = application;
    _frequencyUse = frequencyUse;
    _operatingHours = operatingHours;
    _fuelType = fuelType;
    _startingMethod = startingMethod;
    _soundLevel = soundLevel;
    _voltageRequired = voltageRequired;
    _listAllAppliancesBeingPowered = listAllAppliancesBeingPowered;
    _otherDetailsSpecicalRequirementAdditions = otherDetailsSpecicalRequirementAdditions;
}

  AddEnquiry.fromJson(dynamic json) {
    _contactName = json['Contact_Name'];
    _phoneNumber = json['Phone_Number'];
    _email = json['Email'];
    _application = json['Application'];
    _frequencyUse = json['Frequency_Use'];
    _operatingHours = json['Operating_Hours'];
    _fuelType = json['Fuel_Type'];
    _startingMethod = json['Starting_Method'];
    _soundLevel = json['Sound_Level'];
    _voltageRequired = json['Voltage_Required'];
    _listAllAppliancesBeingPowered = json['List_All_Appliances_Being_Powered'];
    _otherDetailsSpecicalRequirementAdditions = json['Other_Details_SpecicalRequirement_Additions'];
  }
  String? _contactName;
  String? _phoneNumber;
  String? _email;
  String? _application;
  String? _frequencyUse;
  String? _operatingHours;
  String? _fuelType;
  String? _startingMethod;
  String? _soundLevel;
  String? _voltageRequired;
  String? _listAllAppliancesBeingPowered;
  String? _otherDetailsSpecicalRequirementAdditions;

  String? get contactName => _contactName;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get application => _application;
  String? get frequencyUse => _frequencyUse;
  String? get operatingHours => _operatingHours;
  String? get fuelType => _fuelType;
  String? get startingMethod => _startingMethod;
  String? get soundLevel => _soundLevel;
  String? get voltageRequired => _voltageRequired;
  String? get listAllAppliancesBeingPowered => _listAllAppliancesBeingPowered;
  String? get otherDetailsSpecicalRequirementAdditions => _otherDetailsSpecicalRequirementAdditions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Contact_Name'] = _contactName;
    map['Phone_Number'] = _phoneNumber;
    map['Email'] = _email;
    map['Application'] = _application;
    map['Frequency_Use'] = _frequencyUse;
    map['Operating_Hours'] = _operatingHours;
    map['Fuel_Type'] = _fuelType;
    map['Starting_Method'] = _startingMethod;
    map['Sound_Level'] = _soundLevel;
    map['Voltage_Required'] = _voltageRequired;
    map['List_All_Appliances_Being_Powered'] = _listAllAppliancesBeingPowered;
    map['Other_Details_SpecicalRequirement_Additions'] = _otherDetailsSpecicalRequirementAdditions;
    return map;
  }

}