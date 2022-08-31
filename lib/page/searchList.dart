import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:woodo/page/chat.dart';
import 'package:woodo/page/favorite.dart';
import 'package:woodo/page/home.dart';
import 'package:woodo/page/list.dart';
import 'package:woodo/page/mypage.dart';
import 'package:woodo/repository/contents_repository.dart';

class DefaultList extends StatefulWidget {
  const DefaultList({Key? key}) : super(key: key);

  @override
  _DefaultListState createState() => _DefaultListState();
}

class _DefaultListState extends State<DefaultList> {
  int _currentPageIndex = 1;
  List<Map<String, String>> datas = ContentRepository().getContents();

  @override
  void initState() {
    super.initState();
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('default list main click !!');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '우리동네',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      elevation: 1,
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

  final oCcy = NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString) {
    return '일 ${oCcy.format(int.parse(priceString))}원';
  }

  Widget _searchBar() {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 300,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '대여 또는 대출하고 싶은 도서명을 검색해보세요!',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              labelText: '도서명 검색',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.amber)),
              labelStyle: TextStyle(
                fontSize: 15,
                height: 1,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
      case 1:
        return MainList();
      case 2:
        return Chat();
      case 3:
        return MyFavorite();
      case 4:
        return MyPage();
      default:
        MainList();
    }
    return MainList();
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
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
