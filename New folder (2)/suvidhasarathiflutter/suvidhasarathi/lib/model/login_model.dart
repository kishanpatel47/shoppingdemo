class LoginModel {
  String? returnCode;
  String? returnMsg;
  String? returnValue;
  Data? data;

  LoginModel({this.returnCode, this.returnMsg, this.returnValue, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    returnCode = json['ReturnCode'];
    returnMsg = json['ReturnMsg'];
    returnValue = json['ReturnValue'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReturnCode'] = this.returnCode;
    data['ReturnMsg'] = this.returnMsg;
    data['ReturnValue'] = this.returnValue;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userID;
  String? address;
  String? gender;
  int? profileID;
  String? mobileNumber;
  String? name;
  String? pincode;
  String? panCard;
  String? profession;
  String? profilePic;
  String? state;
  String? district;
  String? block;
  String? cluster;
  Null? village;
  String? email;
  int? roleID;
  int? padPrice;
  bool? isNotificationOn;
  String? roleName;

  Data(
      {this.userID,
      this.address,
      this.gender,
      this.profileID,
      this.mobileNumber,
      this.name,
      this.pincode,
      this.panCard,
      this.profession,
      this.profilePic,
      this.state,
      this.district,
      this.block,
      this.cluster,
      this.village,
      this.email,
      this.roleID,
      this.padPrice,
      this.isNotificationOn,
      this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    address = json['Address'];
    gender = json['Gender'];
    profileID = json['ProfileID'];
    mobileNumber = json['MobileNumber'];
    name = json['Name'];
    pincode = json['Pincode'];
    panCard = json['PanCard'];
    profession = json['Profession'];
    profilePic = json['ProfilePic'];
    state = json['State'];
    district = json['District'];
    block = json['Block'];
    cluster = json['Cluster'];
    village = json['Village'];
    email = json['Email'];
    roleID = json['RoleID'];
    padPrice = json['PadPrice'];
    isNotificationOn = json['IsNotificationOn'];
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['ProfileID'] = this.profileID;
    data['MobileNumber'] = this.mobileNumber;
    data['Name'] = this.name;
    data['Pincode'] = this.pincode;
    data['PanCard'] = this.panCard;
    data['Profession'] = this.profession;
    data['ProfilePic'] = this.profilePic;
    data['State'] = this.state;
    data['District'] = this.district;
    data['Block'] = this.block;
    data['Cluster'] = this.cluster;
    data['Village'] = this.village;
    data['Email'] = this.email;
    data['RoleID'] = this.roleID;
    data['PadPrice'] = this.padPrice;
    data['IsNotificationOn'] = this.isNotificationOn;
    data['RoleName'] = this.roleName;
    return data;
  }
}
