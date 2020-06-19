import 'package:flutter/material.dart';
import 'package:prefirebase/models/const.dart';

class BookName extends StatefulWidget {
  @override
  _BookNameState createState() => _BookNameState();
}

class _BookNameState extends State<BookName> {
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
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('BookName',
                            style: ConstFonts.subTitleFont.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 43),
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                TextField(
                  controller: recap,
                  //onChanged: (){},
                  decoration: InputDecoration(
                    hintText: 'Search Books, Authors',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(45, 117, 226, 0.53),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(45, 117, 226, 0.53),
                      ),
                    ),
                  ),
                  //style: ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
