import 'package:capstone/model/profile_model.dart';
import 'package:dio/dio.dart';

class ProfileAPI{
  static Future<Result?> updateCustomer(String id, String name, String email, String noHp, String password, String pin, String token) async {

    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";

      final response = await dio.put("https://api-poins-id.herokuapp.com/v1/customer", data: {"id":int.parse(id), "fullname":name, "email": email, "no_hp": noHp, "password": password, "pin":pin});
      final customer = UpdateProfileModel.fromJson(response.data);
      return customer.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}