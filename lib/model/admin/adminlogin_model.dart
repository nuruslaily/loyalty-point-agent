class AdminLoginModel {
  int? code;
  String? message;
  Result? result;

  AdminLoginModel({this.code, this.message, this.result});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? email;
  String? password;
  String? fullname;
  String? noHp;
  String? token;

  Result(
      {this.id,
      this.email,
      this.password,
      this.fullname,
      this.noHp,
      this.token});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fullname = json['fullname'];
    noHp = json['no_hp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['no_hp'] = this.noHp;
    data['token'] = this.token;
    return data;
  }
}