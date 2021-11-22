import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/main.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: RiveAnimation.asset(
        "assets/splash.riv",
        fit: BoxFit.cover,
      )),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return HomePage();
    }));
  }
}
