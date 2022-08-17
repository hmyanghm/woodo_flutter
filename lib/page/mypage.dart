import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
      color: Color.fromARGB(221, 236, 234, 213),
      alignment: Alignment.center,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/icons/profile.png',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 300,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "== 마이페이지 공사 중 ==",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
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
