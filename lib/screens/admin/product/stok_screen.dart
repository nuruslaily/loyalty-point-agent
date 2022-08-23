import 'package:capstone/screens/admin/widget/nav_drawer.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StokScreen extends StatelessWidget {
  const StokScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
      final ButtonStyle raisedButtonStyle =
      ElevatedButton.styleFrom(onPrimary: Colors.black, primary: Colors.blueAccent);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          leading: new IconButton(
            color: Colors.black,
            icon: new Icon(Icons.format_align_justify),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          backgroundColor: primaryColor,
          title: Text(
            "Stok Produk",
            style: TextStyle(color: Colors.black),
          )),
      drawer: DrawWidget(),
      drawerScrimColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      // widget.updatePulse(paketData[index]);
                      // widget.updatePoin(poinPaketData[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(Icons.signal_cellular_alt_rounded),
                            SizedBox(height: 10),
                            Text(
                                '100.000.000',
                                style: TextStyle(color: Colors.black),
                              ),
                            SizedBox(height: 10),
                            Text(
                                'Pulsa & Paket Data',
                                style: TextStyle(color: Colors.black),
                            )
                          ]),
                    ),
                  );
                }, separatorBuilder: (context,index) { return SizedBox(height: 10); },
    ),
      )
    );
  }
}