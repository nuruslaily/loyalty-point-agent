import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LastTransactionScreen extends StatefulWidget {
  const LastTransactionScreen({Key? key}) : super(key: key);

  @override
  State<LastTransactionScreen> createState() => _LastTransactionScreenState();
}

class _LastTransactionScreenState extends State<LastTransactionScreen> {
  @override
  void initState() {
    super.initState();

    // checkLogin();
    const delay = Duration(seconds: 3);
    Future.delayed(delay, () => checkTransaksi());
  }

  checkTransaksi() {
     Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const BottomNavigationScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Transaksi Sedang di Proses",
                textAlign: TextAlign.center,
               style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
              height: 10
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Silahkan Cek History Secara Berkala",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 40,),
            Image.asset("assets/img/State7.png"),
            const Spacer(
              flex: 8,
            ),
          ]
    ),
      )
    );
  }
}