import 'dart:async';

import 'package:flutter/material.dart';
import 'package:woodo/page/splash.dart';

void main() {
  runApp(const MyApp());
}

// class Init {
//   Init._();
//   static final instance = Init._();

//   Future<Widget> initialize(BuildContext context) async {
//     return SplashScreen();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(context),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: SplashScreen(),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: MyApp(),
            );
          } else {
            return MaterialApp(
              title: 'WOODO',
              theme: ThemeData(primarySwatch: Colors.amber),
              home: snapshot.data,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    textScaleFactor: MediaQuery.of(context)
                        .textScaleFactor
                        .clamp(0.95, 1.05)),
                child: child!,
              ),
            );
          }
        });
  }
}
//   return GestureDetector(
//     onTap: () {
//       FocusManager.instance.primaryFocus?.unfocus();
//     },
//     child: MaterialApp(
//       color: Colors.amber,
//       title: 'WOODO',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//         primarySwatch: Colors.amber,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: 'main',
//       ),
//       home: SplashScreen(),
//     ),
//   );
// }

class Init {
  Init._();
  static final instance = Init._();

  Future<Widget> initialize(BuildContext context) async {
    return SplashScreen();
  }
}
