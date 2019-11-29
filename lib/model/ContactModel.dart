class ContactModel {
  int code;
  int totle;
  List<Rows> rows;

  ContactModel({this.code, this.totle, this.rows});

  ContactModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['totle'] = this.totle;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String birthday;
  Null updateUserSysuser;
  String id;
  String idSysdept;
  String email;
  Null createUserSysuser;
  String address;
  String sex;
  String lay1Sysuser;
  Null lay2Sysuser;
  Null lay3Sysuser;
  Null lay4Sysuser;
  Null telephone;
  String createTimeSysuser;
  int rowId;
  String areaCount;
  String updateTimeSysuser;
  String deptNameCount;
  String phone;
  Null lay5Sysuser;
  String name;
  String areaIdCount;
  String userType;
  String job;
  String account;

  Rows(
      {this.birthday,
        this.updateUserSysuser,
        this.id,
        this.idSysdept,
        this.email,
        this.createUserSysuser,
        this.address,
        this.sex,
        this.lay1Sysuser,
        this.lay2Sysuser,
        this.lay3Sysuser,
        this.lay4Sysuser,
        this.telephone,
        this.createTimeSysuser,
        this.rowId,
        this.areaCount,
        this.updateTimeSysuser,
        this.deptNameCount,
        this.phone,
        this.lay5Sysuser,
        this.name,
        this.areaIdCount,
        this.userType,
        this.job,
        this.account});

  Rows.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    updateUserSysuser = json['updateUserSysuser'];
    id = json['id'];
    idSysdept = json['idSysdept'];
    email = json['email'];
    createUserSysuser = json['createUserSysuser'];
    address = json['address'];
    sex = json['sex'];
    lay1Sysuser = json['lay1Sysuser'];
    lay2Sysuser = json['lay2Sysuser'];
    lay3Sysuser = json['lay3Sysuser'];
    lay4Sysuser = json['lay4Sysuser'];
    telephone = json['telephone'];
    createTimeSysuser = json['createTimeSysuser'];
    rowId = json['rowId'];
    areaCount = json['areaCount'];
    updateTimeSysuser = json['updateTimeSysuser'];
    deptNameCount = json['deptNameCount'];
    phone = json['phone'];
    lay5Sysuser = json['lay5Sysuser'];
    name = json['name'];
    areaIdCount = json['areaIdCount'];
    userType = json['userType'];
    job = json['job'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['updateUserSysuser'] = this.updateUserSysuser;
    data['id'] = this.id;
    data['idSysdept'] = this.idSysdept;
    data['email'] = this.email;
    data['createUserSysuser'] = this.createUserSysuser;
    data['address'] = this.address;
    data['sex'] = this.sex;
    data['lay1Sysuser'] = this.lay1Sysuser;
    data['lay2Sysuser'] = this.lay2Sysuser;
    data['lay3Sysuser'] = this.lay3Sysuser;
    data['lay4Sysuser'] = this.lay4Sysuser;
    data['telephone'] = this.telephone;
    data['createTimeSysuser'] = this.createTimeSysuser;
    data['rowId'] = this.rowId;
    data['areaCount'] = this.areaCount;
    data['updateTimeSysuser'] = this.updateTimeSysuser;
    data['deptNameCount'] = this.deptNameCount;
    data['phone'] = this.phone;
    data['lay5Sysuser'] = this.lay5Sysuser;
    data['name'] = this.name;
    data['areaIdCount'] = this.areaIdCount;
    data['userType'] = this.userType;
    data['job'] = this.job;
    data['account'] = this.account;
    return data;
  }
}
