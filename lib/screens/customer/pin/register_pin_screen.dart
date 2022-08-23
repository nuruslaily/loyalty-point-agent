import 'package:capstone/screens/customer/login/login_screen.dart';
import 'package:capstone/screens/customer/pin/header_pin_screen.dart';
import 'package:capstone/screens/customer/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatefulWidget {
  String email;
  String password;
  String name;
  String phone;
  PinScreen(
      {Key? key,
      required this.email,
      required this.password,
      required this.name,
      required this.phone})
      : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final _pinController = TextEditingController();
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String pin = '';

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pinController.addListener(() {
      setState(() {
        pin = _pinController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RegisterViewModel modelView = Provider.of<RegisterViewModel>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeaderPinScreen(size: size),
            const SizedBox(
              height: 60,
            ),
            PinCodeTextField(
              autofocus: false,
              controller: _pinController,
              maxLength: 4,
              highlight: false,
              hasUnderline: true,
              // hideCharacter: true,
              hasTextBorderColor: Colors.transparent,
              pinBoxColor: Colors.transparent,
              // highlightPinBoxColor: Colors.grey,
              onDone: (text) => getPINRegister(modelView)
              // highlightColor: Colors.grey,
              // defaultBorderColor: Colors.black,
              // maskCharacter: "*",
            ),
          ],
        ),
      ),
    );
  }

  getPINRegister(RegisterViewModel viewModel) async {
    email = widget.email;
    password = widget.password;
    name= widget.name;
    phone = widget.phone;
    pin = _pinController.text;

    final message = await viewModel.postRegister(email, password, name, phone, int.parse(pin));
    if (message != null) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const LoginScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    } else {
      print("error $message");
      final snackBar = SnackBar(
        content: Text("$message"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
