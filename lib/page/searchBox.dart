import 'package:flutter/material.dart';
import 'package:woodo/repository/favoriteFindList_repository.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  List<String> bookList = FavoriteFindList().getList();

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('searchBox app bar click !!');
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
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Text(
                        '자바의 정석',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: bookList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1,
                color: Colors.orange,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }
}
