class CarNumModel {
  int code;
  int totle;
  List<Rows> rows;

  CarNumModel({this.code, this.totle, this.rows});

  CarNumModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != String) {
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
    if (this.rows != String) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int vid;
  String licensePlate;
  String licensePlateColor;
  String vtId;
  String vehicleType;
  String vehicleNationality;
  String maintMiles;
  String yearExamine;
  String insuranceDate;
  String owner;
  String ownertel;
  String transIndustryType;
  String roadTransportSn;
  String remark;
  String idSysdept;
  String gpsOemType;
  String terminalType;
  String terminalId;
  String avlid;
  String simcardNo;
  String manufacturerId;
  String initmileage;
  String accOffDbInterval;
  int camNum;
  String ledType;
  String vehicleStatus;
  String fixTime;
  String fixlocation;
  String fixer;
  String relativetel;
  String lastMaintMiles;
  String vedioNum;
  String businessmag;
  String vehicleClass;
  String transportMechanism;
  String owersName;
  String owersTel;
  String owersId;
  String deviceId;
  String videoType;
  String videoSource;
  String m2mcardNo;
  String photo;
  String driverids;
  String externalId;
  String externalType;
  String dueTime;
  String managePassword;
  String carState;
  String deptNameCount;

  Rows(
      {this.vid,
        this.licensePlate,
        this.licensePlateColor,
        this.vtId,
        this.vehicleType,
        this.vehicleNationality,
        this.maintMiles,
        this.yearExamine,
        this.insuranceDate,
        this.owner,
        this.ownertel,
        this.transIndustryType,
        this.roadTransportSn,
        this.remark,
        this.idSysdept,
        this.gpsOemType,
        this.terminalType,
        this.terminalId,
        this.avlid,
        this.simcardNo,
        this.manufacturerId,
        this.initmileage,
        this.accOffDbInterval,
        this.camNum,
        this.ledType,
        this.vehicleStatus,
        this.fixTime,
        this.fixlocation,
        this.fixer,
        this.relativetel,
        this.lastMaintMiles,
        this.vedioNum,
        this.businessmag,
        this.vehicleClass,
        this.transportMechanism,
        this.owersName,
        this.owersTel,
        this.owersId,
        this.deviceId,
        this.videoType,
        this.videoSource,
        this.m2mcardNo,
        this.photo,
        this.driverids,
        this.externalId,
        this.externalType,
        this.dueTime,
        this.managePassword,
        this.carState,
        this.deptNameCount});

  Rows.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    licensePlate = json['licensePlate'];
    licensePlateColor = json['licensePlateColor'];
    vtId = json['vtId'];
    vehicleType = json['vehicleType'];
    vehicleNationality = json['vehicleNationality'];
    maintMiles = json['maintMiles'];
    yearExamine = json['yearExamine'];
    insuranceDate = json['insuranceDate'];
    owner = json['owner'];
    ownertel = json['ownertel'];
    transIndustryType = json['transIndustryType'];
    roadTransportSn = json['roadTransportSn'];
    remark = json['remark'];
    idSysdept = json['idSysdept'];
    gpsOemType = json['gpsOemType'];
    terminalType = json['terminalType'];
    terminalId = json['terminalId'];
    avlid = json['avlid'];
    simcardNo = json['simcardNo'];
    manufacturerId = json['manufacturerId'];
    initmileage = json['initmileage'];
    accOffDbInterval = json['accOffDbInterval'];
    camNum = json['camNum'];
    ledType = json['ledType'];
    vehicleStatus = json['vehicleStatus'];
    fixTime = json['fixTime'];
    fixlocation = json['fixlocation'];
    fixer = json['fixer'];
    relativetel = json['relativetel'];
    lastMaintMiles = json['lastMaintMiles'];
    vedioNum = json['vedioNum'];
    businessmag = json['businessmag'];
    vehicleClass = json['vehicleClass'];
    transportMechanism = json['transportMechanism'];
    owersName = json['owersName'];
    owersTel = json['owersTel'];
    owersId = json['owersId'];
    deviceId = json['deviceId'];
    videoType = json['videoType'];
    videoSource = json['videoSource'];
    m2mcardNo = json['m2mcardNo'];
    photo = json['photo'];
    driverids = json['driverids'];
    externalId = json['externalId'];
    externalType = json['externalType'];
    dueTime = json['dueTime'];
    managePassword = json['managePassword'];
    carState = json['carState'];
    deptNameCount = json['deptNameCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['licensePlate'] = this.licensePlate;
    data['licensePlateColor'] = this.licensePlateColor;
    data['vtId'] = this.vtId;
    data['vehicleType'] = this.vehicleType;
    data['vehicleNationality'] = this.vehicleNationality;
    data['maintMiles'] = this.maintMiles;
    data['yearExamine'] = this.yearExamine;
    data['insuranceDate'] = this.insuranceDate;
    data['owner'] = this.owner;
    data['ownertel'] = this.ownertel;
    data['transIndustryType'] = this.transIndustryType;
    data['roadTransportSn'] = this.roadTransportSn;
    data['remark'] = this.remark;
    data['idSysdept'] = this.idSysdept;
    data['gpsOemType'] = this.gpsOemType;
    data['terminalType'] = this.terminalType;
    data['terminalId'] = this.terminalId;
    data['avlid'] = this.avlid;
    data['simcardNo'] = this.simcardNo;
    data['manufacturerId'] = this.manufacturerId;
    data['initmileage'] = this.initmileage;
    data['accOffDbInterval'] = this.accOffDbInterval;
    data['camNum'] = this.camNum;
    data['ledType'] = this.ledType;
    data['vehicleStatus'] = this.vehicleStatus;
    data['fixTime'] = this.fixTime;
    data['fixlocation'] = this.fixlocation;
    data['fixer'] = this.fixer;
    data['relativetel'] = this.relativetel;
    data['lastMaintMiles'] = this.lastMaintMiles;
    data['vedioNum'] = this.vedioNum;
    data['businessmag'] = this.businessmag;
    data['vehicleClass'] = this.vehicleClass;
    data['transportMechanism'] = this.transportMechanism;
    data['owersName'] = this.owersName;
    data['owersTel'] = this.owersTel;
    data['owersId'] = this.owersId;
    data['deviceId'] = this.deviceId;
    data['videoType'] = this.videoType;
    data['videoSource'] = this.videoSource;
    data['m2mcardNo'] = this.m2mcardNo;
    data['photo'] = this.photo;
    data['driverids'] = this.driverids;
    data['externalId'] = this.externalId;
    data['externalType'] = this.externalType;
    data['dueTime'] = this.dueTime;
    data['managePassword'] = this.managePassword;
    data['carState'] = this.carState;
    data['deptNameCount'] = this.deptNameCount;
    return data;
  }
}