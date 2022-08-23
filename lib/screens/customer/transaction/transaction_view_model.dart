import 'package:capstone/model/api/transaction_api.dart';
import 'package:capstone/model/transaction_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class TransactionViewModel with ChangeNotifier{
  TransactionModel? _transaction;
  TransactionModel? get transaction => _transaction;

  int? _emoney;

  int? get emoney => _emoney;

  List<String> _cashout = [];

  List<String> get cashout => _cashout;

   List<String> _paketData = [];

  List<String> get paketData => _paketData;

  List<String> _pulsa = [];

  List<String> get pulsa => _pulsa;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String> postEMoney(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinRedeem, String token, String pin) async {
    changeState(ViewState.loading);

    try {
      print("testpostredeememoney");
      final e = await TransactionAPI.redeemEMoney(customerId, bankProvider, nomor, anRekening, amount, poinRedeem, token, pin);
      // _transaction = e;
      changeState(ViewState.none);
      notifyListeners();
      return '${e!.code}';
    } catch (e) {
      print("testpostredeememoneyerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }

  Future<String> postPulsa(String customerId, String bankProvider, String nomor, String amount, String poinRedeem, String token, String pin) async {
    changeState(ViewState.loading);

    try {
      print("testpostredeempulsa");
      final t = await TransactionAPI.redeemPulsa(customerId, bankProvider, nomor, amount, poinRedeem, token, pin);
      // _transaction = t;
      changeState(ViewState.none);
      notifyListeners();
      return '${t.code}';
    } catch (e) {
      print("testpostredeempulsaerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }

  Future<String> postPaketData(String customerId, String bankProvider, String nomor, String poinRedeem, String amount, String token, String pin) async {
    changeState(ViewState.loading);

    try {
      print("testpostredeempaketdata");
      final t = await TransactionAPI.redeemPaketData(customerId, bankProvider, nomor, poinRedeem,  amount, token, pin);
      // _transaction = t;
      changeState(ViewState.none);
      notifyListeners();
      return '${t.code}';
    } catch (e) {
      print("testpostredeempaketdataerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }

  Future<String> postCashout(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinRedeem, String token, String pin) async {
    changeState(ViewState.loading);

    try {
      print("testpostredeemcashout");
      final e = await TransactionAPI.redeemCashOut(customerId, bankProvider, nomor, anRekening, amount, poinRedeem, token, pin);
      // _transaction = e;
      changeState(ViewState.none);
      notifyListeners();
      return '${e.code}';
    } catch (e) {
      print("testpostredeemecashouterror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }
}