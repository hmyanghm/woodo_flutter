import 'package:flutter/material.dart';
import 'package:woodo/page/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  var _isCheck = false;
  String _mobile = "";
  String _password = "";
  bool _isObscure = true;

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
      form.save();
      print('Form is valid mobile: $_mobile, password: $_password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('환영합니다!'),
          duration: Duration(milliseconds: 500),
        ),
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 200,
                child: Image.asset(
                  'assets/logo/logo_main_big_x.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: double.infinity,
                child: TextFormField(
                  onTap: () {
                    _scrollController.animateTo(
                      234.115438191883,
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
                      return '핸드폰번호 형식이 맞지 않습니다.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure,
                  obscuringCharacter: '*',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: '비밀번호 입력',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.amber),
                      ),
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      )),
                  onSaved: (value) {
                    setState(() {
                      _password = value!;
                    });
                  },
                  validator: (value) {
                    _password = value!;
                    if (value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    } else if (value.length < 4) {
                      return '비밀번호는 4자 이상 입력해주세요.';
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
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '자동 로그인',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                value: _isCheck,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _isCheck = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          textStyle:
                              TextStyle(fontSize: 13, fontFamily: 'main'),
                        ),
                        child: Text('비밀번호 찾기'),
                        onPressed: () {
                          print('비밀번호 찾기 Click !!');
                        },
                      ),
                      Text(
                        ' │ ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          textStyle:
                              TextStyle(fontSize: 13, fontFamily: 'main'),
                        ),
                        child: Text('회원가입'),
                        onPressed: () {
                          print('회원가입 Click !!');
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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
