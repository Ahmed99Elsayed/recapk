import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prefirebase/models/const.dart';
import 'package:prefirebase/models/user.dart';
import 'package:prefirebase/screens/add_recap_settings/add_recap_screen.dart';
import 'package:prefirebase/screens/annon/search_services.dart';
import 'package:prefirebase/screens/book_name/book_name_screen.dart';
import 'package:prefirebase/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class AnnonScreen extends StatefulWidget {
  final Function
      toggleView; // define function that toggle page from sign in and register that get from auth
  final Function
      toggleWelcome; // define function that toggle page from sign in and register that get from auth
  final bool showSignIn;
  AnnonScreen({this.toggleView, this.showSignIn, this.toggleWelcome});
  @override
  _AnnonScreenState createState() => _AnnonScreenState();
}

class _AnnonScreenState extends State<AnnonScreen> {
  Widget buildBottomSheetAdd(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
              width: 300,
              // color: Colors.amber,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Recapk for ',
                              style: TextStyle(

                                // color: Color(0xff0E0E0E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          Container(
                            width: 180,
                            height: 70,
                            
                            child: TextField(
                              
                              onTap: () {},
                              style: TextStyle(
                                color: Color.fromRGBO(45, 117, 226, 0.53),
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                              decoration: InputDecoration(
                                hintText: '. . . . insert here',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                fillColor: Colors.transparent,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(45, 117, 226, 0.53),
                                    color: Colors.transparent,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    // color: Color.fromRGBO(45, 117, 226, 0.53),
                                  ),
                                ),

                                // prefixIcon: Icon(
                                //   Icons.search,
                                //   color: Color.fromRGBO(45, 117, 226, 1),

                                //   /// TODO: hide the icon when start typing
                                // ),

                                /// [delete the settign ICON .. for Version3]
                                // suffixIcon: Icon(
                                //   Icons.settings_input_component,
                                //   color: Color.fromRGBO(45, 117, 226, 1),
                                // ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 180,
                        width: 200,
                        // color: Colors.black,
                        child: Image(image: AssetImage('images/boy.png')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          splashColor: Colors.grey[600],
                          highlightColor: Colors.blueAccent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => BookName(),
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
                      ),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildBottomSheetProfile(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
              width: 300,
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.settings),
                    onTap: () {},

                    ///TODO: sgin out
                  ),
                  Align(
                    child: Container(
                        height: 125,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 50,
                            ),
                            Expanded(child: SizedBox()),
                            Text('Ahmed Elsayed'), // from Firebase Auth
                          ],
                        )),
                    alignment: Alignment.center,
                  ),
                  Divider(),
                  Text('Recapks :'),
                  Align(
                    alignment: Alignment(-0.3, 0),
                    child: Container(
                      color: Colors.white,
                      width: 100,
                      height: 100,
                      child: ListView(
                        children: [
                          Text('recap1'),
                          Text('recap2'),
                          Text('recap3'),
                          Text('recap4'),
                          Text('recap5'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  TextEditingController searchBox = TextEditingController();

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Book'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'recapk',
                        style: ConstFonts.titleFont
                            .copyWith(color: Color(0xff0E0E0E)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 20,
                                color: Colors.black12)
                          ]),
                          child: TextField(
                            onChanged: (val) {
                              initiateSearch(val);
                            },
                            // controller: searchBox,
                            //onChanged: (){},
                            decoration: InputDecoration(
                              hintText: 'Search Books,',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  // color: Color.fromRGBO(45, 117, 226, 0.53),
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  // color: Color.fromRGBO(45, 117, 226, 0.53),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                // color: Color.fromRGBO(45, 117, 226, 1),

                                /// TODO: hide the icon when start typing
                              ),

                              /// [delete the settign ICON .. for Version3]
                              // suffixIcon: Icon(
                              //   Icons.settings_input_component,
                              //   color: Color.fromRGBO(45, 117, 226, 1),
                              // ),
                            ),
                            //style: ,
                          ),
                        ),
                      ),
                    ),

                    ///[ Show the recapks -- Search]
                    ///TODO: chnage the GridView to List with Cards (Image[Amazon] and Title + Sub)
                    ///TODO: delete top padding to be 10 or 5

                    GridView.count(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 100),
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        primary: false,
                        shrinkWrap: true,
                        children: tempSearchStore.map((element) {
                          return buildResultCard(element);
                        }).toList()),

                    /// [deleted for sutible design ]
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 53, right: 49),
                    //   child:
                    //  Text(
                    //   //'we can do it',
                    //   'إعرف كل شئ \n في أقل وقت',
                    //   style: GoogleFonts.lato(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 40,
                    //     decorationStyle: TextDecorationStyle.solid,
                    //   ),
                    // ),
                    // ),
                  ],
                ),
              ),
            ),

            /// [ new bottom bar]
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: (70),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 12,
                        color: Color(0xff000000).withOpacity(.25),
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context, builder: buildBottomSheetProfile);
                      },
                      child: Icon(Icons.person_outline),
                    ),
                    Icon(Icons.check_box_outline_blank),
                    GestureDetector(
                      child: Icon(Icons.add_box),
                      onTap: () {
                        showModalBottomSheet(
                            context: context, builder: buildBottomSheetAdd);
                      },
                    )
                  ],
                ),
              ),
            )

            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: (85),
            //     width: double.infinity,
            // decoration: BoxDecoration(boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 4),
            //     blurRadius: 10,
            //     color: ConstColors.boxShadowColor,
            //   ),
            //     ]),
            //     child: Material(
            //       type: MaterialType.canvas,
            //       color: Colors.white,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(10.0),
            //   topRight: Radius.circular(10.0),
            // ),
            //       child: Stack(
            //         children: <Widget>[
            //           Align(
            //             alignment: Alignment.topCenter,
            //             child: Column(
            //               children: <Widget>[
            //                 Padding(
            //                     padding: const EdgeInsets.only(
            //                         top: 20.0,
            //                         left: 120,
            //                         right: 120,
            //                         bottom: 9),
            //                     child: Container(
            //                       color: Color.fromRGBO(64, 92, 204, 1),
            //                       height: 5,
            //                     )),
            //                 Padding(
            //                   //TODO:change padding related to login or home screen
            //                   padding:
            //                       const EdgeInsets.only(left: 35, right: 35),
            //                   child: Stack(
            //                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: <Widget>[
            //                       //_profile(),
            //                       (() {
            //                         if (user == null) {
            //                           return _submitButton();
            //                         } else {
            //                           return _profile();
            //                         }
            //                       })(),

            //                       /// [delete Community buttom for Version3]
            //                       // Align(
            //                       //   alignment: Alignment.bottomCenter,
            //                       //   child: Padding(
            //                       //     padding: const EdgeInsets.only(top: 2.0),
            //                       //     child: Text(
            //                       //       'Community',
            //                       //       style: TextStyle(
            //                       //         color: ConstColors.noteColor,
            //                       //         fontSize: 20.0,
            //                       //         fontWeight: FontWeight.bold,
            //                       //       ),
            //                       //     ),
            //                       //   ),
            //                       // ),
            //                       (() {
            //                         if (user == null) {
            //                           return _signUpButton();
            //                         } else {
            //                           return addRecap();
            //                         }
            //                       })(),
            //                       //addRecap(),
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  /// TODO: disapear the buttom bar when startsearch
  Widget addRecap() {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddRecapSettings(),
            ),
          );
        },
        child: SvgPicture.string(
          _shapeSVG_a6bcc09e3b4741ffb6be8c9996f8e694,
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }

  Widget _profile() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen()));
        },
        child: Icon(
          Icons.person,
          size: 30,
          color: Color.fromRGBO(151, 182, 227, 1),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: InkWell(
          onTap: () {
            if (widget.showSignIn) {
              widget.toggleWelcome();
            } else {
              widget.toggleWelcome();
              widget.toggleView();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            //padding: EdgeInsets.symmetric(vertical: 13),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(151, 182, 227, 1),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 1.0, bottom: 3, left: 2, right: 2),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: InkWell(
          onTap: () {
            if (widget.showSignIn) {
              widget.toggleView();
              widget.toggleWelcome();
            } else {
              widget.toggleWelcome();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            //padding: EdgeInsets.symmetric(vertical: 13),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(151, 182, 227, 1),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 1.0, bottom: 3, left: 2, right: 2),
              child: Text(
                'Signup',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String _shapeSVG_a6bcc09e3b4741ffb6be8c9996f8e694 =
    '<svg viewBox="35.0 755.0 303.7 30.0" ><g transform="translate(308.75, 755.0)"><path transform="translate(-3.38, -3.38)" '
    'd="M 25.05694389343262 17.19366264343262 L 19.55633735656738 17.19366264343262 L 19.55633735656738 11.6930570602417 C 19.55633735656738 11.04332160949707 19.02473449707031 10.51171970367432 18.375 10.51171970367432 C 17.72526359558105 10.51171970367432 17.19366264343262 11.04332160949707 17.19366264343262 11.6930570602417 L 17.19366264343262 17.19366264343262 L 11.6930570602417 17.19366264343262 C 11.04332160949707 17.19366264343262 10.51171970367432 17.63666343688965 10.51171970367432 18.375 C 10.51171970367432 19.11333656311035 11.06547164916992 '
    '19.55633735656738 11.6930570602417 19.55633735656738 C 12.32064342498779 19.55633735656738 17.19366264343262 19.55633735656738 17.19366264343262 19.55633735656738 C 17.19366264343262 19.55633735656738 17.19366264343262 24.35552406311035 17.19366264343262 25.05694389343262 C 17.19366264343262 25.75836181640625 17.71049690246582 26.23828125 18.375 26.23828125 C 19.03950309753418 26.23828125 19.55633735656738 25.70667839050293 19.55633735656738 25.05694389343262 L 19.55633735656738 19.55633735656738 L 25.05694389343262 19.55633735656738 C 25.70667839050293 19.55633735656738 26.23828125 19.02473449707031 26.23828125 18.375 C 26.23828125 17.72526359558105 25.70667839050293 17.19366264343262 25.05694389343262 17.19366264343262 Z" fill="#435167" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-3.37, -3.37)" d="M 18.37500190734863 5.39423131942749 C 21.84375 5.39423131942749 25.10336685180664 6.742788791656494 27.55529022216797 9.19471263885498 C 30.0072135925293 11.64663600921631 31.35577201843262 14.90625095367432 31.35577201843262 18.37500190734863 C 31.35577201843262 21.84375 30.0072135925293 25.10336685180664 27.55529022216797 27.55529022216797 C 25.10336685180664 30.0072135925293 21.84375 31.35577201843262 18.37500190734863 31.35577201843262 C 14.90625095367432 31.35577201843262 11.64663600921631 30.0072135925293 9.19471263885498 27.55529022216797 C 6.742788791656494 25.10336685180664 5.39423131942749 21.84375 5.39423131942749 18.37500190734863 C 5.39423131942749 14.90625190734863 6.742788791656494 11.64663600921631 9.19471263885498 9.19471263885498 C 11.64663600921631 6.742788791656494 14.90625095367432 5.39423131942749 18.37500190734863 5.39423131942749 M 18.37500190734863 3.375 C 10.08894348144531 3.375 3.375 10.08894348144531 3.375 18.37500190734863 C 3.375 26.66106033325195 10.08894348144531 33.375 18.37500190734863 33.375 C 26.66106033325195 33.375 33.375 26.66106033325195 33.375 18.37500190734863 C 33.375 10.088942527771 26.66106033325195 3.375 18.37500190734863 3.375 L 18.37500190734863 3.375 Z" fill="#97b6e3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g><path transform="translate(30.5, 750.5)"  fill="#97b6e3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

Widget buildResultCard(data) {
  return GestureDetector(
    onTap: () {
      ///TODO: change Card color and enter to whole Recap
    },
    onLongPress: () {
      /// [ فيما بعد يعني ممكن هنا نضيف ال detalies ]
    },
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.0,
        child: Container(
            child: Center(
                child: Text(
          data['Book'],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )))),
  );
}
