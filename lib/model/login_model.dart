class LoginModel {
  int? code;
  String? messages;
  Result? result;

  LoginModel({this.code, this.messages, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? email;
  String? fullname;
  String? password;
  String? noHp;
  int? poin;
  int? pin;
  String? token;

  Result(
      {this.id,
      this.email,
      this.fullname,
      this.password,
      this.noHp,
      this.poin,
      this.pin,
      this.token});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    password = json['password'];
    noHp = json['no_hp'];
    poin = json['poin'];
    pin = json['pin'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['password'] = this.password;
    data['no_hp'] = this.noHp;
    data['poin'] = this.poin;
    data['pin'] = this.pin;
    data['token'] = this.token;
    return data;
  }
}