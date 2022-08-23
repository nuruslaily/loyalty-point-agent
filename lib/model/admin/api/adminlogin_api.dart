import 'package:capstone/model/admin/adminlogin_model.dart';
import 'package:dio/dio.dart';

class AdminLoginAPI {
  static Future<Result?> postAdminLogin(String email, String password) async {
    var _dio = Dio();
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));

    try {
      final response = await _dio.post(
          "https://api-poins-id.herokuapp.com/v1/admin/login",
          data: {"email": email, "password": password});
      final loginAdmin = AdminLoginModel.fromJson(response.data);
      print(response.statusCode);

      return loginAdmin.result;
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
}
