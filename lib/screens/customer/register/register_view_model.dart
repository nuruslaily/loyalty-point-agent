import 'package:capstone/model/api/register_api.dart';
import 'package:capstone/model/register_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel with ChangeNotifier{
  Result? _register;

  Result? get register => _register;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String> postRegister(String email, String password, String fullname, String noHp, int pin) async {
    changeState(ViewState.loading);

    try {
      print("testpostregister");
      final r = await RegisterAPI.postRegisterAPI(email, password, fullname, noHp, pin);
      _register = r;
      print(_register);
      changeState(ViewState.none);
      notifyListeners();
      return "";
    } catch (e) {
      print("testpostregistererror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }

  // Future<String> postPINRegister(String pin) async {
  //   changeState(ViewState.loading);

  //   try {
  //     print("testpostregister");
  //     final p = await RegisterAPI.postPINRegister(pin);
  //     _pin_register = p;
  //     changeState(ViewState.none);
  //     notifyListeners();
  //     return "";
  //   } catch (e) {
  //     print("testpostregistererror $e");
  //     changeState(ViewState.error);
  //     notifyListeners();
  //     return "$e";
  //   }    
  // }

}