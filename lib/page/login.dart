import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woodo/page/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visibilityAuth = false;
  String _mobile = "";
  String _auth = "";
  bool isAuthCheck = false;

  bool isValidPhoneNumberFormat() {
    print('핸드폰번호 형식 체크');
    return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(_mobile);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      print('Form is valid mobile: $_mobile');
      _changed(true);
      form.save();
    } else {
      print('Form is invalid mobile: $_mobile');
    }
  }

  void _changed(bool visibility) {
    setState(() {
      visibilityAuth = visibility;
    });
  }

  void _authCheckChanged(bool authCheck) {
    setState(() {
      isAuthCheck = authCheck;
    });
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      title: Text(
        '회원가입 / 로그인',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
    );
  }

  Widget visibilityAuthTrue() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: TextFormField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    setState(() {
                      value = _textEditingController.text;
                    });
                  },
                  onTap: () {
                    _scrollController.animateTo(
                      100.115438191883,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      return '잘못된 핸드폰번호입니다.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Flexible(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(18),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    print('인증 재요청');
                    showToastReAuth();
                  },
                  child: Text(
                    '인증 재요청',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: double.infinity,
            child: TextFormField(
              onTap: () {
                _scrollController.animateTo(
                  100.115438191883,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: '인증번호 입력',
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
                  _auth = value!;
                });
              },
              validator: (value) {
                _auth = value!;
                if (value.isEmpty) {
                  return '인증번호를 입력하세요.';
                  // } else if (!isValidPhoneNumberFormat()) {
                  // return '인증번호가 정확하지 않습니다.';
                } else if (value.length != 4) {
                  return '인증번호는 4자리입니다.';
                } else {
                  _authCheckChanged(true);
                  return null;
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  print('로그인 버튼 클릭 !!');
                  validateAndSave();
                  if (isAuthCheck == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => MainApp())));
                  }
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
        ],
      ),
    );
  }

  Widget visibilityAuthFalse() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: TextFormField(
            controller: _textEditingController,
            onTap: () {
              _scrollController.animateTo(
                100.115438191883,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                return '잘못된 핸드폰번호입니다.';
              } else {
                return null;
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
              onPressed: () {
                print('핸드폰번호 인증 클릭 !!');
                validateAndSave();
                showToast();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              child: Text(
                '인증요청',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 150,
                child: Image.asset(
                  'assets/logo/logo_main_big_x.png',
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                      '반갑습니다.\n우리동네 도서관입니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'chat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '서비스 이용을 위해 핸드폰 번호를 입력해주세요.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              visibilityAuth ? visibilityAuthTrue() : visibilityAuthFalse(),
            ],
          ),
        ),
      ),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: '인증번호가 발송되었습니다.',
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void showToastReAuth() {
    Fluttertoast.showToast(
      msg: '인증번호가 재발송되었습니다.',
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
      toastLength: Toast.LENGTH_LONG,
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
