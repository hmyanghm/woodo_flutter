import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo/logo_main_big_x.png',
              width: 250,
              height: 250,
            ),
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
          )
        ],
      ),
    );
  }
}
