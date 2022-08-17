import 'package:flutter/material.dart';
import 'package:woodo/page/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('main click !!');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '우리동네 도서관',
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
          // Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainList()),
          );
          print('menu icon click !!');
        },
        icon: const Icon(Icons.menu),
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
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 250,
            height: 250,
            child: Image.asset(
              'assets/logo/logo_main_big_x.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
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
                labelText: '도서명',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.amber)),
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  // BottomNavigationBarItem _bottomNavigationBarItem(
  //     String iconName, String label) {
  //   return BottomNavigationBarItem(
  //     icon: Padding(
  //       padding: const EdgeInsets.only(bottom: 5),
  //       child: Image.asset(
  //         'assets/icons/$iconName.png',
  //         width: 22,
  //       ),
  //     ),
  //     activeIcon: Padding(
  //       padding: const EdgeInsets.only(bottom: 5),
  //       child: Image.asset(
  //         'assets/icons/${iconName}_on.png',
  //         width: 22,
  //       ),
  //     ),
  //     label: label,
  //   );
  // }

  // Widget _bottomNavigationBarWidget() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     onTap: (int index) {
  //       setState(() {
  //         _currentPageIndex = index;
  //       });
  //       print(index);
  //     },
  //     currentIndex: _currentPageIndex,
  //     items: [
  //       _bottomNavigationBarItem('home', '홈'),
  //       _bottomNavigationBarItem('pin', '우리동네'),
  //       _bottomNavigationBarItem('chat', '채팅'),
  //       _bottomNavigationBarItem('good', '관심도서'),
  //       _bottomNavigationBarItem('mypage', '마이페이지'),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: _appbarWidget(),
      // appBar: BaseAppBar(title: "우리동네 도서관", appBar: AppBar()),
      body: _bodyWidget(),
      // bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
