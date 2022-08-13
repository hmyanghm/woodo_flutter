import 'package:flutter/material.dart';

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
        "location": "역삼동",
        "price": "600",
        "status": "가능"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      // centerTitle: true,
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
          // children: [Text('중계동'), Icon(Icons.arrow_drop_down)],
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
        // IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        // IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/bell.png',
              width: 20,
            )),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
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
                  height: 90,
                  child: Column(
                    children: [
                      Text(
                        datas[index]['title'].toString(),
                        // overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      Text(
                        datas[index]['location'].toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 167, 165, 165)),
                      ),
                      Text(
                        '대여 ${datas[index]['status']}',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '일 ${datas[index]['price']}원',
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
