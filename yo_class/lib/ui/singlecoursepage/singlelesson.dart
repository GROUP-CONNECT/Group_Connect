import 'package:coursehub/utils/index.dart';
import 'package:coursehub/widgets/index.dart';
import 'package:flutter/material.dart';

class SingleLessonPage extends StatefulWidget {
  @override
  _SingleLessonPageState createState() => _SingleLessonPageState();
}

class _SingleLessonPageState extends State<SingleLessonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: <Widget>[
                    CourseTitleContainer(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                color: mainBlue,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Introduction to Ethical Hacking',
                                style: TextStyle(
                                  color: mainBlue,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.4 * 0.2,
                      left: MediaQuery.of(context).size.width * 0.3,
                      right: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'What is Ethical\n Hacking',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '1 of 8 lessons',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).size.height * 0.4 * 0.10,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'LESSON',
                                style: TextStyle(
                                  color: lightCyan,
                                ),
                              ),
                              Container(
                                width: 1.5,
                                color: blueGreyish,
                              ),
                              Text(
                                'VIDEOS',
                              ),
                              Container(
                                width: 1.5,
                                color: blueGreyish,
                              ),
                              Text(
                                'DOCS',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Introduction to Ethical Hacking',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fakeInfo,
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final String fakeInfo =
    '''Atque laborum omnis sint pariatur quae placeat laudantium. Illo soluta esse atque non. Illo maxime iure voluptatibus pariatur eligendi soluta inventore hic magnam. Similique ea at sit dignissimos qui. Magnam et doloribus. Et enim soluta non.

Molestiae porro reprehenderit est accusantium repellendus. Et est dolore. Harum rerum voluptas ut et.

A sint molestias ab repellat mollitia esse nisi et provident. Voluptatem sapiente praesentium reprehenderit inventore quia aut repellendus asperiores architecto. Aut tempora quibusdam possimus voluptas laborum rem nihil. Autem est quia officiis perferendis. Eveniet illo recusandae.''';
