import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:woodo/page/login.dart';

class PageSlideWidget extends StatefulWidget {
  const PageSlideWidget({Key? key}) : super(key: key);

  @override
  _PageSlideWidgetState createState() => _PageSlideWidgetState();
}

class _PageSlideWidgetState extends State<PageSlideWidget> {
  int _currentIndex = 0;
  List splash = [
    'assets/main/main_1.png',
    'assets/main/main_2.png',
    'assets/main/main_3.png',
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
    var getScreenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Center(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: getScreenHeight * 0.8,
              viewportFraction: 1.0,
              autoPlay: true,
              // autoPlayAnimationDuration: Duration(milliseconds: 300),
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [0, 1, 2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    splash[i],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: splash.map((i) {
            int index = splash.indexOf(i);
            return Container(
              width: 10,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.amber
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          width: 280,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                print('회원가입 버튼 클릭');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => Login())),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              child: Text(
                '회원가입 / 로그인',
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
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}
