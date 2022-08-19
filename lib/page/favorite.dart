import 'package:flutter/material.dart';

import '../widget/appBar.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  Widget _bodyWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: Color.fromARGB(221, 179, 208, 235),
      alignment: Alignment.center,
      child: Column(children: const [
        Text(
          "== 관심도서 공사 중 ==",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}
