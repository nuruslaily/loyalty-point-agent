import 'package:capstone/screens/customer/home/header_home_screen.dart';
import 'package:capstone/screens/customer/qrcode/qrcode_screen.dart';
import 'package:capstone/screens/customer/transaction/cashout/cash_out_screen.dart';
import 'package:capstone/screens/customer/transaction/emoney/emoney_screen.dart';
import 'package:capstone/screens/customer/transaction/pulsa/pulse_screen.dart';
import 'package:capstone/screens/customer/widget/banner.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String poins = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String poin = await sharedPref.read("poin");
    setState(() {
      poins = poin;
    });
    return "done getting data";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value){
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderHomeScreen(size: size),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScreen()));
                  },
                  child: Card(
                      child: ListTile(
                        leading: Image.asset("assets/img/coin.png"),
                        title: Text(poins, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),                      
                        trailing: Icon(Icons.qr_code_scanner, color: Colors.blue,),
                      ),
                  ),
                ),
                const BannerWidget(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EMoneyScreen()));
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 8, right:8, bottom: 5),
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Icon(Icons.payment, color: Color.fromARGB(255, 75, 75, 75),),
                      title: Text('Redeem for E-Money', style: TextStyle(fontSize: 16, color: textColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CashOutScreen(choiceBank: 'bni',)));
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 8, right:8, bottom: 5),
                    child: ListTile(
                      leading: Icon(Icons.wallet, color: Color.fromARGB(255, 75, 75, 75)),
                      title: Text('Redeem for Cash out', style: TextStyle(fontSize: 16, color: textColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pulse_Screen(choiceProvider: 'telkomsel',)));
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 8, right:8, bottom: 5),
                    child: ListTile(
                      leading: Icon(Icons.phone_android, color: Color.fromARGB(255, 75, 75, 75)),
                      title: Text('Redeem for Pulsa/Paket Data', style: TextStyle(fontSize: 16, color: textColor)),
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
  
  poin() async {
    SharedPref sharedPref = SharedPref();
    String? poin = await sharedPref.read("poin");
    print("poin: $poin");
    return poin;
  }
  
  Future<dynamic> getPoin(String key)async{
    SharedPref sharedPref = SharedPref();
    String? poin = await sharedPref.read(key);
    return poin;
  }
}
