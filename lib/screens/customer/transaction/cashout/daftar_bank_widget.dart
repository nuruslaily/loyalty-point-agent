import 'package:capstone/screens/customer/transaction/cashout/cash_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DaftarBank extends StatefulWidget {
  const DaftarBank({Key? key}) : super(key: key);

  @override
  State<DaftarBank> createState() => _DaftarBankState();
}

enum NamaBank { bni, bca, bri, bjb, mandiri }

class _DaftarBankState extends State<DaftarBank> {
  NamaBank? _daftarBank = NamaBank.bni;

  @override
  Widget build(BuildContext context) {
    // NamaBank? _daftarBank = NamaBank.bni;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return CashOutScreen(choiceBank: _daftarBank.toString().split('.').last,);
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 1.0);
                  return FadeTransition(
                      opacity: animation.drive(tween), child: child);
                }),
              );
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Daftar BANK",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading:
                    Image.asset("assets/img/bni.png", width: 100, height: 50),
                title: const Text('BNI'),
                trailing: Radio<NamaBank>(
                  value: NamaBank.bni,
                  groupValue: _daftarBank,
                  onChanged: (NamaBank? value) {
                    setState(() {
                      _daftarBank = value;
                    });
                    print(value);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading:
                    Image.asset("assets/img/bca.png", width: 100, height: 50),
                title: const Text('BCA'),
                trailing: Radio<NamaBank>(
                  value: NamaBank.bca,
                  groupValue: _daftarBank,
                  onChanged: (NamaBank? value) {
                    setState(() {
                      _daftarBank = value;
                    });
                    print(value);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading:
                    Image.asset("assets/img/bri.png", width: 100, height: 50),
                title: const Text('BRI'),
                trailing: Radio<NamaBank>(
                  value: NamaBank.bri,
                  groupValue: _daftarBank,
                  onChanged: (NamaBank? value) {
                    setState(() {
                      _daftarBank = value;
                    });
                    print(value);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading:
                    Image.asset("assets/img/bjb.png", width: 100, height: 50),
                title: const Text('BJB'),
                trailing: Radio<NamaBank>(
                  value: NamaBank.bjb,
                  groupValue: _daftarBank,
                  onChanged: (NamaBank? value) {
                    setState(() {
                      _daftarBank = value;
                    });
                    print(value);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset("assets/img/mandiri.png",
                    width: 100, height: 50),
                title: const Text('Mandiri'),
                trailing: Radio<NamaBank>(
                  value: NamaBank.mandiri,
                  groupValue: _daftarBank,
                  onChanged: (NamaBank? value) {
                    setState(() {
                      _daftarBank = value;
                    });
                    print(value);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
