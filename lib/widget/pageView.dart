import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  get children => null;

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 1);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(12),
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/splash/splash1.png',
              ),
            ),
            Container(
              color: Colors.amber,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              width: 300,
              height: 50,
              // child: Image.asset(
              //   'assets/splash/dot1.png',
              //   // width: 100,
              //   // height: 40,
              // ),
            ),
          ],
        ),
        Container(
          color: Colors.orangeAccent.withOpacity(0.5),
          child: Center(
            child: Text(
              '두 번째 페이지',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
        Container(
          color: Colors.cyanAccent.withOpacity(0.5),
          child: Center(
            child: Text(
              '세 번째 페이지',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
