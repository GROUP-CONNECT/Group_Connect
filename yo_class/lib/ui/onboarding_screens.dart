import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'account/account.newaccount.dart';
import 'account/account.newaccount.dart';
import 'base.dart';

final List<String> imgList = [
  'assets/images/Coursehub logo.png',
  'assets/images/home slider2.png',
  'assets/images/home slider3.png',
];

final List<String> stepList = [
  'Access content anywhere, anytime - you \ncan even save content for offline usage',
  'Course sharing and tutoring platform for Africa',
  'Learn anytime, anywhere and every time',
];

final List carouselImages = map<Widget>(
  imgList,
  stepList,
  (index, i) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(i, fit: BoxFit.cover, width: 200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Yo',
                    style: TextStyle(
                        color: Color(0xff1A72FF),
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    'Class',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                stepList[index],
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 15.0,
                  height: 1.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
).toList();

List<T> map<T>(List list, List wordList, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Step indicator
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: carouselImages,
            options: CarouselOptions(
                viewportFraction: 1.0,
                aspectRatio: 1.2,
                autoPlay: true,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              imgList,
              stepList,
              (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color(0xff1A72FF)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewAccount(),
                    ));
              },
              //  color: Color(0xff1A72FF),
              child: Text(
                'CREATE NEW ACCOUNT',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Base(),
                  ));
            },
            //   color: Colors.white,
            child: Text(
              'LOG IN',
              style: TextStyle(
                  color: Color(0xff1A72FF),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
