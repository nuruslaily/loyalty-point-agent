import 'package:capstone/model/admin/api/dashboard_api.dart';
import 'package:capstone/model/admin/dashboard_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier{
  Result? _dashboard;

  Result? get dashboard => _dashboard;

  Stock? _stok;

  Stock? get stok => _stok;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String?> getDashboard() async {
    changeState(ViewState.loading);

    try {
      print("testpostloginadmin");
      final d = await DashboardAPI.getDashboard();
      _dashboard = d;
      
      changeState(ViewState.none);
      notifyListeners();
      return null;
    } catch (e) {
      print("testpostloginadminerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }
    
  }

  Future<String?> getStockDashboard() async {
    changeState(ViewState.loading);

    try {
      print("testpostloginadmin");
      final s = await DashboardAPI.getStockDashboard();
      _stok = s;
      
      changeState(ViewState.none);
      notifyListeners();
      return null;
    } catch (e) {
      print("testpostloginadminerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }
    
  }

}