import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';

import 'package:coursehub/ui/index.dart';
import 'package:coursehub/utils/index.dart';
import 'package:provider/provider.dart';
import './models/auth.dart';
import './models/course_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Yo Class',
//       theme: mainTheme,
//       home: OnboardingScreen(),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
            debugShowCheckedModeBanner: false,
            title: 'Yo Class',
            theme: mainTheme,
            home: OnboardingScreen(),
          );
        }));
  }
}
