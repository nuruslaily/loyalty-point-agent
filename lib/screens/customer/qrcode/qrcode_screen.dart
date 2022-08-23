import 'package:capstone/screens/customer/history/detail_transaksi/detail_transaksi_viewmodel.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:provider/provider.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String poins = "";
  String transaksiId = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String poin = await sharedPref.read("poin");
    String idTransaction = await sharedPref.read("id_transaction");
    
    setState(() {
      poins = poin.replaceAll('"', '');
      transaksiId = idTransaction.replaceAll('"', '');
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
    DetailHistoryViewModel modelView =
        Provider.of<DetailHistoryViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: const Text(
          "My QR Code",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
      ),
      body: Container(
        // width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(height: 30,),
            Text("Your Barcode ID"),
            Text(transaksiId, style: TextStyle(color: Colors.blue),),
            const SizedBox(height: 20,),
            Card(
                  child: ListTile(
                    leading: Icon(Icons.stars_rounded),
                    title: Text(poins, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),                    
                  ),
                ),
                SizedBox(height: 20,),
            Center(
              child: Card(
                  child: BarcodeWidget(
                barcode: Barcode.aztec(), // Barcode type and settings
                data: transaksiId, // Content
                width: 200,
                height: 200,
              )),
            ),
            const SizedBox(height: 20,),
             const Center(
                child: Text('Tunjukkan QR Code ini saat belanja agar mendapat poin', style: TextStyle(fontSize: 16))),
          ]
        ),
      ),
    );
  }
}