import 'dart:async';

import 'package:flutter/material.dart';
import 'package:woodo/page/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 3000),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => App()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String mainSplash = 'assets/logo/logo_main_big_x.png';

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                mainSplash,
                width: 250,
                height: 250,
              ),
              Align(
                child: Text(
                  '\n 생각보다 부담되는 책 값 \n WOODO에서 소액으로 대여해요',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'assets/font/BMDOHYEON.otf',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
