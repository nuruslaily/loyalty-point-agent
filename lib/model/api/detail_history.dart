import 'package:capstone/model/detail_history_model.dart';
import 'package:dio/dio.dart';

class DetailHistoryAPI{
  static Future<Result?> detailHistory(String id_transaction, String token) async {

    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";
          
      final response = await dio.get("https://api-poins-id.herokuapp.com/v1/dethistory/$id_transaction");
      
      final detailHistory = DetailHistoryModel.fromJson(response.data);
      // print(history.code);
      return detailHistory.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}