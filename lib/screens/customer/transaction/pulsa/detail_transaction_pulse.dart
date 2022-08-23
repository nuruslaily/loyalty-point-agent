import 'package:capstone/screens/customer/transaction/pulsa/confirm_pin_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailTransactionPulseScreen extends StatefulWidget {
  String telp;
  String choiceProvider;
  String transaction;
  String poin;
  DetailTransactionPulseScreen({Key? key, required this.telp, required this.choiceProvider, required this.transaction, required this.poin}) : super(key: key);

  @override
  State<DetailTransactionPulseScreen> createState() => _DetailTransactionPulseScreenState();
}

class _DetailTransactionPulseScreenState extends State<DetailTransactionPulseScreen> {
  String poins = "0";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String poin = await sharedPref.read("poin");
    setState(() {
      poins = poin.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value) {
      print(value);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.lightGreen,
    minimumSize: const Size(40, 35),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: const Text(
            "Detail Transaction",
            style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
          child: Column(
            children: [
             Card(
                child:
                    Container(
                      padding:
              const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 20),
                  Center(
                        child: Text('Detail Isi Pulsa',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  Text('Transaksi Berlangsung',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 20),
                  Column(
                      children: [
                        Row(
                          children: [
                          Text('Paket Data', 
                              style: TextStyle( 
                                  fontSize: 16)),
                          Spacer(),
                          Text('${widget.choiceProvider} - ${widget.transaction}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Row(
                          children: [
                          Text('Nomor Ponsel', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Spacer(),
                          Text('${widget.telp}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                      ],
                  ),
                  SizedBox(height: 30),
                  Text('POIN',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                          Text('POIN Kamu', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text('${widget.poin}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Row(
                          children: [
                          Text('Total Poin yang ditukar', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Spacer(),
                          Text('${widget.poin}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Row(
                          children: [
                          Text('Sisa POIN', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text('${(int.parse(poins) - int.parse(widget.poin))}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        SizedBox(height: 80,)
                      ],
                  ),
                ]),
                    ),
              ),
              ListTile(trailing: ElevatedButton(style: raisedButtonStyle ,onPressed: (){
                Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ConfirmPinScreenPulse(choiceProvider: widget.choiceProvider, nomor: widget.telp, amount: widget.poin);
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
              }, child: Text("Redeem")))
            ],
          ),
        ));
  }
}
