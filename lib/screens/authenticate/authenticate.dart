import 'package:flutter/material.dart';
import 'package:prefirebase/screens/annon/annon_screen.dart';
import 'package:prefirebase/screens/authenticate/register.dart';
import 'package:prefirebase/screens/wrapper.dart';
//import 'package:prefirebase/screens/authenticate/welcome.dart';
import 'signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  bool showWelcome = true;


  
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  void toggleWelcome() {
    setState(() {
      showWelcome = !showWelcome;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == true && showWelcome == false) {
      return SignIn(
        toggleView: toggleView,
        toggleWelcome: toggleWelcome,
      ); // here we pass function toggle to sign in pass as parameter to toggle it into button
    } else if ((showSignIn == false) && (showWelcome == false)) {
      return Register(
        toggleView: toggleView,
        toggleWelcome: toggleWelcome,
      ); // here we pass function toggle to Register pass as parameter to toggle it into button
    } else {
      //return Welcome(
      return AnnonScreen(
        toggleView: toggleView,
        toggleWelcome: toggleWelcome,
        showSignIn: showSignIn,
      ); // here we pass function toggle to Register pass as parameter to toggle it into button
    }
  }
}
