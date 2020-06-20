import 'package:flutter/material.dart';
import 'package:prefirebase/models/const.dart';
import 'package:prefirebase/screens/annon/annon_screen.dart';
import 'package:prefirebase/services/add_recap.dart';

class BookName extends StatefulWidget {
  @override
  _BookNameState createState() => _BookNameState();
}

class _BookNameState extends State<BookName> {
  double _inputHeight = 50;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_checkInputHeight);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _checkInputHeight() async {
    int count = _textEditingController.text.split('\n').length;

    if (count == 0 && _inputHeight == 50.0) {
      return;
    }
    if (count <= 5) {
      // use a maximum height of 6 rows
      // height values can be adapted based on the font size
      var newHeight = count == 0 ? 50.0 : 28.0 + (count * 18.0);
      setState(() {
        _inputHeight = newHeight;
      });
    }
  }

  String textValue;

  TextEditingController recap = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: ConstColors.backgroundColor,
            // boxShadow: [
            //   // BoxShadow(
            //   //   offset: Offset(1, 1),
            //   //   blurRadius: 10,
            //   //   spreadRadius: 1,
            //   //   color: ConstColors.boxShadowColor,
            //   // ),
            // ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 500,
                            // color: Colors.amberAccent,
                            child: TextField(
                              textInputAction: TextInputAction.newline,
                              expands: true,
                              controller: _textEditingController,
                              // onChanged: (value) => textValue = value,
                              // onSubmitted: (value) {
                              //   textValue=value;
                              // },
                              // maxLength: 1000,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            ),
                          )
                          // Text('BookName',
                          //     style: ConstFonts.subTitleFont.copyWith(
                          //         color: Color.fromRGBO(0, 0, 0, 43),
                          //         fontWeight: FontWeight.bold)),
                          ),
                    ),
                    FlatButton(
                      onPressed: () {
                        addData({
                          'Book': 'Neww bokk',
                          'bookKey':'N',
                          'recap': _textEditingController.text.split('\n'),
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AnnonScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        // color: Colors.blueAccent,
                        child: Center(
                          child: Text(
                            'Let\'s go',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TextField(
//   controller: recap,
//   //onChanged: (){},
//   decoration: InputDecoration(
//     hintText: 'Search Books, Authors',
//     fillColor: Colors.white,
//     filled: true,
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: Color.fromRGBO(45, 117, 226, 0.53),
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: Color.fromRGBO(45, 117, 226, 0.53),
//       ),
//     ),
//   ),
//   //style: ,
// ),
