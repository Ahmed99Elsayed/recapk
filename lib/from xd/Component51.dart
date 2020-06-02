import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

class Component51 extends StatelessWidget {
  Component51({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 24.0,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: const Color(0x80435167),
          ),
        ),
        Transform.translate(
          offset: Offset(2.5, 6.5),
          child: SvgPicture.string(
            _shapeSVG_8b61fbb46e8a48d49afddea7bd04eff1,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ],
    );
  }
}

const String _shapeSVG_8b61fbb46e8a48d49afddea7bd04eff1 =
    '<svg viewBox="2.5 6.5 18.7 18.0" ><path transform="translate(2.5, 12.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(2.5, 9.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(11.5, 6.5)" d="M 0 0 L 9.725677490234375 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(2.5, 15.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(2.5, 18.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(2.5, 21.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(2.5, 24.5)" d="M 0 0 L 18.72567749023438 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
