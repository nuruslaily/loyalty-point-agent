import 'package:capstone/screens/customer/login/login_screen.dart';
import 'package:capstone/screens/customer/register/register_screen.dart';
import 'package:capstone/screens/customer/register/register_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterSplashScreen extends StatefulWidget {
  const AfterSplashScreen({Key? key}) : super(key: key);

  @override
  State<AfterSplashScreen> createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(500, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<LoginViewModel>(context, listen: false).getLogin();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Image.asset('assets/img/logo.png', height: 100, width: 200),
              const SizedBox(
                height: 40,
              ),
              welcomeTextWidget(),
              const Spacer(),
              getRegister(context),
              const SizedBox(
                height: 20,
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
                      "Already a member?",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginScreen();
                      }));
                    },
                  )
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeTextWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "When you shop with Point.ID, you ",
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Text(
            "wll make extra money.",
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
    );
  }


  Widget getRegister(BuildContext context) {
    final modelView = Provider.of<RegisterViewModel>(context, listen: false);
    return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          }));
        },
        child: const Text('Join Now!',
            style: TextStyle(
              fontFamily: 'Merriweather',
            )));
  }
}
