import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderHomeScreen extends StatefulWidget {
  Size size;
  HeaderHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  State<HeaderHomeScreen> createState() => _HeaderHomeScreenState();
}

class _HeaderHomeScreenState extends State<HeaderHomeScreen> {
  String fullname = "";
  String noHp = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String fname = await sharedPref.read("fullname");
    String noPhone = await sharedPref.read("no_hp");
    setState(() {
      fullname = fname.replaceAll('"', '');
      noHp =  noPhone.replaceAll('"', '');
    });
    return "done getting data";
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
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: widget.size.height * 0.2 - 30,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
              bottom: defaultPadding,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Halo $fullname, Selamat Datang",
                    // style: Theme.of(context).textTheme.headline5?.copyWith(
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ), 
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: <Widget> [
                SizedBox(height:15),
                Text(
                  noHp,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
}
