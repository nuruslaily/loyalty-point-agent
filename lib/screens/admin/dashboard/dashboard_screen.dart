import 'package:capstone/screens/admin/dashboard/dashboard_view_model.dart';
import 'package:capstone/screens/admin/widget/chart.dart';
import 'package:capstone/screens/admin/widget/nav_drawer.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    DashboardViewModel modelView = Provider.of<DashboardViewModel>(context);
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
            "Dashboard",
            style: TextStyle(color: Colors.black),
          )),
      drawer: DrawWidget(),
      drawerScrimColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  child: ListTile(
                      title: Text("Transaksi Hari Ini",
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text('69',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                );
              },
            ),
            SizedBox(height: 10),
            LineChartSample10(),
          ],
        ),
      ),
    );
  }
}
