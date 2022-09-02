import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isCheck = false;

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      title: Text('로그인'),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyWidget() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/logo/logo_main_big_x.png',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60),
          width: 300,
          height: 45,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: '핸드폰번호 입력',
              hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade300,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.amber),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 300,
          height: 45,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: '비밀번호 입력',
              hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade300,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.amber),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 300,
          height: 45,
          child: ElevatedButton(
              onPressed: () {
                print('로그인 버튼 클릭');
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Login()));
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
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              // color: Colors.red,
              child: Checkbox(
                  value: _isCheck,
                  onChanged: (value) {
                    setState(() {
                      _isCheck = value!;
                    });
                  }),
            ),
            Text(
              '자동 로그인',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        Row(
          children: const [
            SizedBox(
              width: 180,
              child: Text(
                '비밀번호 찾기',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              ' │ ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '회원가입',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: bodyWidget(),
    );
  }
}
