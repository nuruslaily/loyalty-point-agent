import 'package:capstone/model/api/history_api.dart';
import 'package:capstone/model/history_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class HistoryViewModel with ChangeNotifier{
  List<Result> _history = [];
  List<Result> get history => _history;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  getHistory(String id, String token) async {
    changeState(ViewState.loading);

    try {
      final h = await HistoryAPI.getHistory(id, token);
      _history = h!;
      changeState(ViewState.none);
      notifyListeners();
      // return h;
    } catch (e) {
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }
  }
}