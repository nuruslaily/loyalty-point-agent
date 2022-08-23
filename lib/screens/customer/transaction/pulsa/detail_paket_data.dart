import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPaketData extends StatefulWidget {
  const DetailPaketData({Key? key}) : super(key: key);

  @override
  State<DetailPaketData> createState() => _DetailPaketDataState();
}
enum NamaProvider { telkomsel, indosat, smartfren, xl, axis }
class _DetailPaketDataState extends State<DetailPaketData> {
  @override
  Widget build(BuildContext context) {
    NamaProvider? _detailPaketData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children:const [
              Text('Paket Data Internet', style: TextStyle(fontSize: 16, color: Colors.black),),
              SizedBox(height: 10,),
              Text('0GB - 15GB', style: TextStyle(fontSize: 15, color: Colors.black)),
              SizedBox(height: 10,),
              Text('Total Penukaran', style: TextStyle(fontSize: 16, color: Colors.black),),
              SizedBox(height: 10,),
              Text('15000', style: TextStyle(fontSize: 15, color: Colors.black),)
            ]
            )
          ),
      ]
        ),
    );
  }
}