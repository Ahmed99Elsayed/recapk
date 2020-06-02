import 'package:flutter/material.dart';
import 'package:prefirebase/services/database.dart';
import 'package:prefirebase/shared/const.dart';
import 'package:provider/provider.dart';
import 'package:prefirebase/models/user.dart';
import 'package:prefirebase/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> interstedFields = [
    'Flutter',
    'Quantum computing',
    'embedded systems',
    'web devoloping'
  ];
  String _currentName;
  int _currentAge;
  String _currentinterstedFields;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return StreamBuilder(
      stream: DataBaseServices(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("Update your settings", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                TextFormField(
                  decoration: textDecoration(textStyle)
                      .copyWith(labelText: "Enter your name"),
                  validator: (val) =>
                      val.isEmpty ? 'please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: textDecoration(textStyle)
                      .copyWith(labelText: "Enter your age"),
                  validator: (val) =>
                      val.isEmpty ? 'please enter your age' : null,
                  onChanged: (val) =>
                      setState(() => _currentAge = int.parse(val)),
                  keyboardType:
                      TextInputType.number, // Only numbers can be entered
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  value: _currentinterstedFields,
                  items: interstedFields.map((field) {
                    return DropdownMenuItem(
                        value: field, child: Text('intersted field is $field'));
                  }).toList(),
                  onChanged: (val) =>
                      setState(() => _currentinterstedFields = val),
                ),
                RaisedButton(
                  color: Colors.yellow[700],
                  child: Text('Update'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DataBaseServices(uid: user.uid).updateUserData(
                          _currentName ?? userData.name,
                          _currentAge ?? userData.age,
                          _currentinterstedFields ?? userData.interstedFields);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
