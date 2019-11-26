import 'BurnModelRow.dart';

class BurnModel {
  int code;
  int totle;
  List<BurnModelRow> rows;

  BurnModel({this.code, this.totle, this.rows});

  BurnModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != null) {
      rows = new List<BurnModelRow>();
      json['rows'].forEach((v) {
        rows.add(new BurnModelRow.fromJson(v));
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
