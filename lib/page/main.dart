import 'package:flutter/material.dart';
import 'package:woodo/page/chat.dart';
import 'package:woodo/page/list.dart';
import 'package:woodo/page/mypage.dart';
import 'package:woodo/widget/appBar.dart';
import 'package:woodo/widget/pageSlide.dart';
import 'package:woodo/widget/pageView.dart';

import 'favorite.dart';
import 'home.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentPageIndex = 0;

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
      // return PageViewWidget();
      // return PageSlideWidget();
      case 1:
        return MainList();
      case 2:
        return Chat();
      case 3:
        return MyFavorite();
      case 4:
        return MyPage();
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          'assets/icons/$iconName.png',
          width: 22,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          'assets/icons/${iconName}_on.png',
          width: 22,
        ),
      ),
      label: label,
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
        print(index);
      },
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBarItem('home', '홈'),
        _bottomNavigationBarItem('pin', '우리동네'),
        _bottomNavigationBarItem('chat', '채팅'),
        _bottomNavigationBarItem('good', '관심도서'),
        _bottomNavigationBarItem('mypage', '마이페이지'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(title: "우리동네 도서관", appBar: AppBar()),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
