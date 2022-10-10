import 'package:flutter/material.dart';

import 'package:Group_Connect/screens/SCREENS/addPostInCourse.dart';
import 'package:Group_Connect/screens/SCREENS/courseHome.dart';
import 'package:Group_Connect/models/course.dart';
import 'package:Group_Connect/screens/SCREENS/enrolledUser.dart';
import 'package:provider/provider.dart';
import 'package:Group_Connect/providers/coursePost.dart';
import 'package:Group_Connect/screens/SCREENS/information.dart';

class CourseNav extends StatefulWidget {
  @override
  static const routeName = '/courseNav';
  _CourseNavState createState() => _CourseNavState();
}

class _CourseNavState extends State<CourseNav> {
  @override
  int pageIndex = 0;
  late List<Widget> pages;
  bool _isLoading = false;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Course course = ModalRoute.of(context).settings.arguments;
    bool isAdmin = course.isAdmin;
    List<dynamic> enrolledId = course.enrolledId;
    String parentId = course.id;
    var appBarTitles;
    if (isAdmin) {
      pages = [
        CoursePosts(parentId),
        CourseInformationPost(parentId),
        EnrolledUser(enrolledId, parentId),
        AddPostCourse(parentId),
      ];

      appBarTitles = [
        course.title,
        'Information',
        'Enrolled users',
        'Add post'
      ];
    } else {
      pages = [
        CoursePosts(parentId),
        CourseInformationPost(parentId),
      ];
      appBarTitles = [
        course.title,
        'Information',
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[pageIndex]),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: isAdmin
          ? BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconData(0xe871, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                  label: 'feed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline, color: Colors.white),
                  label: 'information',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle, color: Colors.white),
                    label: 'enrolled users'),
                BottomNavigationBarItem(
                  icon: Icon(IconData(57672, fontFamily: 'MaterialIcons'),
                      color: Colors.white),
                  label: 'add post',
                ),
              ],
              currentIndex: pageIndex,
              onTap: (i) {
                print(i);
                setState(() {
                  pageIndex = i;
                });
              },
              type: BottomNavigationBarType.fixed,
            )
          : BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconData(0xe871, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                  label: 'feed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline, color: Colors.white),
                  label: 'information',
                )
              ],
              currentIndex: pageIndex,
              onTap: (i) {
                print(i);
                setState(() {
                  pageIndex = i;
                });
              },
            ),
    );
  }
}
