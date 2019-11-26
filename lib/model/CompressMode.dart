class CompressMode {
  int code;
  int totle;
  List<Rows> rows;

  CompressMode({this.code, this.totle, this.rows});

  CompressMode.fromJson(Map<String, dynamic> json) {
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
  String idYsz;
  String nameYsz;
  String addrYsz;
  double longitudeYsz;
  double latitudeYsz;
  String chargeYsz;
  String telephoneYsz;
  String fixedphoneYsz;
  String lay1Ysz;
  String lay2Ysz;
  String lay3Ysz;
  String lay4Ysz;
  String lay5Ysz;
  String introductionYsz;
  String area;
  String createUserBizysz;
  String createtimeBizysz;
  String updateUserBizysz;
  String updatetimeBizysz;
  String idSysdept;
  String scaleYsz;
  String surfaceYsz;
  String deptNameCount;

  Rows(
      {this.idYsz,
        this.nameYsz,
        this.addrYsz,
        this.longitudeYsz,
        this.latitudeYsz,
        this.chargeYsz,
        this.telephoneYsz,
        this.fixedphoneYsz,
        this.lay1Ysz,
        this.lay2Ysz,
        this.lay3Ysz,
        this.lay4Ysz,
        this.lay5Ysz,
        this.introductionYsz,
        this.area,
        this.createUserBizysz,
        this.createtimeBizysz,
        this.updateUserBizysz,
        this.updatetimeBizysz,
        this.idSysdept,
        this.scaleYsz,
        this.surfaceYsz,
        this.deptNameCount});

  Rows.fromJson(Map<String, dynamic> json) {
    idYsz = json['idYsz'];
    nameYsz = json['nameYsz'];
    addrYsz = json['addrYsz'];
    longitudeYsz = json['longitudeYsz'];
    latitudeYsz = json['latitudeYsz'];
    chargeYsz = json['chargeYsz'];
    telephoneYsz = json['telephoneYsz'];
    fixedphoneYsz = json['fixedphoneYsz'];
    lay1Ysz = json['lay1Ysz'];
    lay2Ysz = json['lay2Ysz'];
    lay3Ysz = json['lay3Ysz'];
    lay4Ysz = json['lay4Ysz'];
    lay5Ysz = json['lay5Ysz'];
    introductionYsz = json['introductionYsz'];
    area = json['area'];
    createUserBizysz = json['createUserBizysz'];
    createtimeBizysz = json['createtimeBizysz'];
    updateUserBizysz = json['updateUserBizysz'];
    updatetimeBizysz = json['updatetimeBizysz'];
    idSysdept = json['idSysdept'];
    scaleYsz = json['scaleYsz'];
    surfaceYsz = json['surfaceYsz'];
    deptNameCount = json['deptNameCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idYsz'] = this.idYsz;
    data['nameYsz'] = this.nameYsz;
    data['addrYsz'] = this.addrYsz;
    data['longitudeYsz'] = this.longitudeYsz;
    data['latitudeYsz'] = this.latitudeYsz;
    data['chargeYsz'] = this.chargeYsz;
    data['telephoneYsz'] = this.telephoneYsz;
    data['fixedphoneYsz'] = this.fixedphoneYsz;
    data['lay1Ysz'] = this.lay1Ysz;
    data['lay2Ysz'] = this.lay2Ysz;
    data['lay3Ysz'] = this.lay3Ysz;
    data['lay4Ysz'] = this.lay4Ysz;
    data['lay5Ysz'] = this.lay5Ysz;
    data['introductionYsz'] = this.introductionYsz;
    data['area'] = this.area;
    data['createUserBizysz'] = this.createUserBizysz;
    data['createtimeBizysz'] = this.createtimeBizysz;
    data['updateUserBizysz'] = this.updateUserBizysz;
    data['updatetimeBizysz'] = this.updatetimeBizysz;
    data['idSysdept'] = this.idSysdept;
    data['scaleYsz'] = this.scaleYsz;
    data['surfaceYsz'] = this.surfaceYsz;
    data['deptNameCount'] = this.deptNameCount;
    return data;
  }
}