import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:woodo/page/app.dart';
// import 'package:woodo/page/chat.dart';
// import 'package:woodo/page/defaultList.dart';
// import 'package:woodo/page/home.dart';
// import 'package:woodo/page/list.dart';
// import 'package:woodo/page/mypage.dart';
import 'package:woodo/page/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print('main start ::');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SplashScreen();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'WOODO',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'main',
        ),
        // initialRoute: '/',
        // routes: <String, WidgetBuilder>{
        //   '/': (BuildContext context) => const App(),
        //   '/home': (BuildContext context) => const Home(),
        //   '/menu': (BuildContext context) => const DefaultList(),
        //   '/list': (BuildContext context) => const MainList(),
        //   '/chat': (BuildContext context) => const Chat(),
        //   '/favorite': (BuildContext context) => const MyApp(),
        //   '/mypage': (BuildContext context) => const MyPage(),
        // },
        home: SplashScreen(),
      ),
    );
  }
}
