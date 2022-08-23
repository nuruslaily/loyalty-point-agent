import 'package:capstone/screens/customer/transaction/transaction_view_model.dart';
import 'package:capstone/screens/customer/widget/last_transaction_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class ConfirmPinScreenCashOut extends StatefulWidget {
  String bankProvider;
  String nomor;
  String nama;
  String amount;
  ConfirmPinScreenCashOut({Key? key, required this.bankProvider, required this.nomor, required this.nama, required this.amount}) : super(key: key);

  @override
  State<ConfirmPinScreenCashOut> createState() => _ConfirmPinScreenCashOutState();
}

class _ConfirmPinScreenCashOutState extends State<ConfirmPinScreenCashOut> {
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
        title: Text("Cash Out",
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
                autofocus: false,
                controller: _pinController,
                maxLength: 4,
                highlight: false,
                hasUnderline: true,
                // hideCharacter: true,
                hasTextBorderColor: Colors.transparent,
                pinBoxColor: Colors.transparent,
                // highlightPinBoxColor: Colors.grey,
                onDone: (text) => getPIN(viewModel)
                // highlightColor: Colors.grey,
                // defaultBorderColor: Colors.black,
                // maskCharacter: "*",
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

      final result  = await viewModel.postCashout(id, widget.bankProvider, widget.nomor, widget.nama, widget.amount, widget.amount, token, pin);

      if(result == '200') {
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