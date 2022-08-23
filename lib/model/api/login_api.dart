import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPI {
  static Future<Result?> postLogin(String email, String password) async {
    var _dio = Dio();
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));

    try {
      final response = await _dio.post(
          "https://api-poins-id.herokuapp.com/v1/customer",
          data: {"email": email, "password": password});
      final login = LoginModel.fromJson(response.data);
      print(response.statusCode);
      //login.result set preferences
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('login', jsonEncode(login.result));
      SharedPref sharedPref = SharedPref();
      sharedPref.save(login.result!.id, "id");
      sharedPref.save(login.result!.email, "email");
      sharedPref.save(login.result!.fullname, "fullname");
      sharedPref.save(login.result!.password, "password");
      sharedPref.save(login.result!.poin, "poin");
      sharedPref.save(login.result!.token, "token");
      sharedPref.save(login.result!.noHp, "no_hp");
      sharedPref.save(login.result!.pin, "pin");
      // sharedPref.read("login");
      return login.result;
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
}
