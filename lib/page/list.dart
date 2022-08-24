import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  _MainListState();

  List searchKeyword = [];
  List dbList = [];
  TextEditingController txtQuery = TextEditingController();

  final oCcy = NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString) {
    return '일 ${oCcy.format(int.parse(priceString))}원';
  }

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/bookList.json');
    var json = jsonDecode(jsonStr);
    searchKeyword = json;
    dbList = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      searchKeyword = dbList;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    List result = [];
    searchKeyword.forEach((word) {
      var title = word["title"].toString().toLowerCase();
      if (title.contains(query)) {
        result.add(word);
      }
    });

    searchKeyword = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Widget _searchBar() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '대여 또는 대출하고 싶은 도서명을 검색해보세요!',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: txtQuery,
              onChanged: search,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                hintText: '도서명 검색',
                labelStyle: TextStyle(
                  fontSize: 15,
                  height: 1,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.amber)),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    txtQuery.text = '';
                    search(txtQuery.text);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget(context) {
    return Column(
      children: <Widget>[
        _searchBar(),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemCount: searchKeyword.length,
            itemBuilder: (context, index) {
              var bookTitle = searchKeyword[index];
              return Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        bookTitle['image'].toString(),
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
                              bookTitle['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 2,
                              ),
                            ),
                            Spacer(flex: 1),
                            Text(
                              bookTitle['location'].toString(),
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
                                      text: bookTitle['status'],
                                      style: TextStyle(
                                          color: bookTitle['status'] == '가능'
                                              ? Colors.blue
                                              : Colors.red))
                                ],
                              ),
                            ),
                            Spacer(flex: 1),
                            Text(
                              calcStringToWon('${bookTitle['price']}'),
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
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 1, color: Colors.black.withOpacity(0.4));
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }
}
