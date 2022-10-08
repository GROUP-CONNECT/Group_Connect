import 'package:flutter/material.dart';

class UserhomeFeed extends StatefulWidget {
  const UserhomeFeed({super.key});

  @override
  static const routeName ='/UserHomeFeed';
  State<UserhomeFeed> createState() => _UserhomeFeedState();
}

class _UserhomeFeedState extends State<UserhomeFeed> {
  @override
  bool _isloading = false;
  void initState() {}
  void dispose() {
    super.dispose();
  }
  @override
  double borderRadius =10,padding =10;
  Widget build(BuildContext context) {
    final course = Provider.of<CourseProvider>(context);
    final courseFeed = course.userCourse;
    return courseFeed.length != 0
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: ListView.builder(
                itemCount: courseFeed.length,
                itemBuilder: (BuildContext context, i) {
                  return (AdminCard(courseFeed[i]));
                }),
          )
        : Center(
            child: Text(
              "Nothing to show",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
  }
}
