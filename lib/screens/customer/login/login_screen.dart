import 'package:capstone/after_splash_screen.dart';
import 'package:capstone/model/api/login_api.dart';
import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/admin/dashboard/dashboard_screen.dart';
import 'package:capstone/screens/admin/login/admin_login_view_model.dart';
import 'package:capstone/screens/customer/login/login_view_model.dart';
import 'package:capstone/screens/customer/register/register_screen.dart';
import 'package:capstone/screens/customer/widget/bottom_navigation_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  // final Function(LoginModel) onCreate;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  late final SharedPreferences logindata;
  String email = '';
  String password = '';
  late bool user;

  final formKey = GlobalKey<FormState>();

  bool _isHidePassword = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email').toString();
      password = logindata.getString('password').toString();
    });
    user = logindata.getBool('login') ?? true;
    if (user == false) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const BottomNavigationScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    checkLogin().whenComplete(() {
      setState(() {
        email = _emailController.text;
        password = _passwordController.text;
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
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    AdminLoginViewModel viewModel = Provider.of<AdminLoginViewModel>(context);
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
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset('assets/img/logo.png', height: 100, width: 200),
              const SizedBox(
                height: 20,
              ),
              const Text('Email address'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    // hintText: 'Email Address',
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
              const Text('Password'),
              TextFormField(
                  controller: _passwordController,
                  obscureText: _isHidePassword,
                  autofocus: false,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap:() {
                          _togglePasswordVisibility();
                        },
                        child: Icon(_isHidePassword ? Icons.visibility_off : Icons.visibility,
                        color: _isHidePassword ? Colors.grey : Colors.blue,),
                        ),    
                        isDense: true,                  
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                    if (value != null && value.length > 5) {
                      return null;
                    } else {
                      return 'Enter min. 5 characters';
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontFamily: 'OpenSans'),
                ),
                onPressed: () => (email == "admin@gmail.com") ? getButtonLoginAdmin(viewModel) : getButtonLoginCustomer(modelView),
              ),
              const SizedBox(
                height: 100,
              ),
              // Spacer(),
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
                      "I'am a new member.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const RegisterScreen();
                      }));
                    },
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget sign_up() {
    return TextButton(
      // style: TextButton.styleFrom(
      //   textStyle: const TextStyle(fontSize: 20),
      // ),
      onPressed: () {
         Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return RegisterScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
      },
      child: const Text(
        'Sign Up',
        style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  getButtonLoginCustomer(LoginViewModel modelView) async {
    print('di klik');

    email = _emailController.text;
    password = _passwordController.text;

    final message = await modelView.postLoginCustomer(email, password);
    if (message == null) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const BottomNavigationScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    }else{
       print("error $message");
      final snackBar = SnackBar(
        content: Text("$message"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getButtonLoginAdmin(AdminLoginViewModel modelView) async {
    print('di klik');

    email = _emailController.text;
    password = _passwordController.text;

    final message = await modelView.postLoginAdmin(email, password);
    if (message == null) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const DashboardScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    }else{
       print("error $message");
      final snackBar = SnackBar(
        content: Text("$message"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
