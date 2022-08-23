import 'package:capstone/screens/admin/customer/customer_poin_screen.dart';
import 'package:capstone/screens/admin/customer/customer_screen.dart';
import 'package:capstone/screens/admin/dashboard/dashboard_screen.dart';
import 'package:capstone/screens/admin/product/stok_screen.dart';
import 'package:flutter/material.dart';

class DrawWidget extends StatelessWidget {
  const DrawWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _header(),
          _item(
              text: 'Dashboard',
              // ignore: avoid_print
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DashboardScreen();
                }));
              }),
          _item(
              text: 'Daftar Mitra',
              // ignore: avoid_print
              onTap: () => print('Tap New Secret Chat')),
          _item(
              text: 'Pelanggan',
              // ignore: avoid_print
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CustomerScreen();
                }));
              }),

          _item(
              text: 'Poin Pelanggan',
              // ignore: avoid_print
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CustomerPointScreen();
                }));
              }),
          _item(
              text: 'Stok Produk',
              // ignore: avoid_print
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StokScreen();
                }));
              }),
          _item(
              text: 'Transaksi',
              // ignore: avoid_print
              onTap: () => print('Tap Settings')),
          _item(
              text: 'Riwayat',
              // ignore: avoid_print
              onTap: () => print('Tap Telegram FAQ')),
          _item(
              text: 'Mitra',
              // ignore: avoid_print
              onTap: () => print('Tap Settings')),
          _item(
              text: 'Pelanggan',
              // ignore: avoid_print
              onTap: () => print('Tap Telegram FAQ')),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          //   child: Text("Labels",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.blue,
          //       )),
          // ),
        ],
      ),
    );
  }

  Widget _header() {
    return const UserAccountsDrawerHeader(
      currentAccountPicture: ClipOval(
        child:
            Image(image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover),
      ),
      accountName: Text(
        'Point.ID',
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      accountEmail: Text(
        'Admin',
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _item(
      {Color? backgroundColor, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          // Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
