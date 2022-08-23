class DetailHistoryModel {
  int? code;
  String? messages;
  Result? result;

  DetailHistoryModel({this.code, this.messages, this.result});

  DetailHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionId;
  String? transactionType;
  String? createdat;
  String? bankProvider;
  String? nomor;
  int? amount;
  int? poinAccount;
  int? poinRedeem;
  String? description;
  String? statusTransaction;

  Result(
      {this.transactionId,
      this.transactionType,
      this.createdat,
      this.bankProvider,
      this.nomor,
      this.amount,
      this.poinAccount,
      this.poinRedeem,
      this.description,
      this.statusTransaction});

  Result.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    transactionType = json['transaction_type'];
    createdat = json['createdat'];
    bankProvider = json['bank_provider'];
    nomor = json['nomor'];
    amount = json['amount'];
    poinAccount = json['poin_account'];
    poinRedeem = json['poin_redeem'];
    description = json['description'];
    statusTransaction = json['status_transaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['transaction_type'] = this.transactionType;
    data['createdat'] = this.createdat;
    data['bank_provider'] = this.bankProvider;
    data['nomor'] = this.nomor;
    data['amount'] = this.amount;
    data['poin_account'] = this.poinAccount;
    data['poin_redeem'] = this.poinRedeem;
    data['description'] = this.description;
    data['status_transaction'] = this.statusTransaction;
    return data;
  }
}