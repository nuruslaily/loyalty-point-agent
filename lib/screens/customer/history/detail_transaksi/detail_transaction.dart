import 'package:capstone/model/detail_history_model.dart';
import 'package:capstone/screens/customer/history/detail_transaksi/detail_transaksi_viewmodel.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  String idTransaction;
  String token;
  DetailScreen({Key? key, required this.idTransaction, required this.token}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

    String transactionId = '';
    String transactionType = '';
    String createdat = '2022-07-02T05:37:55.315318Z';
    String bankProvider = '';
    String nomor = '';
    String amount = '';
    String poinAccount = '';
    String poinRedeem = '';
    String description = '';
    String statusTransaction = '';

  @override
    void initState() {
      // TODO: implement initState
      Future.delayed(Duration(seconds: 2));
      super.initState();
    }
  
  @override
  Widget build(BuildContext context) {
    DetailHistoryViewModel modelView = Provider.of<DetailHistoryViewModel>(context);
    String date = createdat;

    getDetailTransaction(modelView);
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy HH.mm WIB');
    var outputDate = outputFormat.format(inputDate);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: const Text(
            "Detail Transaction",
            style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
          ),
          centerTitle: true
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Center(
                        child: Text(statusTransaction,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Center(
                        child: Text(outputDate,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12))),
                    SizedBox(height: 20),
                    Text('Detail Transaksi',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          Text('ID Transaksi',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                              widget.idTransaction,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [
                          Text('Jenis Transaksi',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(transactionType,
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Nama Bank',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                              Spacer(),
                          Text(bankProvider,
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('No Rekening',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(nomor,
                              style: TextStyle(fontSize: 16)),
                        ]),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          Text('POIN Kamu',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(poinAccount,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [
                          Text('Total Poin yang ditukar',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                              Spacer(),
                          Text(poinRedeem,
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Total Uang yang didapat  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(amount,
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Sisa POIN  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                              Spacer(),
                          Text(
                              '${int.parse(poinAccount) - int.parse(poinRedeem)}',
                              style: TextStyle(fontSize: 16)),
                        ]),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }

  getDetailTransaction(DetailHistoryViewModel viewModel) async {
    Result result = await viewModel.getDetailHistory(widget.idTransaction, widget.token);
    setState(() {
          transactionId = result.transactionId!;
          transactionType = result.transactionType!;
          createdat = result.createdat!;
          bankProvider = result.bankProvider!;
          nomor = result.nomor!;
          amount = result.amount.toString();
          poinAccount = result.poinAccount.toString();
          poinRedeem = result.poinRedeem.toString();
          description = result.description!;
          statusTransaction = result.statusTransaction!;
          
        });
  }
}
