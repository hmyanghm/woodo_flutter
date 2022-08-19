import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
