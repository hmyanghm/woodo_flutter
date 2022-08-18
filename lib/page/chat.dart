import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('chat main menu click !!');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '채팅',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
      elevation: 1,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/bell.png',
              width: 20,
              color: Colors.white70,
            )),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: Color.fromARGB(221, 236, 234, 213),
      alignment: Alignment.center,
      child: Column(children: const [
        Text(
          "== 채팅창 공사 중 ==",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
          ),
        )
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
