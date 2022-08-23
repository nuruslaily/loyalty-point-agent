class HistoryModel {
  int? code;
  String? messages;
  Pagination? pagination;
  List<Result>? result;

  HistoryModel({this.code, this.messages, this.pagination, this.result});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? limit;
  int? page;
  String? sort;

  Pagination({this.limit, this.page, this.sort});

  Pagination.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['sort'] = this.sort;
    return data;
  }
}

class Result {
  int? id;
  String? idTransaction;
  String? transactionType;
  String? createdat;
  String? statusTransaction;

  Result(
      {this.id,
      this.idTransaction,
      this.transactionType,
      this.createdat,
      this.statusTransaction});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTransaction = json['id_transaction'];
    transactionType = json['transaction_type'];
    createdat = json['createdat'];
    statusTransaction = json['status_transaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_transaction'] = this.idTransaction;
    data['transaction_type'] = this.transactionType;
    data['createdat'] = this.createdat;
    data['status_transaction'] = this.statusTransaction;
    return data;
  }
}