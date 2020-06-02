import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prefirebase/models/recapakdata.dart';
import 'package:prefirebase/screens/home/datatile.dart';
import 'package:prefirebase/shared/loading.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<List<ReCapakUserData>>(context) ?? [];

    if (usersData == null) {
      return Loading();
    } else {
      return ListView.builder(
          itemCount: usersData.length,
          itemBuilder: (BuildContext context, int index) {
            return DataTile(item: usersData[index]);
          });
    }
  }
}
