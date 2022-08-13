import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('main click !!');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '메인',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          print('menu icon click !!');
        },
        icon: const Icon(Icons.menu),
      ),
      elevation: 1,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/bell.png',
              width: 20,
            )),
      ],
    );
  }

  // Widget _bodyWidget() {
  //   // return Container(
  //   //   child: Image.asset(
  //   //     'assets/logo/logo_main_x.png',
  //   //     height: 300,
  //   //     width: 300,
  //   //   ),
  //   // );
  //   Column(children: [
  //     Container(
  //       color: Colors.blue,
  //     ),
  //     Container(
  //       color: Colors.amber,
  //     ),
  //     Container(
  //       color: Colors.blueGrey,
  //     )
  //   ],
  //   )
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      // body: _bodyWidget(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.blue,
              width: 250,
              height: 250,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.amber,
              width: 400,
              height: 70,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.blueGrey,
              width: 250,
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
