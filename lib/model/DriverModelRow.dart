class DriverModelRow {
  String birthday;
  Null updateUserSysuser;
  Null certfirsttime;
  String idCard;
  String createtimeBizdriver;
  Null remark;
  Null eqccertfirsttime;
  String idSysuser;
  String id;
  Null nativeplace;
  Null eqcNo;
  String idSysdept;
  Null email;
  String driverNo;
  Null yearCheck;
  Null createUserSysuser;
  String address;
  String idType;
  String sex;
  String lay1Sysuser;
  Null lay2Sysuser;
  Null lay3Sysuser;
  Null lay4Sysuser;
  Null telephone;
  Null createTimeSysuser;
  String updatetimeBizdriver;
  String areaCount;
  String idBizdriver;
  Null updateTimeSysuser;
  String deptNameCount;
  Null eqcnumberchecktime;
  String phone;
  Null lay5Sysuser;
  Null createUserBizdriver;
  Null updateUserBizdriver;
  String name;
  String areaIdCount;
  String userType;
  Null job;
  String account;
  Null issueUnit;

  DriverModelRow(
      {this.birthday,
        this.updateUserSysuser,
        this.certfirsttime,
        this.idCard,
        this.createtimeBizdriver,
        this.remark,
        this.eqccertfirsttime,
        this.idSysuser,
        this.id,
        this.nativeplace,
        this.eqcNo,
        this.idSysdept,
        this.email,
        this.driverNo,
        this.yearCheck,
        this.createUserSysuser,
        this.address,
        this.idType,
        this.sex,
        this.lay1Sysuser,
        this.lay2Sysuser,
        this.lay3Sysuser,
        this.lay4Sysuser,
        this.telephone,
        this.createTimeSysuser,
        this.updatetimeBizdriver,
        this.areaCount,
        this.idBizdriver,
        this.updateTimeSysuser,
        this.deptNameCount,
        this.eqcnumberchecktime,
        this.phone,
        this.lay5Sysuser,
        this.createUserBizdriver,
        this.updateUserBizdriver,
        this.name,
        this.areaIdCount,
        this.userType,
        this.job,
        this.account,
        this.issueUnit});

  DriverModelRow.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    updateUserSysuser = json['updateUserSysuser'];
    certfirsttime = json['certfirsttime'];
    idCard = json['idCard'];
    createtimeBizdriver = json['createtimeBizdriver'];
    remark = json['remark'];
    eqccertfirsttime = json['eqccertfirsttime'];
    idSysuser = json['idSysuser'];
    id = json['id'];
    nativeplace = json['nativeplace'];
    eqcNo = json['eqcNo'];
    idSysdept = json['idSysdept'];
    email = json['email'];
    driverNo = json['driverNo'];
    yearCheck = json['yearCheck'];
    createUserSysuser = json['createUserSysuser'];
    address = json['address'];
    idType = json['idType'];
    sex = json['sex'];
    lay1Sysuser = json['lay1Sysuser'];
    lay2Sysuser = json['lay2Sysuser'];
    lay3Sysuser = json['lay3Sysuser'];
    lay4Sysuser = json['lay4Sysuser'];
    telephone = json['telephone'];
    createTimeSysuser = json['createTimeSysuser'];
    updatetimeBizdriver = json['updatetimeBizdriver'];
    areaCount = json['areaCount'];
    idBizdriver = json['idBizdriver'];
    updateTimeSysuser = json['updateTimeSysuser'];
    deptNameCount = json['deptNameCount'];
    eqcnumberchecktime = json['eqcnumberchecktime'];
    phone = json['phone'];
    lay5Sysuser = json['lay5Sysuser'];
    createUserBizdriver = json['createUserBizdriver'];
    updateUserBizdriver = json['updateUserBizdriver'];
    name = json['name'];
    areaIdCount = json['areaIdCount'];
    userType = json['userType'];
    job = json['job'];
    account = json['account'];
    issueUnit = json['issueUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['updateUserSysuser'] = this.updateUserSysuser;
    data['certfirsttime'] = this.certfirsttime;
    data['idCard'] = this.idCard;
    data['createtimeBizdriver'] = this.createtimeBizdriver;
    data['remark'] = this.remark;
    data['eqccertfirsttime'] = this.eqccertfirsttime;
    data['idSysuser'] = this.idSysuser;
    data['id'] = this.id;
    data['nativeplace'] = this.nativeplace;
    data['eqcNo'] = this.eqcNo;
    data['idSysdept'] = this.idSysdept;
    data['email'] = this.email;
    data['driverNo'] = this.driverNo;
    data['yearCheck'] = this.yearCheck;
    data['createUserSysuser'] = this.createUserSysuser;
    data['address'] = this.address;
    data['idType'] = this.idType;
    data['sex'] = this.sex;
    data['lay1Sysuser'] = this.lay1Sysuser;
    data['lay2Sysuser'] = this.lay2Sysuser;
    data['lay3Sysuser'] = this.lay3Sysuser;
    data['lay4Sysuser'] = this.lay4Sysuser;
    data['telephone'] = this.telephone;
    data['createTimeSysuser'] = this.createTimeSysuser;
    data['updatetimeBizdriver'] = this.updatetimeBizdriver;
    data['areaCount'] = this.areaCount;
    data['idBizdriver'] = this.idBizdriver;
    data['updateTimeSysuser'] = this.updateTimeSysuser;
    data['deptNameCount'] = this.deptNameCount;
    data['eqcnumberchecktime'] = this.eqcnumberchecktime;
    data['phone'] = this.phone;
    data['lay5Sysuser'] = this.lay5Sysuser;
    data['createUserBizdriver'] = this.createUserBizdriver;
    data['updateUserBizdriver'] = this.updateUserBizdriver;
    data['name'] = this.name;
    data['areaIdCount'] = this.areaIdCount;
    data['userType'] = this.userType;
    data['job'] = this.job;
    data['account'] = this.account;
    data['issueUnit'] = this.issueUnit;
    return data;
  }
}