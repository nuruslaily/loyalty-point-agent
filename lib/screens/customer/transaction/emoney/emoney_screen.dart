import 'package:capstone/screens/customer/transaction/emoney/detail_emoney_screen.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EMoneyScreen extends StatefulWidget {
  const EMoneyScreen({Key? key}) : super(key: key);

  @override
  State<EMoneyScreen> createState() => _EMoneyScreenState();
}

class _EMoneyScreenState extends State<EMoneyScreen> {
  int? _selectedIndex;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(500, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _telpController = TextEditingController();
  final _namaController = TextEditingController();
  String telp = '';
  String emoney = '';
  String icon = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
    });
    _namaController.addListener(() {
      setState(() {
        name = _namaController.text;
      });
    });
  }

  @override
  void dispose() {
    _telpController.dispose();
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Money',
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
        body: Container(
            padding: const EdgeInsets.all(8),
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // key: formKey,
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Username E-wallet',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                          ),
                          TextFormField(
                            controller: _namaController,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                prefixIcon: Icon(Icons.person,
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
                                return 'Masukkan Nama Akun';
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Nomor Ponsel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                          ),
                          TextFormField(
                            controller: _telpController,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
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
                            height: 5,
                          ),
                          Container(
                            child: ListTile(
                              iconColor: Color.fromARGB(255, 75, 75, 75),
                              textColor: Color.fromARGB(255, 75, 75, 75),
                              title: Text('Dompet Digital',
                                  style: TextStyle(fontSize: 16)),
                              leading: Icon(Icons.wallet),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 100, child: _buildChips()),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 140,
                          ),
                          (emoney == '' && telp == '')
                              ? ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {},
                                  child: Text("Next"))
                              : ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(pageBuilder: (context,
                                          animation, secondaryAnimation) {
                                        return DetailEMoneyScreen(
                                            name: name,
                                            emoney: emoney,
                                            noTelp: telp,
                                            icons: icon);
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
                                  },
                                  child: Text("Next"))
                        ]))));
  }

  Widget _buildChips() {
    List<String> emoneyList = ['Shopeepay', 'Gopay', 'Linkaja', 'DANA', 'OVO'];
    List<Widget> chips = [];
    List<String> iconList = [
      'assets/img/ShopeePay.png',
      'assets/img/gopay.png',
      'assets/img/LinkAja.png',
      'assets/img/dana.png',
      'assets/img/ovo.png'
    ];

    for (int i = 0; i < emoneyList.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: emoney == emoneyList[i],
        label: Text(emoneyList[i].toString(),
            style: TextStyle(color: Colors.black)),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(iconList[i]),
        ),
        // elevation: 10,
        // pressElevation: 10,
        backgroundColor: Colors.transparent,
        selectedColor: Colors.blue,
        side: BorderSide(color: Colors.grey, style:BorderStyle.solid),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              // viewModel.emoney.add(emoney[i]);
              emoney = emoneyList[i];
              icon = iconList[i];
              _selectedIndex = i;
            }
          });
          print(emoney);
        },
      );

      chips.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: choiceChip));
    }
    return Wrap(
      // alignment: WrapAlignment.spaceAround,
      spacing: 4,
      runSpacing: 4,
      // runAlignment: WrapAlignment.spaceAround,
      // This next line does the trick.
      children: chips,
    );
  }
}
