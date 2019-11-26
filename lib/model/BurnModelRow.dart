class BurnModelRow {
  String idFsc;
  String nameFsc;
  Null addrFsc;
  Null longitudeFsc;
  Null latitudeFsc;
  Null chargeFsc;
  Null phoneFsc;
  Null telephoneFsc;
  Null lay1Fsc;
  Null lay2Fsc;
  Null lay3Fsc;
  Null lay4Fsc;
  Null lay5Fsc;
  Null introduction;
  Null area;
  Null createUserBizfsc;
  String createtimeBizfsc;
  Null updateUserBizfsc;
  String updatetimeBizfsc;
  String idSysdept;
  Null scaleYsz;
  Null deptNameCount;

  BurnModelRow(
      {this.idFsc,
        this.nameFsc,
        this.addrFsc,
        this.longitudeFsc,
        this.latitudeFsc,
        this.chargeFsc,
        this.phoneFsc,
        this.telephoneFsc,
        this.lay1Fsc,
        this.lay2Fsc,
        this.lay3Fsc,
        this.lay4Fsc,
        this.lay5Fsc,
        this.introduction,
        this.area,
        this.createUserBizfsc,
        this.createtimeBizfsc,
        this.updateUserBizfsc,
        this.updatetimeBizfsc,
        this.idSysdept,
        this.scaleYsz,
        this.deptNameCount});

  BurnModelRow.fromJson(Map<String, dynamic> json) {
    idFsc = json['idFsc'];
    nameFsc = json['nameFsc'];
    addrFsc = json['addrFsc'];
    longitudeFsc = json['longitudeFsc'];
    latitudeFsc = json['latitudeFsc'];
    chargeFsc = json['chargeFsc'];
    phoneFsc = json['phoneFsc'];
    telephoneFsc = json['telephoneFsc'];
    lay1Fsc = json['lay1Fsc'];
    lay2Fsc = json['lay2Fsc'];
    lay3Fsc = json['lay3Fsc'];
    lay4Fsc = json['lay4Fsc'];
    lay5Fsc = json['lay5Fsc'];
    introduction = json['introduction'];
    area = json['area'];
    createUserBizfsc = json['createUserBizfsc'];
    createtimeBizfsc = json['createtimeBizfsc'];
    updateUserBizfsc = json['updateUserBizfsc'];
    updatetimeBizfsc = json['updatetimeBizfsc'];
    idSysdept = json['idSysdept'];
    scaleYsz = json['scaleYsz'];
    deptNameCount = json['deptNameCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idFsc'] = this.idFsc;
    data['nameFsc'] = this.nameFsc;
    data['addrFsc'] = this.addrFsc;
    data['longitudeFsc'] = this.longitudeFsc;
    data['latitudeFsc'] = this.latitudeFsc;
    data['chargeFsc'] = this.chargeFsc;
    data['phoneFsc'] = this.phoneFsc;
    data['telephoneFsc'] = this.telephoneFsc;
    data['lay1Fsc'] = this.lay1Fsc;
    data['lay2Fsc'] = this.lay2Fsc;
    data['lay3Fsc'] = this.lay3Fsc;
    data['lay4Fsc'] = this.lay4Fsc;
    data['lay5Fsc'] = this.lay5Fsc;
    data['introduction'] = this.introduction;
    data['area'] = this.area;
    data['createUserBizfsc'] = this.createUserBizfsc;
    data['createtimeBizfsc'] = this.createtimeBizfsc;
    data['updateUserBizfsc'] = this.updateUserBizfsc;
    data['updatetimeBizfsc'] = this.updatetimeBizfsc;
    data['idSysdept'] = this.idSysdept;
    data['scaleYsz'] = this.scaleYsz;
    data['deptNameCount'] = this.deptNameCount;
    return data;
  }
}