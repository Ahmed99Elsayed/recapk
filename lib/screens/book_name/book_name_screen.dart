import 'package:flutter/material.dart';
import 'package:prefirebase/models/const.dart';
import 'package:prefirebase/screens/annon/annon_screen.dart';
import 'package:prefirebase/services/add_recap.dart';

class BookName extends StatefulWidget {
  String recapName;
  BookName({this.recapName});
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
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height - 28,
            decoration: BoxDecoration(
              color: ConstColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: ConstColors.boxShadowColor,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text('Recap content',
                              style: ConstFonts.subTitleFont.copyWith(
                                  color: Color.fromRGBO(0, 0, 0, 43),
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height - 95,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, right: 15, left: 15),
                          child: Container(
                            height: height - 150,
                            // color: Colors.amberAccent,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(45, 117, 226, 0.53),
                                    // color: Color.fromRGBO(45, 117, 226, 0.53),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(45, 117, 226, 0.53),
                                    //color: Colors.white,
                                  ),
                                ),
                              ),

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
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: FlatButton(
                          onPressed: () {
//                        print(widget.recapName.substring(0, 1).toUpperCase() +
//                            widget.recapName.substring(1));
                            addData({
                              'Book': widget.recapName
                                      .substring(0, 1)
                                      .toUpperCase() +
                                  widget.recapName.substring(1),
                              'bookKey': widget.recapName
                                  .substring(0, 1)
                                  .toUpperCase(),
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
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
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
                        ),
                      )
                    ],
                  ),
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
