import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prefirebase/models/const.dart';
import 'package:prefirebase/models/in_progress_recaps.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> profileInformation = ['myRecaps', 'interest', 'contact'];
  int activeIndex = 0;
  int index;
  bool profileDetails = false;
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
                          child: Text('My Profile',
                              style: ConstFonts.subTitleFont.copyWith(
                                  color: Color.fromRGBO(0, 0, 0, 43),
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'images/p2.png',
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: profileDetails ? 0 : 55,
                        right: 10,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                profileDetails = !profileDetails;
                              });
                            },
                            child: profileDetails
                                ? ProfileDetailsCard()
                                : ProfileCard()),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 46,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: profileInformation.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (activeIndex == index)
                                ? ConstColors.noteColor
                                : ConstColors.inactiveColor,
                            borderRadius: (activeIndex == index)
                                ? BorderRadius.all(
                                    Radius.circular(20.0),
                                  )
                                : BorderRadius.all(
                                    Radius.circular(0.0),
                                  ),
                          ),
                          child: Center(
                              child: Text(
                            profileInformation[index],
                            style: ConstFonts.nextButtonFont
                                .copyWith(color: Colors.black),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                (() {
                  if (activeIndex == 0) {
                    return MyRecaps(width: width);
                  } else {
                    return Container();
                  }
                })()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyRecaps extends StatelessWidget {
  const MyRecaps({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'In progress',
              style: ConstFonts.labelTextFont.copyWith(color: Colors.red),
            ),
          ),
          InProgressListView(width: width),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Published',
              style:
                  ConstFonts.labelTextFont.copyWith(color: Colors.greenAccent),
            ),
          ),
          PublishedListView(
            width: width,
          )
        ],
      ),
    );
  }
}

class InProgressListView extends StatelessWidget {
  const InProgressListView({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: inProgressRecaps.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: width,
            height: 160,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 10, color: Colors.black12)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${inProgressRecaps[index]['Title']}\n',
                          style: ConstFonts.subTitleFont
                              .copyWith(color: Colors.black),
                        ),
                        TextSpan(
                            text:
                                '\t\t\t since ${inProgressRecaps[index]['date']}',
                            style: ConstFonts.labelTextFont
                                .copyWith(color: Colors.black)),
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('${inProgressRecaps[index]['description']}')),
                  ],
                ),
                Image(
                  image: AssetImage('${inProgressRecaps[index]['Picture']}'),
                  fit: BoxFit.fill,
                  //width: 60,
                  //height: 150,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class PublishedListView extends StatelessWidget {
  const PublishedListView({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: publishedRecaps.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: width,
              height: 160,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: Colors.black12)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '${publishedRecaps[index]['Title']}\n',
                            style: ConstFonts.subTitleFont
                                .copyWith(color: Colors.black),
                          ),
                          TextSpan(
                              text:
                                  '\t\t\t since ${publishedRecaps[index]['date']}',
                              style: ConstFonts.labelTextFont
                                  .copyWith(color: Colors.black)),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('${publishedRecaps[index]['Views']}K views'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('${publishedRecaps[index]['rating']}/5 stars'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Gained: ${publishedRecaps[index]['Views']}\$'),
                    ],
                  ),
                  Image(
                    image: AssetImage('${publishedRecaps[index]['Picture']}'),
                    fit: BoxFit.fill,
                    //width: 60,
                    //height: 150,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        height: 110,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          'images/p1.jpg',
                        ),
                        fit: BoxFit.fill),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Ahmed Elsayed\n',
                        style: ConstFonts.subTitleFont
                            .copyWith(color: Colors.black),
                      ),
                      TextSpan(
                          text: '\t\t\t\t\t\t\t\t\t\t @AhmedElsayed',
                          style: ConstFonts.labelTextFont
                              .copyWith(color: Colors.black)),
                    ]),
                  ),
                  Text(
                    '30K followers',
                    style: ConstFonts.labelTextFont
                        .copyWith(color: ConstColors.labelInputDataColor),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        height: 220,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          'images/p1.jpg',
                        ),
                        fit: BoxFit.fill),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Ahmed Elsayed\n',
                              style: ConstFonts.nextButtonFont
                                  .copyWith(color: Colors.black),
                            ),
                            TextSpan(
                                text: '\t\t\t\t @AhmedElsayed',
                                style: ConstFonts.labelTextFont
                                    .copyWith(color: Colors.black)),
                          ]),
                        ),
                        Text(
                          '30K followers',
                          style: ConstFonts.labelTextFont
                              .copyWith(color: ConstColors.labelInputDataColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Eduction:',
                    style: ConstFonts.nextButtonFont
                        .copyWith(color: ConstColors.labelInputDataColor),
                  ),
                  Text(
                    '\t\t\t\t\t - student at AIET',
                    style: ConstFonts.labelTextFont,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
