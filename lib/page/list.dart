import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:woodo/repository/contents_repository.dart';
import 'package:woodo/widget/appBar.dart';

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List<Map<String, String>> datas = ContentRepository().getContents();

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}
