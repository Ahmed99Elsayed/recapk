import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstColors {
  static Color subTitleColor = Color.fromRGBO(64, 92, 204, 1);
  static Color labelColor = Color.fromRGBO(242, 241, 241, 1);
  static Color activeColor = Color.fromRGBO(64, 204, 120, 1);
  static Color inactiveColor = Color.fromRGBO(171, 171, 171, 1);
  static Color labelInputDataColor = Color.fromRGBO(64, 92, 204, 1);
  static Color boxShadowColor = Color.fromRGBO(45, 117, 226, 1);
  static Color nextButtonBorderColor = Color.fromRGBO(151, 182, 227, 1);
  static Color backgroundColor = Color.fromRGBO(247, 247, 247, 1);
  static Color noteColor = Color.fromRGBO(64, 92, 204, 1);
}

class ConstFonts {
  static TextStyle titleFont = GoogleFonts.lato(
      fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle subTitleFont = GoogleFonts.lato(
    fontSize: 26,
  );
  static TextStyle labelTextFont = GoogleFonts.lato(
    fontSize: 12,
  );
  static TextStyle nextButtonFont =
      GoogleFonts.lato(fontSize: 20, color: Color.fromRGBO(67, 81, 103, 1));
}

BoxDecoration dataLabelBoxStyle = BoxDecoration(
    color: Color.fromRGBO(242, 241, 241, 1),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(10.0),
    ));
