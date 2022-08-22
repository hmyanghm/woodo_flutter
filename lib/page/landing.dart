import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> mainImageList = [
    'assets/splash/splash1.png',
    'assets/splash/splash2.png',
    'assets/splash/splash3.png',
    'assets/splash/splash4.png',
    'assets/splash/splash5.png',
  ];

  Widget introFirst() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/splash/splash1.png',
              width: 250,
              height: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introSecond() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/splash/splash1.png',
              width: 250,
              height: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introThird() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/splash/splash1.png',
              width: 250,
              height: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introFourth() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/splash/splash1.png',
              width: 250,
              height: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introFifth() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/splash/splash1.png',
              width: 250,
              height: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: introFirst(),
    );
  }
}
