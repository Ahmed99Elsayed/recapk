import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:prefirebase/models/const.dart';
import 'package:prefirebase/screens/book_name/book_name_screen.dart';

class AddRecapSettings extends StatefulWidget {
  @override
  _AddRecapSettingsState createState() => _AddRecapSettingsState();
}

class _AddRecapSettingsState extends State<AddRecapSettings> {
  bool bookToggle = true;
  bool bookChapter = true;
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.home,
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
                        child: Text('Settings',
                            style: ConstFonts.subTitleFont.copyWith(
                                color: Color.fromRGBO(0, 0, 0, 43),
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 45.0, left: 45.0, top: 62),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('a recap for',
                            style: ConstFonts.subTitleFont.copyWith(
                              color: ConstColors.subTitleColor,
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 4, bottom: 12),
                          decoration: dataLabelBoxStyle,
                          width: double.infinity,
                          height: 48,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 70,
                                  child: ListTile(
                                    title: InkWell(
                                      onTap: () {
                                        setState(() {
                                          bookToggle = !bookToggle;
                                        });
                                      },
                                      child: Icon(
                                        Icons.book,
                                        size: 30,
                                        color: bookToggle
                                            ? ConstColors.activeColor
                                            : ConstColors.inactiveColor,
                                      ),
                                    ),
                                    subtitle: Container(
                                      height: 15,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Book',
                                        style: ConstFonts.labelTextFont
                                            .copyWith(
                                                color: bookToggle
                                                    ? ConstColors.activeColor
                                                    : ConstColors
                                                        .inactiveColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 60,
                                  child: ListTile(
                                    title: InkWell(
                                      onTap: () {
                                        setState(() {
                                          bookToggle = !bookToggle;
                                        });
                                      },
                                      child: Icon(Icons.insert_link,
                                          size: 30,
                                          color: bookToggle
                                              ? ConstColors.inactiveColor
                                              : ConstColors.activeColor),
                                    ),
                                    subtitle: Container(
                                      height: 15,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Link',
                                        style: ConstFonts.labelTextFont
                                            .copyWith(
                                                color: bookToggle
                                                    ? ConstColors.inactiveColor
                                                    : ConstColors.activeColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      RecapFor(),
                      References(),
                      Padding(
                        padding: const EdgeInsets.only(top: 62),
                        child: Center(
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 15,
                                spreadRadius: 1,
                                color: Colors.grey[500],
                              ),
                            ]),
                            height: 260,
                            width: 235,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 62),
                        child: Container(
                          decoration: dataLabelBoxStyle,
                          height: 83,
                          width: 311,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 45,
                                width: 85,
                                child: ListTile(
                                  title: InkWell(
                                    onTap: () {
                                      setState(() {
                                        bookChapter = !bookChapter;
                                      });
                                    },
                                    child: Icon(
                                      Icons.layers,
                                      size: 40,
                                      color: bookChapter
                                          ? ConstColors.activeColor
                                          : ConstColors.inactiveColor,
                                    ),
                                  ),
                                  subtitle: Container(
                                    height: 15,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Chapters',
                                      style: ConstFonts.labelTextFont.copyWith(
                                          color: bookChapter
                                              ? ConstColors.activeColor
                                              : ConstColors.inactiveColor),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 45,
                                width: 65,
                                child: ListTile(
                                  title: InkWell(
                                    onTap: () {
                                      setState(() {
                                        bookChapter = !bookChapter;
                                      });
                                    },
                                    child: Icon(Icons.library_books,
                                        size: 40,
                                        color: bookChapter
                                            ? ConstColors.inactiveColor
                                            : ConstColors.activeColor),
                                  ),
                                  subtitle: Container(
                                    height: 15,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sheet',
                                      style: ConstFonts.labelTextFont.copyWith(
                                          color: bookChapter
                                              ? ConstColors.inactiveColor
                                              : ConstColors.activeColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 57, bottom: 31),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          BookName()));
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: ConstColors.nextButtonBorderColor,
                              dashPattern: [0.1, 0.1],
                              strokeWidth: 3,
                              radius: Radius.circular(10),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 29),
                                    child: Text(
                                      'Next',
                                      style: ConstFonts.nextButtonFont,
                                    ),
                                  ),
                                ),
                              ),
                              customPath: (size) => Path()
                                ..addRRect(RRect.fromRectAndRadius(
                                    Rect.fromLTWH(220, 0, 95, 25),
                                    Radius.circular(20))),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class References extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 62.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text('References',
                style: ConstFonts.subTitleFont.copyWith(
                  color: ConstColors.subTitleColor,
                )),
          ),
          Container(
            width: double.infinity,
            height: 30,
            decoration: dataLabelBoxStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'insert your book link',
                  style: GoogleFonts.lato(fontSize: 14),
                ),
                Icon(Icons.link)
              ],
            ),
          ),
          AddButton(
            isReferences: true,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RecapFor extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            DataLabel(
              inputData: '#Type_to_add_major',
            ),
            AddButton(
              isReferences: false,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddButton extends StatelessWidget {
  bool isReferences;
  AddButton({this.isReferences});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 12),
        width: double.infinity,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: ConstColors.labelColor,
          dashPattern: [20, 20],
          strokeWidth: 2,
          radius: Radius.circular(10),
          padding: EdgeInsets.all(6),
          child: Container(
            child: Center(child: Icon(Icons.add)),
          ),
          customPath: (size) => Path()
            ..addRRect(RRect.fromRectAndRadius(
                isReferences
                    ? Rect.fromLTWH(0, 0, 320, 30)
                    : Rect.fromLTWH(0, 0, 286, 30),
                Radius.circular(20))),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataLabel extends StatelessWidget {
  String inputData;
  DataLabel({this.inputData});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: dataLabelBoxStyle,
        child: Padding(
          padding: const EdgeInsets.only(top: 4, left: 35),
          child: Text(
            inputData,
            style: GoogleFonts.lato(
                color: ConstColors.labelInputDataColor, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
