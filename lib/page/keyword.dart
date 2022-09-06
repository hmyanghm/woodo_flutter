import 'package:flutter/material.dart';
import 'package:woodo/page/main.dart';
import 'package:woodo/page/mypage.dart';
import 'package:woodo/widget/appBar.dart';

class KeywordPage extends StatefulWidget {
  const KeywordPage({Key? key}) : super(key: key);

  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      title: Text(
        '키워드 알림',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_active,
            color: Colors.white,
          ),
          tooltip: '아직 읽지 않은 메세지를 확인하세요.',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('알림 내역이 없습니다.'),
              duration: Duration(milliseconds: 300),
            ));
          },
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, right: 140),
          child: Text(
            '알림 받을 키워드',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, right: 15),
          child: Text(
            '키워드는 최대 5개까지 저장 가능합니다.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 50),
          width: 300,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              labelText: '도서명 검색',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.amber)),
              labelStyle: TextStyle(
                fontSize: 15,
                height: 1,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 270, top: 10),
          width: 60,
          height: 30,
          child: ElevatedButton(
              onPressed: () {
                print('등록 버튼 click!!');
              },
              child: Text(
                '등록',
                style: TextStyle(fontSize: 13),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }
}
