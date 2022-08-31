import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:woodo/main.dart';
import 'package:woodo/page/main.dart';

class PageSlideWidget extends StatefulWidget {
  const PageSlideWidget({Key? key}) : super(key: key);

  @override
  _PageSlideWidgetState createState() => _PageSlideWidgetState();
}

class _PageSlideWidgetState extends State<PageSlideWidget> {
  int _currentIndex = 0;

  List desc = [
    '생각보다 부담되는 책 값\nWOODO에서 소액으로 대여해요',
    '우리 동네에서 간편하게\n읽고 싶은 책을 대여할 수 있습니다',
    '집에서 먼지만 쌓이고 있는 책\n이웃 주민에게 대여해주고\n용돈 벌어요',
    '책 훼손 방지를 위해\n보증금 제도가 있습니다.\n안심하고 이용하세요!',
    '지금 바로 시작하세요!',
  ];

  final CarouselController _controller = CarouselController();

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      title: Text(
        'WOODO',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 70),
          height: 200,
          child: Image.asset(
            'assets/logo/logo_main_big_x.png',
            width: 200,
            height: 200,
          ),
        ),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 160,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 300),
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [0, 1, 2, 3, 4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      desc[i],
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: desc.map((i) {
            int index = desc.indexOf(i);
            return Container(
              width: 10,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromARGB(255, 31, 30, 30)
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          width: 280,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                print('회원가입 버튼 클릭');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 280,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                print('로그인 버튼 클릭');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 173, 172, 172),
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 280,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                print('바로 시작 버튼 클릭');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainApp()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 129, 167, 236),
              ),
              child: Text(
                '바로 시작',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBarWidget(), body: _bodyWidget());
  }
}
