import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();

    datas = [
      {
        "image": "assets/images/java_jeongseok.jpeg",
        "title": "자바의 정석",
        "location": "논현동",
        "price": "300",
        "status": "가능"
      },
      {
        "image": "assets/images/google_engineer.jpeg",
        "title": "구글 엔지니어는 이렇게 일한다",
        "location": "논현1동",
        "price": "600",
        "status": "가능"
      },
      {
        "image": "assets/images/jpa.jpeg",
        "title": "자바 ORM 표준 JPA 프로그래밍",
        "location": "역삼1동",
        "price": "500",
        "status": "불가능"
      },
      {
        "image": "assets/images/doit_flutter.jpeg",
        "title": "Do it! Flutter",
        "location": "도곡1동",
        "price": "600",
        "status": "가능"
      },
      {
        "image": "assets/images/springboot.jpeg",
        "title": "스프링부트와 AWS로 혼자 구현하는 웹 서비스",
        "location": "삼성동",
        "price": "500",
        "status": "불가능"
      },
      {
        "image": "assets/images/effective_java.jpeg",
        "title": "이펙티브 자바 3/E",
        "location": "대치동",
        "price": "1200",
        "status": "가능"
      },
      {
        "image": "assets/images/doit_java.jpeg",
        "title": "Do it! Java",
        "location": "삼성동",
        "price": "300",
        "status": "가능"
      },
    ];
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

  Widget _bodyWidget() {
    SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          labelText: '도서명',
        ),
      ),
    );
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
