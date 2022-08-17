import 'package:flutter/material.dart';

import '../widget/appBar.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  // PreferredSizeWidget _appbarWidget() {
  //   return AppBar(
  //     title: GestureDetector(
  //       onTap: () {
  //         print('My favorite books click !!');
  //       },
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           Text(
  //             '관심도서',
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.normal,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     leading: IconButton(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       icon: const Icon(Icons.arrow_back),
  //     ),
  //     elevation: 1,
  //     actions: [
  //       IconButton(
  //           onPressed: () {},
  //           icon: Image.asset(
  //             'assets/icons/bell.png',
  //             width: 20,
  //             color: Colors.white70,
  //           )),
  //     ],
  //   );
  // }

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
      // appBar: _appbarWidget(),
      // appBar: BaseAppBar(title: "관심 도서", appBar: AppBar()),
      body: _bodyWidget(),
    );
  }
}
