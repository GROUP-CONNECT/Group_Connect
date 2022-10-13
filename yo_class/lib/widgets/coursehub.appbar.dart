import 'package:coursehub/utils/index.dart';
import 'package:flutter/material.dart';

/// custom appbar
/// notification icon doesnt change, its there whenever there is this appbar
/// the other icon changes and must be passed as a image asset path e.g assets/images/plus.png
/// function callback responds to when the icons are pressed and must be passed it
/// notification icon count text must be passed else its blank
class CourseHubAppBar extends StatelessWidget {
  final String additionalIconAssetPath;
  final Function additionalIconOnTapCallback;
  final Function notificationIconOnTapCallback;
  final String notificationIconCount;

  const CourseHubAppBar({
    Key key,
    @required this.additionalIconAssetPath,
    @required this.additionalIconOnTapCallback,
    @required this.notificationIconOnTapCallback,
    this.notificationIconCount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if text is greater than 3 e.g 100, add an + e.g 10*
    notificationIconCount.trim();

    String _countText = notificationIconCount.length > 2
        ? '${notificationIconCount[0]}${notificationIconCount[1]}*'
        : notificationIconCount;

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/Coursehub logo.png',
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Yo', style: courseStyle),
                      TextSpan(text: 'Class', style: hubStyle),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: additionalIconOnTapCallback,
                  child: Image.asset(
                    additionalIconAssetPath,
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: notificationIconOnTapCallback,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 9,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: lightReddish,
                          child: Center(
                            child: Text(
                              _countText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/notifications.png',
                          height: 26,
                          width: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
