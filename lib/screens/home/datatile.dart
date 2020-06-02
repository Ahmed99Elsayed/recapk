import 'package:flutter/material.dart';
import 'package:prefirebase/models/recapakdata.dart';

class DataTile extends StatelessWidget {
  final ReCapakUserData item;
  DataTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown,
          ),
          title: Text(item.name),
          subtitle: Text(
            'age is ${item.age.toString()} and your field is ${item.field}',
          ),
        ),
      ),
    );
  }
}
