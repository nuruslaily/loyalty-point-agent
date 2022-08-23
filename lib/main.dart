import 'package:capstone/screens/admin/dashboard/dashboard_view_model.dart';
import 'package:capstone/screens/admin/login/admin_login_view_model.dart';
import 'package:capstone/screens/customer/history/detail_transaksi/detail_transaksi_viewmodel.dart';
import 'package:capstone/screens/customer/history/history_view_model.dart';
import 'package:capstone/screens/customer/login/login_view_model.dart';
import 'package:capstone/screens/customer/profile/profile_view_model.dart';
import 'package:capstone/screens/customer/register/register_view_model.dart';
import 'package:capstone/screens/customer/transaction/transaction_view_model.dart';
import 'package:capstone/splash_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryViewModel(),
        ),
         ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailHistoryViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminLoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Point.ID',
        theme: ThemeData(
          primaryColor: primaryColor
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
