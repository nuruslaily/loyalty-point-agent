import 'package:capstone/model/history_model.dart';
import 'package:capstone/screens/customer/history/header_history_transaction.dart';
import 'package:capstone/screens/customer/history/history_list_screen.dart';
import 'package:capstone/screens/customer/history/history_view_model.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  String id = '';
  String token = '';

  Future getData() async {
    // await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String idUser = await sharedPref.read("id");
    String tokens = await sharedPref.read("token");

    setState(() {
      id = idUser.replaceAll('"', '');
      token = tokens.replaceAll('"', '');
    });

    return "done getting history";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value){
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    HistoryViewModel modelView = Provider.of<HistoryViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: <Widget>[
              HeaderHistoryTransaction(size: size),
              HistoryScreenList(viewModel: modelView),
            ]),
        );
  }

}
