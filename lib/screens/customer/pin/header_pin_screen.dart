import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';

class HeaderPinScreen extends StatelessWidget {
  Size size;
  HeaderPinScreen({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: size.height * 0.2 - 30,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
              bottom:  defaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                  'Buat PIN',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
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
                Flexible(
                  child: const Text(
              'Silahkan buat 4 Digit PIN anda untuk keamanan transaksi',
              style: TextStyle(fontSize: 14),
            ),
                )
              ]
            )
          ),
          const SizedBox(
            height: 40
          )
        ],
      ),
    );
  }
}
