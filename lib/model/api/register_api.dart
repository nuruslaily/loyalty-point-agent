import 'package:capstone/model/register_model.dart';
import 'package:dio/dio.dart';

class RegisterAPI{
  static Future<Result?> postRegisterAPI(String email, String password, String fullname, String noHp, int pin) async {
    try {
      print(email);
      print(password);
      print(fullname);
      print(noHp);
      print(pin);
      
      final response = await Dio().post("https://api-poins-id.herokuapp.com/v1/customer/register", data: {"email":email, "password":password, "fullname":fullname, "no_hp":noHp, "pin":pin});
      final register = RegisterModel.fromJson(response.data);
      return register.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
}