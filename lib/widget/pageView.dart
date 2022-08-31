import 'dart:ui';

import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  get children => null;

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 1);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash1.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 200,
              height: 40,
              child: Image.asset(
                'assets/splash/dot1.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('회원가입 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('로그인 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 173, 172, 172),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash2.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 200,
              height: 40,
              child: Image.asset(
                'assets/splash/dot2.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('회원가입 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('로그인 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 173, 172, 172),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash3.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 200,
              height: 40,
              child: Image.asset(
                'assets/splash/dot3.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('회원가입 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('로그인 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 173, 172, 172),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash4.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 200,
              height: 40,
              child: Image.asset(
                'assets/splash/dot4.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('회원가입 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('로그인 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 173, 172, 172),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash5.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 200,
              height: 40,
              child: Image.asset(
                'assets/splash/dot5.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('회원가입 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    print('로그인 버튼 CLICK !!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 173, 172, 172),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ],
    );
  }
}
