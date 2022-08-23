import 'package:capstone/model/admin/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardAPI {
  static Future<Result?> getDashboard() async {

    try {
      
      final response = await Dio().get("https://api-poins-id.herokuapp.com/v1/admin");
      
      final dashboard = DashboardModel.fromJson(response.data);
      return dashboard.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }

  static Future<Stock> getStockDashboard() async {

    try {
      
      final response = await Dio().get("https://api-poins-id.herokuapp.com/v1/admin");
      
      final stock = Stock.fromJson(response.data);
      return stock;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}
