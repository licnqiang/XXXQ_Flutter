import 'CompressModelRow.dart';

class CompressMode {
  int code;
  int totle;
  List<CompressModelRow> rows;

  CompressMode({this.code, this.totle, this.rows});

  CompressMode.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    if (json['rows'] != null) {
      rows = new List<CompressModelRow>();
      json['rows'].forEach((v) {
        rows.add(new CompressModelRow.fromJson(v));
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
