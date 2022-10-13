import 'package:coursehub/utils/index.dart';
import 'package:coursehub/widgets/index.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class SingleCoursePage extends StatefulWidget {
  @override
  _SingleCoursePageState createState() => _SingleCoursePageState();
}

class _SingleCoursePageState extends State<SingleCoursePage> {
  static List<Map<String, String>> _courseDetails = [
    {
      'name': 'Introduction to OOP',
      'location': 'COCIS, MAKERERE',
    },
    {
      'name': 'OOP Classes',
      'location': 'COCIS, MAKERERE',
    },
    {
      'name': 'Php OOP Properties',
      'location': 'COCIS, MAKERERE',
    },
    {
      'name': 'OOP Objects',
      'location': 'COCIS, MAKERERE',
    },
    {
      'name': 'OOP Inheritance',
      'location': 'COCIS, MAKERERE',
    },
    {
      'name': 'OOP Functions',
      'location': 'COCIS, MAKERERE',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CourseHubAppBar(
                  additionalIconAssetPath: 'assets/images/back to main.png',
                  additionalIconOnTapCallback: () => {},
                  notificationIconOnTapCallback: () => {},
                  notificationIconCount: '2',
                ),
                Container(
                  height: 80,
                  //color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15,
                        backgroundImage:
                            AssetImage('assets/images/Profile_navbar2.png'),
                      ),
                      Siz(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Introduction to OOP PHP',
                            style: singleCourseTitleStyle,
                          ),
                          SizedBox(height: 7),
                          Text(
                            'ENGINEER',
                            style: singleCourseStudentNameStyle,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        // FIXME: replace with PopupMenuWidget
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue[600],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Course Details',
                  style: singleCourseCourseTitleStyle,
                ),
                SizedBox(height: 10),
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: _courseDetails
                      .map(
                        (currentCourse) => InkWell(
                          onTap: () => navigator.push(
                            MaterialPageRoute(
                              builder: (_) => SingleLessonPage(),
                            ),
                          ),
                          child: Container(
                            height: 80,
                            //color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: Colors.blue[600],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      currentCourse['name'],
                                      style: singleCourseCourseNameStyle,
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      currentCourse['location'],
                                      softWrap: true,
                                      style: singleCourseLocationStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
