class RegisterModel {
  int? code;
  String? messages;
  Result? result;

  RegisterModel({this.code, this.messages, this.result});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? fullname;
  String? password;
  String? noHp;
  int? pin;

  Result({this.email, this.fullname, this.password, this.noHp, this.pin});

  Result.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
    password = json['password'];
    noHp = json['no_hp'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['password'] = this.password;
    data['no_hp'] = this.noHp;
    data['pin'] = this.pin;
    return data;
  }
}