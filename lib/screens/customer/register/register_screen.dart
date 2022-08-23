import 'package:capstone/after_splash_screen.dart';
import 'package:capstone/screens/customer/login/login_screen.dart';
import 'package:capstone/screens/customer/pin/register_pin_screen.dart';
import 'package:capstone/screens/customer/register/register_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String phone = '';

  // late SharedPreferences logindata;
  late bool newUser;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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

  @override
  void initState() {
    super.initState();
    // initial();
    _nameController.addListener(() {
      setState(() {
        name = _nameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });
    _phoneController.addListener(() {
      setState(() {
        phone = _phoneController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const AfterSplashScreen();
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
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/img/logo.png',
                          height: 100, width: 200),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Full Name'),
                      TextFormField(
                        autofocus: false,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.length > 4) {
                            return null;
                          } else {
                            return 'Enter at least 4 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('Phone Number'),
                      TextFormField(
                        autofocus: false,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (phone) {
                          if (phone != null && phone.length <= 12) {
                            return null;
                          } else {
                            return 'Enter max 12 number';
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text('Email address'),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (email) {
                          if (email != null && EmailValidator.validate(email)) {
                            return null;
                          } else {
                            return 'Enter a valid email';
                          }
                        },
                      ),
                      const Text(
                        "We'll never share your email with anyone else",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('Password'),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _togglePasswordVisibility();
                            },
                            child: Icon(_isHidePassword ? Icons.visibility_off : Icons.visibility, 
                            color: _isHidePassword? Colors.grey : Colors.blue),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.length > 5) {
                            return null;
                          } else {
                            return 'Enter min. 5 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () => getButtonRegister(viewModel),
                          // autofocus: false,
                          child: const Text('Sign Up',
                              style: TextStyle(fontFamily: 'OpenSans'))),
                      const SizedBox(
                        height: 40,
                      ),
                      Wrap(
                        spacing: 1,
                        runSpacing: 1,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              "I'am already a member.",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return const LoginScreen();
                              }));
                            },
                          )
                        ],
                      ),
                      // sign_in()
                    ],
                  )),
            )));
  }

  getButtonRegister(RegisterViewModel viewModel) async {
    email = _emailController.text;
    password = _passwordController.text;
    name = _nameController.text;
    phone = _phoneController.text;

    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return PinScreen(
            email: email, password: password, name: name, phone: phone);
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0);
        return FadeTransition(opacity: animation.drive(tween), child: child);
      }),
    );
  }

  Widget sign_in() {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        }));
      },
      child: const Text(
        'Sign In',
        style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
