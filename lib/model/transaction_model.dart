class TransactionModel {
  int? code;
  String? messages;

  TransactionModel({this.code, this.messages});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    return data;
  }
}