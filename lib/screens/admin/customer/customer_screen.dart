import 'package:capstone/screens/admin/widget/nav_drawer.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
      final ButtonStyle raisedButtonStyle =
      ElevatedButton.styleFrom(onPrimary: Colors.black, primary: Colors.white);
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
            "Customer",
            style: TextStyle(color: Colors.black),
          )),
      drawer: DrawWidget(),
      drawerScrimColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      // widget.updatePulse(paketData[index]);
                      // widget.updatePoin(poinPaketData[index]);
                    },
                    child: Card(
                      borderOnForeground: true,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                  'ID. 00000000',
                                  style: TextStyle(color: Colors.black),
                                ),
                              SizedBox(height: 10),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      'Jack Brown',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete, color: Colors.red,),
                                      onPressed: (){},),
                                       IconButton(
                                      icon: Icon(Icons.edit, color: Colors.blue,),
                                      onPressed: (){},)
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                  '0812xxxxxxx',
                                  style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                  'jack@gmail.com',
                                  style: TextStyle(color: Colors.black),
                              )
                            ]),
                      ),
                    ),
                  );
                }, separatorBuilder: (context,index) { return SizedBox(height: 10); },
    ),
      )
    );
  }
}