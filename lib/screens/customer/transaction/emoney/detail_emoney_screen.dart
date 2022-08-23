import 'package:capstone/screens/customer/transaction/emoney/detail_transaction_emoney.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailEMoneyScreen extends StatefulWidget {
  String emoney;
  String noTelp;
  String icons;
  String name;
  DetailEMoneyScreen({Key? key, required this.name, required this.emoney, required this.noTelp, required this.icons}) : super(key: key);

  @override
  State<DetailEMoneyScreen> createState() => _DetailEMoneyScreenState();
}

class _DetailEMoneyScreenState extends State<DetailEMoneyScreen> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            'E-Money',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          centerTitle: true,
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
                      height: 20,
                    ),
                    const Text(
                      'Nomor Tujuan',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    ListTile(
                      title: Text(widget.name),
                      subtitle: Text('${widget.emoney} - ${widget.noTelp}'),
                      leading: Image.asset(widget.icons)
                    ),
                    SizedBox(height: 10),
                    Text("Nominal"),
                    SizedBox(height: 10),
                    Expanded(child: GridEMoney(updateCashout: _updateCashout, updatePoin: _updatePoin)),
                    SizedBox(height: 10),
                    Divider(),
                    Container(
                      child: ListTile(
                        textColor: Color.fromARGB(255, 75, 75, 75),
                        title: Text('Total Penukaran',
                            style: TextStyle(fontSize: 16)),
                        subtitle: Text("$cashouts", style: TextStyle(color: Colors.black),),  
                        trailing: (cashouts == '' && poins == '') ? ElevatedButton(onPressed: (){}, child: Text("Next"),) : 
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailTransactionEMoneyScreen(name: widget.name, emoney: widget.emoney, noTelp: widget.noTelp, poin: poins,);
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

class GridEMoney extends StatefulWidget {
  final ValueChanged<String> updateCashout;
  final ValueChanged<String> updatePoin;
  GridEMoney({Key? key, required this.updateCashout, required this.updatePoin}) : super(key: key);

  @override
  State<GridEMoney> createState() => _GridEMoneyState();
}

class _GridEMoneyState extends State<GridEMoney> {
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
                    child:  ListTile(
                          title: Text(cashout[index],
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text("${poin[index]} poin",
                              style: TextStyle(color: Colors.blue))),

                  );
                },
    );
  }
}