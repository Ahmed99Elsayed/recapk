import 'package:flutter/material.dart';
import 'package:prefirebase/models/user.dart';
import 'package:prefirebase/screens/annon/annon_screen.dart';
import 'package:prefirebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
//import 'package:prefirebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return home or auth depend on state of auth now
    if (user == null) {
      return Authenticate();
    } else {
      return AnnonScreen();
    }
  }
}
