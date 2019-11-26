import 'DriverModelRow.dart';

class DriverModel {
  int code;
  int totle;
  List<DriverModelRow> rows;

  DriverModel({this.code, this.totle, this.rows});

  DriverModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != null) {
      rows = new List<DriverModelRow>();
      json['rows'].forEach((v) {
        rows.add(new DriverModelRow.fromJson(v));
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
