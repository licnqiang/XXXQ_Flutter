class UserModel {
  String msg;
  int code;
  Data data;

  UserModel({this.msg, this.code, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Null> menus;
  String power;
  User user;
  String token;

  Data({this.menus, this.power, this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
 /*   if (json['menus'] != null) {
      menus = new List<Null>();
      json['menus'].forEach((v) {
        menus.add(new Null.fromJson(v));
      });
    }*/
    power = json['power'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  /*  if (this.menus != null) {
      data['menus'] = this.menus.map((v) => v.toJson()).toList();
    }*/
    data['power'] = this.power;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String id;
  String userType;
  String account;
  String phone;
  Null telephone;
  String address;
  String name;
  String sex;
  String birthday;
  Null email;
  Null job;
  String idSysdept;
  Null updateTimeSysuser;
  Null createTimeSysuser;
  Null updateUserSysuser;
  Null createUserSysuser;
  Null token;
  String status;
  Null onlineTime;
  String lay1Sysuser;
  Null lay2Sysuser;
  Null lay3Sysuser;
  Null lay4Sysuser;
  Null lay5Sysuser;
  String deptNameCount;
  String yszIdCount;
  String yszNameCount;

  User(
      {this.id,
        this.userType,
        this.account,
        this.phone,
        this.telephone,
        this.address,
        this.name,
        this.sex,
        this.birthday,
        this.email,
        this.job,
        this.idSysdept,
        this.updateTimeSysuser,
        this.createTimeSysuser,
        this.updateUserSysuser,
        this.createUserSysuser,
        this.token,
        this.status,
        this.onlineTime,
        this.lay1Sysuser,
        this.lay2Sysuser,
        this.lay3Sysuser,
        this.lay4Sysuser,
        this.lay5Sysuser,
        this.deptNameCount,
        this.yszIdCount,
        this.yszNameCount});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['userType'];
    account = json['account'];
    phone = json['phone'];
    telephone = json['telephone'];
    address = json['address'];
    name = json['name'];
    sex = json['sex'];
    birthday = json['birthday'];
    email = json['email'];
    job = json['job'];
    idSysdept = json['idSysdept'];
    updateTimeSysuser = json['updateTimeSysuser'];
    createTimeSysuser = json['createTimeSysuser'];
    updateUserSysuser = json['updateUserSysuser'];
    createUserSysuser = json['createUserSysuser'];
    token = json['token'];
    status = json['status'];
    onlineTime = json['onlineTime'];
    lay1Sysuser = json['lay1Sysuser'];
    lay2Sysuser = json['lay2Sysuser'];
    lay3Sysuser = json['lay3Sysuser'];
    lay4Sysuser = json['lay4Sysuser'];
    lay5Sysuser = json['lay5Sysuser'];
    deptNameCount = json['deptNameCount'];
    yszIdCount = json['yszIdCount'];
    yszNameCount = json['yszNameCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userType'] = this.userType;
    data['account'] = this.account;
    data['phone'] = this.phone;
    data['telephone'] = this.telephone;
    data['address'] = this.address;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['email'] = this.email;
    data['job'] = this.job;
    data['idSysdept'] = this.idSysdept;
    data['updateTimeSysuser'] = this.updateTimeSysuser;
    data['createTimeSysuser'] = this.createTimeSysuser;
    data['updateUserSysuser'] = this.updateUserSysuser;
    data['createUserSysuser'] = this.createUserSysuser;
    data['token'] = this.token;
    data['status'] = this.status;
    data['onlineTime'] = this.onlineTime;
    data['lay1Sysuser'] = this.lay1Sysuser;
    data['lay2Sysuser'] = this.lay2Sysuser;
    data['lay3Sysuser'] = this.lay3Sysuser;
    data['lay4Sysuser'] = this.lay4Sysuser;
    data['lay5Sysuser'] = this.lay5Sysuser;
    data['deptNameCount'] = this.deptNameCount;
    data['yszIdCount'] = this.yszIdCount;
    data['yszNameCount'] = this.yszNameCount;
    return data;
  }
}
