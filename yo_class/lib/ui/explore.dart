import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  PageController _pageController = PageController();
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  List _sliderPageImages = [
    'assets/images/courses main.png',
    'assets/images/home slider3.png',
  ];

  @override
  void initState() {
    super.initState();
    this.startSlides();

    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.2, end: 0.9).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  startSlides() {
    Timer.periodic(Duration(seconds: 5), (t) {
      if (mounted) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      } else {
        // cancel timer
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
//              forceElevated: true,
            floating: true,
            pinned: false,
            elevation: 10,
            expandedHeight: MediaQuery.of(context).size.height / 3,

//              floating: true,
//              elevation: 10,
            title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Course',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 25)),
                  TextSpan(
                      text: 'hub',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600))
                ])),
            leading: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Container(
                child: Image.asset('assets/images/Coursehub logo.png'),
              ),
            ),
            backgroundColor: Colors.white,

            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.alarm,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                    child: PageView.builder(
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.asset(
                                    index % 2 == 0
                                        ? _sliderPageImages[0]
                                        : _sliderPageImages[1],
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                right: .9,
                                bottom: 0,
                                child: FadeTransition(
                                  opacity: _fadeInFadeOut,
                                  child: ElevatedButton(
                                    //   color: Colors.blue.withOpacity(.8),
                                    //  shape: RoundedRectangleBorder(
                                    //  borderRadius: BorderRadius.only(
                                    //  bottomRight: Radius.circular(20)
                                    //     )
                                    //  ),
                                    //  onPressed:(){

                                    //  },
                                    child: Text(
                                      'Learn More'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                          // TODO: refactor to display relevant content leading to unique destinations
                        })),
                FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            sliver: SliverAppBar(
                titleSpacing: 0,
                snap: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                pinned: true,
                floating: true,
                leading: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Colors.blueAccent, Colors.purple])),
//                          color: Colors.purpleAccent,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                title: Padding(
                  padding: EdgeInsets.all(0), // remove
                  child: Container(
                    decoration: BoxDecoration(),
                    child: TextField(
                      decoration: InputDecoration(
                        border: null,
                        focusColor: Colors.blueAccent,
                        hintText: 'Search Courses',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )),
            padding: EdgeInsets.all(20),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Top Developers'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: 100,
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Dev. $index',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.cyan.withOpacity(.1),
                                            Colors.lightBlue.withOpacity(.6),
                                          ],
                                          stops: [
                                            0.7,
                                            0.8
                                          ])),
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(index % 2 == 0
                                          ? 'https://pbs.twimg.com/profile_images/1271971746506252290/E8bs2lts_400x400.jpg'
                                          : 'https://cdn4.iconfinder.com/data/icons/profession-avatar-5/64/29-programmer-512.png')),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 100.0,
                                height: 50,
                              );
                            })),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Top Courses'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Colors.blue),
                    ),
                  );
                }

                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
//                            color: index%2==0?Colors.pinkAccent:Colors.blue,
                        gradient: LinearGradient(
                            colors: index % 2 == 0
                                ? [
                                    Colors.pinkAccent,
                                    Colors.pinkAccent.withOpacity(.4)
                                  ]
                                : [Colors.lightBlue, Colors.cyan]),
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height / 4.2,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Introduction To Ethical Hacking ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_alarm,
                                      color: Colors.white.withOpacity(.5)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '$index HRS',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                              Chip(
                                backgroundColor: Colors.white,
                                avatar: CircleAvatar(
                                  backgroundColor: index % 2 == 0
                                      ? Colors.pinkAccent
                                      : Colors.lightBlue,
                                  child: Icon(
                                    index % 2 == 0
                                        ? Icons.lock_open
                                        : Icons.lock,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                label: Text(
                                  index % 2 == 0 ? 'Public' : 'Private',
                                  style: TextStyle(
                                      color: index % 2 == 0
                                          ? Colors.pinkAccent
                                          : Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    'https://pbs.twimg.com/profile_images/1271971746506252290/E8bs2lts_400x400.jpg'),
                              ),
                              Text(
                                'TanyaTheCoder',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
