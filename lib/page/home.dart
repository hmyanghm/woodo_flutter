import 'package:flutter/material.dart';
import 'package:woodo/page/searchBox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;

  Widget _bodyWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 250,
            height: 250,
            child: Image.asset(
              'assets/logo/logo_main_big_x.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              print('도서명 입력');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 300,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '대여 또는 대출하고 싶은 도서명을 검색해보세요!',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SearchBox()),
                  ),
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                labelText: '도서명',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.amber)),
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bodyWidget(),
    );
  }
}
