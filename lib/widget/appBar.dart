import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  final AppBar appBar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/menu');
          print('menu icon click !!');
        },
        icon: const Icon(Icons.menu),
      ),
      elevation: 1,
      title: Text(
        title,
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

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
