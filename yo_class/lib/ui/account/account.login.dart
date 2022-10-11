import 'package:coursehub/ui/account/account.forgotpassword.dart';
import 'package:coursehub/ui/account/account.newaccount.dart';
import 'package:coursehub/ui/account/account.static.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../base.dart';
import '../explore.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = new GlobalKey<FormState>();
  bool showSpinner = false;
  final auth = FirebaseAuth.instance;
  String email;
  String password;

  // ignore: non_constant_identifier_names
  bool _password_visibility_hidden = true;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    final size = _width * 0.25;
    const double factor = 0.075;
    return Scaffold(
      backgroundColor: Color(0xFFEBEAF2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                right: -_width * factor,
                top: -5,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: -_width * factor,
                top: _height * 0.12,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: _width * factor,
                top: _height * 0.3,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: -_width * factor,
                top: _height * 0.5,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: -_width * factor,
                top: _height * 0.5,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: _height,
                width: _width,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Image(
                          image: AssetImage(
                            'assets/images/logo.png',
                          ),
                          fit: BoxFit.fitHeight,
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                padding: containerPadding,
                                decoration: containerDecoration,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    hintText: "Email Required",
                                    labelStyle: labelStyle,
                                    hintStyle: hintStyle,
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        padding: containerPadding,
                                        decoration: containerDecoration,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Password",
                                            hintText: "Password Required",
                                            labelStyle: labelStyle,
                                            hintStyle: hintStyle,
                                            border: InputBorder.none,
                                          ),
                                          obscureText:
                                              _password_visibility_hidden,
                                          onChanged: (value) {
                                            password = value;
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 15,
                                        child: _password_visibility_hidden
                                            ? InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _password_visibility_hidden =
                                                        false;
                                                  });
                                                },
                                                child:
                                                    Icon(Icons.visibility_off),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _password_visibility_hidden =
                                                        true;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.visibility,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword(),
                                        ),
                                      ),
                                      child: Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Container(
                                color: coursehub_blue,
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  onPressed: () async {
                                    // Add login code
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    try {
                                      final user =
                                          await auth.signInWithEmailAndPassword(
                                              email: email, password: password);
                                      if (user != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Base()));
                                      }
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Text(
                                    "LOG IN",
                                    style: blueButtonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NewAccount(),
                                  ),
                                ),
                                child: Text(
                                  "CREATE NEW ACCOUNT",
                                  style: blueTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
