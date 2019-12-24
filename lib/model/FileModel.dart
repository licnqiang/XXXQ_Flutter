
class FileModel {
  int code;
  int totle;
  String data;

  FileModel({this.code, this.totle, this.data});

  FileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    totle = json['totle'];
    data = json['data'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['totle'] = this.totle;
    data['data'] = this.data;
    return data;
  }
}
