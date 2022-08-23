class DashboardModel {
  int? code;
  String? messages;
  Result? result;

  DashboardModel({this.code, this.messages, this.result});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  int? today;
  List<Stock>? stock;
  List<Month>? month;

  Result({this.today, this.stock, this.month});

  Result.fromJson(Map<String, dynamic> json) {
    today = json['today'];
    if (json['stock'] != null) {
      stock = <Stock>[];
      json['stock'].forEach((v) {
        stock!.add(new Stock.fromJson(v));
      });
    }
    if (json['month'] != null) {
      month = <Month>[];
      json['month'].forEach((v) {
        month!.add(new Month.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today'] = this.today;
    if (this.stock != null) {
      data['stock'] = this.stock!.map((v) => v.toJson()).toList();
    }
    if (this.month != null) {
      data['month'] = this.month!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stock {
  int? id;
  String? product;
  int? balance;

  Stock({this.id, this.product, this.balance});

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['balance'] = this.balance;
    return data;
  }
}

class Month {
  String? day;
  int? count;

  Month({this.day, this.count});

  Month.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['count'] = this.count;
    return data;
  }
}