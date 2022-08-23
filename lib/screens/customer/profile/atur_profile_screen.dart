import 'package:capstone/screens/customer/profile/profile_screen.dart';
import 'package:capstone/screens/customer/profile/profile_view_model.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AturProfileScreen extends StatefulWidget {
  const AturProfileScreen({Key? key}) : super(key: key);

  @override
  State<AturProfileScreen> createState() => _AturProfileScreenState();
}

class _AturProfileScreenState extends State<AturProfileScreen> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telpController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  bool _isHidePassword = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  String id = '';
  String nama = '';
  String email = '';
  String telp = '';
  String password = '';
  String token = '';
  String pin = '';

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String idUser = await sharedPref.read("id");
    String fname = await sharedPref.read("fullname");
    String emails = await sharedPref.read("email");
    String noPhone = await sharedPref.read("no_hp");
    String passwords = await sharedPref.read("password");
    String tokens = await sharedPref.read("token");
    String pins = await sharedPref.read("pin");
    setState(() {
      id = idUser.replaceAll('"', '');
      nama = fname.replaceAll('"', '');
      email = emails.replaceAll('"', '');
      telp = noPhone.replaceAll('"', '');
      password = passwords.replaceAll('"', '');
      token = tokens.replaceAll('"', '');
      pin = pins.replaceAll('"', '');
    });

    _namaController.text = fname.replaceAll('"', '');
    _emailController.text = email.replaceAll('"', '');
    _telpController.text = telp.replaceAll('"', '');
    return "done getting data";
  }

  @override
  void initState() {
    _namaController = TextEditingController();
    _emailController = TextEditingController();
    _telpController = TextEditingController();
    _passwordController = TextEditingController();
    // _loadData();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _telpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileViewModel modelView = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Atur Profile",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Nama Lengkap'),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    controller: _namaController,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
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
                        return 'Masukkan Nama Lengkap';
                      }
                    },
                  ),
                  const Text('Email'),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
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
                    validator: (email) {
                      if (email != null && EmailValidator.validate(email)) {
                        return null;
                      } else {
                        return 'Enter a valid email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Nomor Handphone'),
                  TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      controller: _telpController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.lock),
                          // hintText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
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
                        if (value != null && value.length > 10) {
                          return null;
                        } else {
                          return 'Masukkan Nomor Telepon';
                        }
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Password'),
                  TextFormField(
                      autofocus: false,
                      obscureText: _isHidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _togglePasswordVisibility();
                            },
                            child: Icon(_isHidePassword ? Icons.visibility_off : Icons.visibility, 
                            color: _isHidePassword? Colors.grey : Colors.blue),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
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
                        if (value!.length > 7) {
                          return null;
                        } else if(value.length > 0 && value.length <7) {
                          return 'Minimal 7 karakter';
                        } else if(value.length < 1) {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    child: const Text(
                      'Save',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onPressed: () => updateProfile(modelView),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  updateProfile(ProfileViewModel modelView) async {
    print('di klik');

    String editEmail = _emailController.text;
    String editNama = _namaController.text;
    String editTelp = _telpController.text;
    String editPass = _passwordController.text;

    if (editPass == '') {
      final message = await modelView.updateProfile(id, editNama, editEmail, editTelp, password, pin, token);
      if (message == null) {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return const BottomNavigationScreen();
          }, transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(
                opacity: animation.drive(tween), child: child);
          }),
        );
      } else {
        print("error $message");
        final snackBar = SnackBar(
          content: Text("$message"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final message = await modelView.updateProfile(id, editNama, editEmail, editTelp, editPass, pin, token);
      if (message == null) {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return const BottomNavigationScreen();
          }, transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(
                opacity: animation.drive(tween), child: child);
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
}
