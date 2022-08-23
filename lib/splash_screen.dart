import 'package:capstone/after_splash_screen.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // checkLogin();
    const delay = Duration(seconds: 3);
    Future.delayed(delay, () => checkLogin());
  }

  checkLogin() async {
    SharedPref sharedPref = SharedPref();
    String? token = await sharedPref.read("token");
    String? fullname = await sharedPref.read("fullname");
    String? noHp = await sharedPref.read("no_hp");
    String? poin = await sharedPref.read("poin");
    print("token: $token");
    print("fullname: $fullname");
    print("noHp: $noHp");
    print("poin: $poin");
    if (token != null) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const BottomNavigationScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const AfterSplashScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    }
  }

  // void onTimerFinished() {
    //buat kondisi check login
    //check preferences value login.result
    //kalau login.result != null berarti return homescreen
    //else login.result = null return after splash screen
  //   checkLogin();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png', height: 100, width: 200),
      ),
    );
  }
}
