import 'CarNumModelRow.dart';

class CarNumModel {
  int code;
  int totle;
  List<CarNumModelRow> rows;

  CarNumModel({this.code, this.totle, this.rows});

  CarNumModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != String) {
      rows = new List<CarNumModelRow>();
      json['rows'].forEach((v) {
        rows.add(new CarNumModelRow.fromJson(v));
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
