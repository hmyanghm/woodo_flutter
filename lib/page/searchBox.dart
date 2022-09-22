import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woodo/page/defaultList.dart';
import 'dart:convert';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List searchKeyword = [];
  List dbList = [];
  TextEditingController txtQuery = TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/recommend.json');
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
    searchKeyword.forEach((p) {
      var title = p["title"].toString().toLowerCase();
      if (title.contains(query)) {
        result.add(p);
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

  Widget _recommendView(searchKeyword) {
    return Expanded(
      child: ListView.builder(
          itemCount: searchKeyword.length,
          itemBuilder: (context, index) {
            var keyword = searchKeyword[index];
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print(searchKeyword[index]);
                      txtQuery.text = keyword['title'];
                    },
                    child: Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Text(
                        keyword['title'],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade500,
                          fontFamily: 'chat',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      elevation: 1,
      title: Text(
        '우리동네 도서관',
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

  Widget _bodyWidget() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                TextFormField(
                  controller: txtQuery,
                  onChanged: search,
                  decoration: InputDecoration(
                    hintText: "도서명 검색",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        txtQuery.text = '';
                        search(txtQuery.text);
                      },
                    ),
                  ),
                  onSaved: (word) => txtQuery.text = word!,
                  onFieldSubmitted: (word) {
                    print('검색어::: ' + word);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DefaultList()));
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            height: 25,
            child: Text(
              '많이 찾는 책이에요!',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'chat',
                color: Colors.black,
              ),
            ),
          ),
          _recommendView(searchKeyword),
        ]);
  }

  Widget _bookListView(searchKeyword) {
    return Expanded(child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBarWidget(), body: _bodyWidget());
  }
}
