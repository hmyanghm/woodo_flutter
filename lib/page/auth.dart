import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  String _mobile = "";

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
      print('Form is valid mobile: $_mobile');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('환영합니다!'),
          duration: Duration(milliseconds: 500),
        ),
      );
      // SMS 인증 완료 후 넘기기
      // Navigator.push(
      //     context, MaterialPageRoute(builder: ((context) => MainApp())));
    } else {
      print('Form is invalid mobile: $_mobile');
    }
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
                width: 150,
                child: Image.asset(
                  'assets/logo/logo_main_big_x.png',
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 40),
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
              Container(
                margin: EdgeInsets.only(top: 10),
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
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      print('핸드폰번호 인증 클릭 !!');
                      validateAndSave();
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.amber,
                    ),
                    child: Text(
                      '인증번호 발송',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )),
              ),
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