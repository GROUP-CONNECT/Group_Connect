import 'package:coursehub/screens/home_screen.dart';
import 'package:coursehub/screens/video_screen_web.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coursehub/ui/index.dart';
import 'package:coursehub/utils/index.dart';
import './models/auth.dart';
import './models/course_provider.dart';
import './screens/auth_screen.dart';
import './screens/loading_screen.dart';
import './screens/course_content_screen.dart';
import './screens/video_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

@override
_MyAppState createState() => _MyAppState();
Widget layoutChecker({Widget widget}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 600 && constraints.maxHeight < 850) {
        return widget;
      } else
        return Center(
          child: Text(
            'Desktop mode is not supported yet. Run the website in a mobile phone as this is a PWA.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xAA1D9398),
              decoration: TextDecoration.none,
              fontFamily: 'Exo',
            ),
          ),
        );
    },
  );
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
//       debugShowCheckedModeBanner: false,
//       title: 'Yo Class',
//       theme: mainTheme,
//       home: OnboardingScreen(),
//     );
//   }
// }
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Courses>(
          create: null,
          update: (ctx, auth, previousCourse) => Courses(
            auth.userId, //token is the userid.
            previousCourse == null ? [] : previousCourse.courseData,
          ),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        print(auth.isAuth);
        return MaterialApp(
          title: 'Neodemy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF1D9398),
            fontFamily: 'Exo',
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              subtitle1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              subtitle2: TextStyle(
                fontSize: 10,
                color: Color(0xAA555555),
              ),
              headline2: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              headline3: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              headline4: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              caption: TextStyle(
                fontSize: 14,
                color: Color(0xAA555555),
              ),
            ),
          ),
          home: auth.isAuth
              ? layoutChecker(widget: HomeUi())
              : layoutChecker(
                  widget: FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? LoadingScreen()
                            : AuthScreen(),
                  ),
                ),
          routes: {
            '/coursecontent': (ctx) => CourseContentScreen(),
            '/videoScreen': (ctx) => VideoScreen(),
            '/videoScreenWeb': (ctx) => VideoScreenWeb(),
          },
        );
      }),
    );
  }
}
