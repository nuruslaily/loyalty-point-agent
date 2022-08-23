import 'package:capstone/screens/customer/transaction/cashout/daftar_bank_widget.dart';
import 'package:capstone/screens/customer/transaction/cashout/detail_transaction_cashout.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CashOutScreen extends StatefulWidget {
  String choiceBank;
  CashOutScreen({Key? key, required this.choiceBank}) : super(key: key);

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: Colors.white,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _namaRekening = TextEditingController();
  final _nomorRekening = TextEditingController();
  final _daftarBank = TextEditingController();
  String namaRek = '';
  String nomorRek = '';
  String cashouts = '';
  String poins = '';

  void _updateCashout(String cashout) {
    setState(() {
      cashouts = cashout;
    });
    print(cashouts);
  }

  void _updatePoin(String poin) {
    setState(() {
      poins = poin;
    });
    print(poin);
  }

  @override
  void initState() {
    super.initState();
    _namaRekening.addListener(() {
      setState(() {
        namaRek = _namaRekening.text;
      });
    });
    _nomorRekening.addListener(() {
      setState(() {
        nomorRek = _nomorRekening.text;
      });
    });
  }

  @override
  void dispose() {
    _namaRekening.dispose();
    _nomorRekening.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cash Out',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          centerTitle: true,
           leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return BottomNavigationScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 1.0);
                  return FadeTransition(
                      opacity: animation.drive(tween), child: child);
                }),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // key: formKey,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'A.N Rekening',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    TextFormField(
                      controller: _namaRekening,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.people,
                              color: Color.fromARGB(255, 75, 75, 75)),
                          hintText: 'Jack Brown',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          focusColor: Colors.grey),
                      validator: (value) {
                        if (value != null && value.length > 2) {
                          return null;
                        } else {
                          return 'Masukkan Nama Pemilik Rekening';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Nomor Rekening',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    TextFormField(
                      controller: _nomorRekening, 
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.credit_card,
                              color: Color.fromARGB(255, 75, 75, 75)),
                          hintText: '0711xxxxxxxxx',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          focusColor: Colors.grey),
                      validator: (value) {
                        if (value != null && value.length > 2) {
                          return null;
                        } else {
                          return 'Masukkan Nomor Rekening';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'BANK',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const DaftarBank();
                            }, transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                  opacity: animation.drive(tween),
                                  child: child);
                            }),
                          );
                        },
                        child: ListTile(
                          leading: Image.asset("assets/img/${widget.choiceBank}.png", width: 50, height:50),
                          title: Text("${widget.choiceBank.toUpperCase()}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75))),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                    SizedBox(height: 15),
                    Expanded(child: GridCashOut(updateCashout: _updateCashout, updatePoin: _updatePoin, )),
                    SizedBox(height: 0),
                    Divider(),
                    Container(
                      child: ListTile(
                        textColor: Color.fromARGB(255, 75, 75, 75),
                        title: Text('Total Penukaran',
                            style: TextStyle(fontSize: 16)),
                        subtitle: Text("$cashouts"),
                        trailing: (namaRek == '' && nomorRek == '' && cashouts == '' && poins == '') ? ElevatedButton(onPressed: (){}, child: Text("Next"),) : 
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailScreenCashOut(namaRek: namaRek, nomorRek: nomorRek, poin: poins, choiceBank: widget.choiceBank,);
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
                            }, child: Text("Next")),
                      ),
                    ),
                  ]),
            )));
  }
}

class GridCashOut extends StatefulWidget {
  final ValueChanged<String> updateCashout;
  final ValueChanged<String> updatePoin;
  const GridCashOut({Key? key, required this.updateCashout, required this.updatePoin}) : super(key: key);

  @override
  State<GridCashOut> createState() => _GridCashOutState();
}

class _GridCashOutState extends State<GridCashOut> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.white
  );
  List<String> cashout = [
    'Rp. 50.000',
    'Rp. 100.000',
    'Rp. 150.000',
    'Rp. 200.000',
    'Rp. 250.000',
    'Rp. 300.000',
    'Rp. 350.000',
    'Rp. 400.000'
  ];
  List<String> poin = [
    '50000',
    '100000',
    '150000',
    '200000',
    '250000',
    '300000',
    '350000',
    '400000'
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      widget.updateCashout(cashout[index]);
                      widget.updatePoin(poin[index]); 
                    },
                      child: ListTile(
                          title: Text(cashout[index],
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text('${poin[index]} poin',
                              style: TextStyle(color: Colors.blue))),
                  );
                },
    );
  }
}
