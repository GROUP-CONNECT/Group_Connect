import 'package:Group_Connect/screens/SCREENS/auth.dart';
import 'package:flutter/material.dart';

import 'package:Group_Connect/screens/SCREENS/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import 'package:Group_Connect/providers/Auth.dart';
import 'package:Group_Connect/providers/Course.dart';
import 'package:Group_Connect/providers/coursePost.dart';
import '../screens/SCREENS/createCourse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Group_Connect/screens/SCREENS/enrolledCourse.dart';
import 'package:Group_Connect/screens/SCREENS/userHome.dart';

class MainNav extends StatefulWidget {
  @override
  static const routeName = '/mainNav';
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int pageIndex = 0;
  List<Widget> pages = [Feed(), EnrolledCourse(), UserHomeFeed()];
  var appBarTitles = ['Dashboard', 'Enrolled courses', 'Your courses'];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var profile_picture;
  bool isLoading = false;
  void initState() {
    super.initState();
    print('init called');
    // Provider.of<UserProvider>(context, listen: false).signOut();
    Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .then((value) => {
              setState(() {
                isLoading = true;
              }),
              Provider.of<UserProvider>(context, listen: false)
                  .getUser()
                  .then((value) => {
                        setState(() {
                          profile_picture = value.profile_picture;
                          isLoading = false;
                        })
                      })
            });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            appBar: AppBar(
                title: Text(appBarTitles[pageIndex]),
                backgroundColor: Theme.of(context).primaryColor,
                actions: <Widget>[
                  pageIndex == 2
                      ? IconButton(
                          icon: const Icon(
                              IconData(0xe8a6, fontFamily: 'MaterialIcons')),
                          tooltip: 'User',
                          onPressed: () async {
                            await Provider.of<UserProvider>(context,
                                    listen: false)
                                .signOut();
                            Provider.of<CoursePostProvider>(context,
                                    listen: false)
                                .clearCoursePostProvider();
                            Provider.of<CourseProvider>(context, listen: false)
                                .clearCourseProvider();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Auth(),
                                ));
                          },
                        )
                      : Container()
                ]),
            body: pages[pageIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconData(0xe871, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                  label: ('dashboard'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconData(0xe039, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                    ),
                    label: 'Enrolled'),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 15,
                    foregroundColor: Colors.cyan,
                    backgroundImage: NetworkImage(profile_picture),
                  ),
                  label: ('Your Courses'),
                ),
              ],
              currentIndex: pageIndex,
              onTap: (i) {
                setState(() {
                  pageIndex = i;
                });
              },
              type: BottomNavigationBarType.fixed,
            ),
            floatingActionButton: pageIndex == 2
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CreateCourse.routeName);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                : null,
          )
        : CircularProgressIndicator();
  }
}
