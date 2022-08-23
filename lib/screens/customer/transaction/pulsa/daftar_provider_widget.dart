import 'package:capstone/screens/customer/transaction/pulsa/pulse_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DaftarProvider extends StatefulWidget {
  const DaftarProvider({Key? key}) : super(key: key);

  @override
  State<DaftarProvider> createState() => _DaftarProviderState();
}
enum NamaProvider { telkomsel, indosat, smartfren, xl, axis }
class _DaftarProviderState extends State<DaftarProvider> {
  NamaProvider? _daftarProvider = NamaProvider.telkomsel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return Pulse_Screen(choiceProvider: _daftarProvider.toString().split('.').last,);
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                            opacity: animation.drive(tween), child: child);
                      }),
                    );
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Daftar Provider",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            
          ),
        ),
      ),
      body: Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Image.asset("assets/img/telkomsel.png", width: 50, height: 50),
            title: const Text('TELKOMSEL'),
            trailing: Radio<NamaProvider>(
              value: NamaProvider.telkomsel,
              groupValue: _daftarProvider,
              onChanged: (NamaProvider? value) {
                setState(() {
                  _daftarProvider = value;
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset("assets/img/indosat.png", width: 50, height: 50),
            title: const Text('INDOSAT'),
            trailing: Radio<NamaProvider>(
              value: NamaProvider.indosat,
              groupValue: _daftarProvider,
              onChanged: (NamaProvider? value) {
                setState(() {
                  _daftarProvider = value;
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset("assets/img/smartfren.png", width: 50, height: 50),
            title: const Text('SMARTFREN'),
            trailing: Radio<NamaProvider>(
              value: NamaProvider.smartfren,
              groupValue: _daftarProvider,
              onChanged: (NamaProvider? value) {
                setState(() {
                  _daftarProvider = value;
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset("assets/img/xl.png", width: 50, height: 50),
            title: const Text('XL'),
            trailing: Radio<NamaProvider>(
              value: NamaProvider.xl,
              groupValue: _daftarProvider,
              onChanged: (NamaProvider? value) {
                setState(() {
                  _daftarProvider = value;
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset("assets/img/axis.png", width: 50, height: 50),
            title: const Text('AXIS'),
            trailing: Radio<NamaProvider>(
              value: NamaProvider.axis,
              groupValue: _daftarProvider,
              onChanged: (NamaProvider? value) {
                setState(() {
                  _daftarProvider = value;
                });
              },
            ),
          ),
        ),
      ],
    )
    );
  }
}