import 'package:flutter/material.dart';
import 'package:prefirebase/screens/annon/annon_screen.dart';
import 'package:prefirebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:prefirebase/models/user.dart';

void main() => runApp(MyApp());
// Testttstst
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user, // listen on stream
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnnonScreen(),
      ),
    );
  }
}
