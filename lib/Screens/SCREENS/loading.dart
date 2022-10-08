import 'package:Group_Connect/screens/SCREENS/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Group_Connect/providers/Auth.dart';
import 'package:Group_Connect/Home/mainNav.dart';
import 'package:Group_Connect/models/userProfile.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  bool isInit = true;

  void initState() {
    super.initState();
    // Provider.of<UserProvider>(context, listen: false).signOut();
    Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .then((value) => {
              Provider.of<UserProvider>(context, listen: false)
                  .getUser()
                  .then((value) => {
                        print('$value returned'),
                        if (value != null)
                          {
                            Navigator.pushReplacementNamed(
                                context, MainNav.routeName)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                              context,
                              Auth.routeName,
                            )
                          }
                      })
            });
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
