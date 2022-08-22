import 'package:flutter/material.dart';
import 'package:woodo/page/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) => SearchBox()),
        //   ),
        // );
      },
      child: MaterialApp(
        title: 'WOODO',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'main',
        ),
        home: App(),
      ),
    );
  }
}
