import 'package:flutter/material.dart';
import 'package:woodo/page/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var _isCheck = false;
  late String _mobile = "";
  late String _password = "";

  bool isValidPhoneNumberFormat() {
    print('핸드폰번호 형식 체크');
    return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(_mobile);
  }

  void validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      print('Form is valid mobile: $_mobile, password: $_password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('환영합니다!')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => MainApp())));
    } else {
      print('Form is invalid mobile: $_mobile, password: $_password');
    }
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      title: Text('로그인'),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyWidget() {
    return Form(
      key: _formKey,
      child: Column(
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
              onSaved: (value) {
                setState(() {
                  _mobile = value!;
                });
              },
              validator: (value) {
                _mobile = value!;
                if (value.isEmpty) {
                  return '핸드폰번호를 입력하세요.';
                } else if (!isValidPhoneNumberFormat()) {
                  return '핸드폰번호 형식이 맞지 않습니다.';
                } else {
                  return null;
                }
              },
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
              onSaved: (value) {
                setState(() {
                  _password = value!;
                });
              },
              validator: (value) {
                _password = value!;
                if (value.isEmpty) {
                  return '비밀번호를 입력하세요.';
                } else if (value.length < 8) {
                  return '비밀번호는 8자 이상 입력해주세요.';
                } else {
                  return null;
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 300,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  print('로그인 버튼 클릭 !!');
                  validateAndSave();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
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
          SizedBox(
            height: 100,
            child: Row(
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
            ),
          )
        ],
      ),
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
