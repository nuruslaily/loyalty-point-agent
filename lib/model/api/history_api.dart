import 'package:capstone/model/history_model.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:dio/dio.dart';

class HistoryAPI {
  static Future<List<Result>?> getHistory(String id, String token) async {

    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";
          
      final response = await dio.get("https://api-poins-id.herokuapp.com/v1/history?id=$id&limit=5&page=1&sort=created_at desc");
      
      final history = HistoryModel.fromJson(response.data);
      // print(history.code);
      SharedPref sharedPref = SharedPref();
      sharedPref.save(history.result![int.parse(id)].idTransaction, "id_transaction");
      return history.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}
