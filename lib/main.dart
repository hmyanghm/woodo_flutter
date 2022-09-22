import 'package:flutter/material.dart';
import 'package:woodo/widget/pageSlide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('assets/main/main_1.png').image, context);
    precacheImage(Image.asset('assets/main/main_2.png').image, context);
    precacheImage(Image.asset('assets/main/main_3.png').image, context);
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
        home: PageSlideWidget(),
      ),
    );
  }
}
