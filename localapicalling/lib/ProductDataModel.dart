
class Records {
  int? id;
  List<int>? employeeId;
  List<int>? departmentId;
  String? checkIn;
  String? checkOut;
  double? workedHours;
  String? sLastUpdate;
  String? displayName;
  List<int>? createUid;
  String? createDate;
  List<int>? writeUid;
  String? writeDate;

  Records(
      {this.id,
      this.employeeId,
      this.departmentId,
      this.checkIn,
      this.checkOut,
      this.workedHours,
      this.sLastUpdate,
      this.displayName,
      this.createUid,
      this.createDate,
      this.writeUid,
      this.writeDate});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'].cast<int>();
    departmentId = json['department_id'].cast<int>();
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    workedHours = json['worked_hours'];
    sLastUpdate = json['__last_update'];
    displayName = json['display_name'];
    createUid = json['create_uid'].cast<int>();
    createDate = json['create_date'];
    writeUid = json['write_uid'].cast<int>();
    writeDate = json['write_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['department_id'] = this.departmentId;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['worked_hours'] = this.workedHours;
    data['__last_update'] = this.sLastUpdate;
    data['display_name'] = this.displayName;
    data['create_uid'] = this.createUid;
    data['create_date'] = this.createDate;
    data['write_uid'] = this.writeUid;
    data['write_date'] = this.writeDate;
    return data;
  }
}