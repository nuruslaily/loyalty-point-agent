import 'package:capstone/screens/customer/transaction/transaction_view_model.dart';
import 'package:capstone/screens/customer/widget/last_transaction_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class ConfirmPinScreenEMoney extends StatefulWidget {
  String choiceProvider;
  String nomor;
  String nama;
  String amount;
  ConfirmPinScreenEMoney({Key? key, required this.choiceProvider, required this.nama, required this.nomor, required this.amount}) : super(key: key);

  @override
  State<ConfirmPinScreenEMoney> createState() => _ConfirmPinScreenEMoneyState();
}

class _ConfirmPinScreenEMoneyState extends State<ConfirmPinScreenEMoney> {
  final _pinController = TextEditingController();
  
  String pin = '';
  String id = '';
  String poinAcc = "0";
  String token = '';

  Future getData() async {
    // await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String idUser = await sharedPref.read("id");
    String poin = await sharedPref.read("poin");
    String tokens = await sharedPref.read("token");

    setState(() {
      id = idUser.replaceAll('"', '');
      poinAcc = poin.replaceAll('"', '');
      token = tokens.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    _pinController.addListener(() {
      setState(() {
        pin = _pinController.text;
      });
    });
    getData().then((value) {
      print(value);
    });
    super.initState();
  }

   @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TransactionViewModel viewModel = Provider.of<TransactionViewModel>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("E-Money",
        style: TextStyle(fontSize: 17),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Text("Masukkan PIN", style: TextStyle(fontSize: 16)),
              SizedBox(height:20),
              PinCodeTextField(
                autofocus: true,
                controller: _pinController,
                maxLength: 4,
                highlight: true,
                hasUnderline: true,
                // hideCharacter: true,
                keyboardType: TextInputType.number,
                hasTextBorderColor: Colors.transparent,
                pinBoxColor: Colors.transparent,
                // highlightPinBoxColor: Colors.grey,
                // highlightColor: Colors.grey,
                // defaultBorderColor: Colors.black,
                maskCharacter: "😎",
                onDone: (text) => getPIN(viewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
  getPIN(TransactionViewModel viewModel) async {

    pin = _pinController.text;
    if (pin != '') {
      final result = await viewModel.postEMoney(id, widget.choiceProvider, widget.nomor, widget.nama, widget.amount, widget.amount, token, pin);
      
      print('transaksi code : $result');

      if(result == "200"){
        Navigator.push(
          context,
          PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
            return const LastTransactionScreen();
          }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(opacity: animation.drive(tween), child: child);
          }),
        );
      } else {
        final snackBar = SnackBar(
        content: Text("Transaksi Gagal"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      } 
    } else {
      print("error");
      final snackBar = SnackBar(
        content: Text("Pin yang Anda Masukkan Salah"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}