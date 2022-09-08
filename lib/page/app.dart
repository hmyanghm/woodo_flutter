import 'package:flutter/material.dart';
import 'package:woodo/widget/pageSlide.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageSlideWidget(),
    );
  }
}
