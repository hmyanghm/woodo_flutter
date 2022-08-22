import 'dart:async';

import 'package:flutter/material.dart';
import 'package:woodo/page/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Timer(
  //   Duration(milliseconds: 1),
  //   () => runApp(const MyApp()),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        color: Colors.amber,
        title: 'WOODO',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'main',
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future<Widget> initialize(BuildContext context) async {
    return SplashScreen();
  }
}
