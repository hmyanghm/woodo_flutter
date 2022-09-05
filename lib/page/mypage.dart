// ignore_for_file: unnecessary_new

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
      // color: Color.fromARGB(221, 236, 234, 213),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "S1212",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 150,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    print('프로필 수정 click !!');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      )),
                  child: Text('프로필 수정'),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              print('대출 도서 목록 click !!');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.amber,
              side: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '대출 도서 목록',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              print('대여 도서 목록 click !!');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.amber,
              onSurface: Colors.blue,
              side: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '대여 도서 목록',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              print('대여 도서 목록 click !!');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.amber,
              onSurface: Colors.blue,
              side: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '키워드 알림',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
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
