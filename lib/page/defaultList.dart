import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:woodo/repository/contents_repository.dart';
import 'package:woodo/widget/appBar.dart';

class DefaultList extends StatefulWidget {
  const DefaultList({Key? key}) : super(key: key);

  @override
  _DefaultListState createState() => _DefaultListState();
}

class _DefaultListState extends State<DefaultList> {
  int _currentPageIndex = 0;
  List<Map<String, String>> datas = ContentRepository().getContents();

  @override
  void initState() {
    super.initState();
  }

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
    return Column(
      children: <Widget>[
        _searchBar(),
        Padding(padding: EdgeInsets.only(top: 20)),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // color: Colors.blue,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        datas[index]['image'].toString(),
                        width: 90,
                        height: 90,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              datas[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 2,
                              ),
                            ),
                            Spacer(flex: 1),
                            Text(
                              datas[index]['location'].toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 167, 165, 165)),
                            ),
                            Spacer(flex: 2),
                            Text.rich(
                              TextSpan(
                                text: '대여 ',
                                children: <TextSpan>[
                                  TextSpan(
                                      text: datas[index]['status'],
                                      style: TextStyle(
                                          color: datas[index]['status'] == '가능'
                                              ? Colors.blue
                                              : Colors.red))
                                ],
                              ),
                            ),
                            Spacer(flex: 1),
                            Text(
                              calcStringToWon('${datas[index]['price']}'),
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: datas.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 1, color: Colors.black.withOpacity(0.4));
            },
          ),
        ),
      ],
    );
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
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
