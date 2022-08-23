import 'package:capstone/screens/customer/transaction/pulsa/daftar_provider_widget.dart';
import 'package:capstone/screens/customer/transaction/pulsa/detail_paket_data.dart';
import 'package:capstone/screens/customer/transaction/pulsa/detail_transaction_pulse.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class Pulse_Screen extends StatefulWidget {
  String choiceProvider;
  Pulse_Screen({Key? key, required this.choiceProvider}) : super(key: key);

  @override
  State<Pulse_Screen> createState() => _Pulse_ScreenState();
}

class _Pulse_ScreenState extends State<Pulse_Screen>
    with SingleTickerProviderStateMixin {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: Colors.white,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _telpController = TextEditingController();
  String telp = '';
  TabController? _tabController;
  String pulsa = '';
  String poins = '';

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
    });
    super.initState();
  }

  void _updatePulse(String pulse) {
    setState(() {
      pulsa = pulse;
    });
    print(pulse);
  }

  void _updatePoin(String poin) {
    setState(() {
      poins = poin;
    });
    print(poin);
  }

  @override
  void dispose() {
    _telpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Pulsa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
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
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                'Nomor Ponsel',
                style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
              ),
              TextFormField(
                controller: _telpController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.phone,
                        color: Color.fromARGB(255, 75, 75, 75)),
                    hintText: '08xxxxxxxxxx',
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
                    return 'Masukkan Nomor Ponsel';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Daftar Operator Seluler',
                style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
              ),
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return const DaftarProvider();
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                            opacity: animation.drive(tween), child: child);
                      }),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset(
                        "assets/img/${widget.choiceProvider}.png",
                        width: 50,
                        height: 50),
                    title: Text("${widget.choiceProvider.toUpperCase()}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75))),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              SizedBox(height: 5),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text('Pulsa',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromARGB(255, 75, 75, 75))),
                  ),
                  Tab(
                      child: Text('Paket Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75)))),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Pulsa_Screen(
                        updatePulse: _updatePulse, updatePoin: _updatePoin),
                    PaketData_Screen(
                      updatePulse: _updatePulse,
                      updatePoin: _updatePoin,
                    )
                  ],
                  controller: _tabController,
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  textColor: Color.fromARGB(255, 75, 75, 75),
                  title:
                      Text('Total Penukaran', style: TextStyle(fontSize: 16)),
                  subtitle: Text("$pulsa"),
                  trailing: (telp == '' && pulsa == '' && poins == '')
                      ? ElevatedButton(
                          onPressed: () {},
                          child: Text("Next"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return DetailTransactionPulseScreen(
                                  telp: telp,
                                  choiceProvider: widget.choiceProvider,
                                  transaction: pulsa,
                                  poin: poins,
                                );
                              }, transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final tween = Tween(begin: 0.0, end: 1.0);
                                return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child);
                              }),
                            );
                          },
                          child: Text("Next")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pulsa_Screen extends StatefulWidget {
  final ValueChanged<String> updatePulse;
  final ValueChanged<String> updatePoin;
  Pulsa_Screen({Key? key, required this.updatePulse, required this.updatePoin})
      : super(key: key);

  @override
  State<Pulsa_Screen> createState() => _Pulsa_ScreenState();
}

class _Pulsa_ScreenState extends State<Pulsa_Screen> {
  final ButtonStyle raisedButtonStyle =
      ElevatedButton.styleFrom(onPrimary: Colors.white, primary: Colors.white);
  List<String> pulsa = [
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
                      widget.updatePulse(pulsa[index]);
                      widget.updatePoin(poin[index]);
                    },
                    child: ListTile(
                        title: Text(pulsa[index],
                            style: TextStyle(color: Colors.black)),
                        subtitle: Text(poin[index],
                            style: TextStyle(color: Colors.blue))),
                  );
                },
    );
  }
}

class PaketData_Screen extends StatefulWidget {
  final ValueChanged<String> updatePulse;
  final ValueChanged<String> updatePoin;
  PaketData_Screen(
      {Key? key, required this.updatePulse, required this.updatePoin})
      : super(key: key);

  @override
  State<PaketData_Screen> createState() => _PaketData_ScreenState();
}

class _PaketData_ScreenState extends State<PaketData_Screen> {
  final ButtonStyle raisedButtonStyle =
      ElevatedButton.styleFrom(onPrimary: Colors.white, primary: Colors.white);
  List<String> paketData = ['15GB', '15GB'];
  List<String> poinPaketData = ['15000', '15000'];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      widget.updatePulse(paketData[index]);
                      widget.updatePoin(poinPaketData[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: Text('Internet',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  onPressed: () {},
                                ),
                                TextButton(
                                    child: Text('Lihat Detail',
                                        style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(pageBuilder: (context,
                                            animation, secondaryAnimation) {
                                          return const DetailPaketData();
                                        }, transitionsBuilder: (context,
                                            animation,
                                            secondaryAnimation,
                                            child) {
                                          final tween =
                                              Tween(begin: 0.0, end: 1.0);
                                          return FadeTransition(
                                              opacity: animation.drive(tween),
                                              child: child);
                                        }),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                paketData[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                poinPaketData[index],
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ]),
                    ),
                  );
                }
    );
  }
}
