
import 'package:capstone/model/api/detail_history.dart';
import 'package:capstone/model/detail_history_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class DetailHistoryViewModel with ChangeNotifier{
  Result? _detailHistory;
  Result? get detailHistory => _detailHistory;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  getDetailHistory(String idTransaction, String token) async {
    changeState(ViewState.loading);

    try {
      final dh = await DetailHistoryAPI.detailHistory(idTransaction, token);
      _detailHistory = dh;
      changeState(ViewState.none);
      notifyListeners();
      return dh;
    } catch (e) {
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }
  }
}