import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/customer/faq/header_faq_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String fullname = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String fname = await sharedPref.read("fullname");
    setState(() {
      fullname = fname.replaceAll('"', '');
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
    Size size = MediaQuery.of(context).size;
    // SharedPref sharedPref = SharedPref();
    // String? fullname = sharedPref.read("fullname");
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: secondaryColor,
          child: const Icon(Icons.email)),
      body:  Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderFaqScreen(size: size),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Hai $fullname, cari solusi untukmu disini",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: [
                  Card(
                    child: ListTile(
                      title: Text('Bagaimana Cara Menukar Poin?',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      title: Text('Bagaimana Jika Transaksi Tertunda?',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      title: Text('Apa yang Dilakukan Ketika Lupa PIN?',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      title: Text('Mengapa POIN Saya Bertambah?',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      title: Text('Bagaimana Jika Saya Lupa Password?',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ]),
              ),
            ])
      )
    );
  }
}
