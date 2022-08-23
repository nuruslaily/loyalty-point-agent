import 'package:capstone/screens/customer/transaction/cashout/confirm_pin_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailScreenCashOut extends StatefulWidget {
  String namaRek;
  String nomorRek;
  String poin;
  String choiceBank;
  DetailScreenCashOut(
      {Key? key,
      required this.namaRek,
      required this.nomorRek,
      required this.poin,
      required this.choiceBank})
      : super(key: key);

  @override
  State<DetailScreenCashOut> createState() => _DetailScreenCashOutState();
}

class _DetailScreenCashOutState extends State<DetailScreenCashOut> {
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
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Center(
                            child: Text('Detail Cash Out',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 10),
                        SizedBox(height: 20),
                        Text('Transaksi Berlangsung',
                            style: TextStyle(color: Colors.blue, fontSize: 16)),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Nama Pemilik',
                                      style: TextStyle(fontSize: 16)),
                                  Spacer(),
                                  Text('${widget.namaRek}',
                                      style: TextStyle(fontSize: 16)),
                                ]),
                            Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Nama Bank',
                                      style: TextStyle(fontSize: 16)),
                                  Spacer(),
                                  Text(
                                      '${widget.choiceBank.toUpperCase()} - ${widget.namaRek}',
                                      style: TextStyle(fontSize: 16)),
                                ]),
                            Row(children: [
                              Text('No. Rekening',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text('${widget.nomorRek}',
                                  style: TextStyle(fontSize: 16)),
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
                                  Text('POIN Kamu',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                          Spacer(),
                                  Text('${poins}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ]),
                            Row(
                                children: [
                                  Text('Total Poin yang ditukar',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 16)),
                                      Spacer(),
                                  Text('${widget.poin}',
                                      style: TextStyle(fontSize: 16)),
                                ]),
                            Row(
                                children: [
                                  Text('Sisa POIN',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Text(
                                      '${(int.parse(poins) - int.parse(widget.poin))}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ]),
                                SizedBox(height: 80,)
                          ],
                        ),
                      ]),
                ),
              ),
              ListTile(
                  trailing: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return ConfirmPinScreenCashOut(bankProvider: widget.choiceBank, nomor: widget.nomorRek, nama: widget.namaRek, amount: widget.poin);
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(begin: 0.0, end: 1.0);
                            return FadeTransition(
                                opacity: animation.drive(tween), child: child);
                          }),
                        );
                      },
                      child: Text("Redeem")))
            ],
          ),
        ));
  }
}
