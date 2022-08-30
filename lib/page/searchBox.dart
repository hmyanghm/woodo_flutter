import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woodo/page/defaultList.dart';
import 'package:woodo/page/list.dart';
import 'dart:convert';

import 'package:woodo/widget/appBar.dart';

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

  Widget _bookListView(searchKeyword) {
    return Expanded(child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: '우리동네', appBar: AppBar()),
      body: Column(
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
                      print('onFieldSubmitted 들어옴 :::');
                      print(word);
                      print('============');
                      MaterialPageRoute(
                        builder: (context) => MainList(),
                      );
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
          ]),
    );
  }
}
