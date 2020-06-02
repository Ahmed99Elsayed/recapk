import 'package:flutter/material.dart';
import 'package:prefirebase/services/auth.dart';
import 'package:prefirebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prefirebase/screens/home/homelist.dart';
import 'package:prefirebase/models/recapakdata.dart';
import 'package:prefirebase/screens/home/settings.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<ReCapakUserData>>.value(
      value: DataBaseServices().reCapakUserData,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.yellowAccent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("logout"),
              ),
              FlatButton.icon(
                  onPressed: () {
                    _showSettingsPanel();
                  },
                  icon: Icon(Icons.settings),
                  label: Text("settings"))
            ],
            title: Center(
              child: Text(
                "ReCapak Home",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Container(
            child: HomeList(),
          )
          //
          ),
    );
  }
}
