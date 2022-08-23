import 'package:capstone/model/transaction_model.dart';
import 'package:dio/dio.dart';

class TransactionAPI {

  static Future<TransactionModel?> redeemEMoney(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinRedeem, String token, String pin) async {
    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";

      final response = await dio.post("https://api-poins-id.herokuapp.com/v1/emoney", data: {"Customer_id": int.parse(customerId), "bank_provider":bankProvider, "nomor":nomor, "an_rekening":anRekening, "amount": int.parse(amount), "poin_redeem": int.parse(poinRedeem), "pin":int.parse(pin)});
      final emoney = TransactionModel.fromJson(response.data);
      return emoney;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }

  static Future<TransactionModel> redeemPulsa(String customerId, String bankProvider, String nomor, String poinRedeem, String amount, String token, String pin) async {
    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";

      final response = await dio.post("https://api-poins-id.herokuapp.com/v1/pulsa", data: {"customer_id": int.parse(customerId), "bank_provider":bankProvider, "nomor":nomor, "poin_redeem": int.parse(poinRedeem), "amount": int.parse(amount), "pin":int.parse(pin)});
      final pulsa = TransactionModel.fromJson(response.data);
      return pulsa;
  
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }

  static Future<TransactionModel> redeemPaketData(String customerId, String bankProvider, String nomor, String poinRedeem, String amount, String token, String pin) async {
    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";

      final response = await dio.post("https://api-poins-id.herokuapp.com/v1/paketdata", data: {"customer_id": int.parse(customerId), "bank_provider":bankProvider, "nomor":nomor, "poin_redeem": int.parse(poinRedeem), "amount": int.parse(amount), "pin":int.parse(pin)});
      final paketdata = TransactionModel.fromJson(response.data);
      return paketdata;
  
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
  
  static Future<TransactionModel> redeemCashOut(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinRedeem, String token, String pin) async {
    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";

      final response = await dio.post("https://api-poins-id.herokuapp.com/v1/cashout", data: {"Customer_id": int.parse(customerId), "bank_provider":bankProvider, "nomor":nomor, "an_rekening":anRekening, "amount": int.parse(amount), "poin_redeem": int.parse(poinRedeem), "pin":int.parse(pin)});
      final cashout = TransactionModel.fromJson(response.data);
      return cashout;
  
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
}
