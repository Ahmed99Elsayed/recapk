import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  final Function
      toggleView; // define function that toggle page from sign in and register that get from auth
  final Function
      toggleWelcome; // define function that toggle page from sign in and register that get from auth
  final bool showSignIn;
  Welcome({this.toggleView, this.showSignIn, this.toggleWelcome});
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        if (widget.showSignIn) {
          widget.toggleWelcome();
        } else {
          widget.toggleWelcome();
          widget.toggleView();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        if (widget.showSignIn) {
          widget.toggleView();
          widget.toggleWelcome();
        } else {
          widget.toggleWelcome();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return Image(
      image: AssetImage('images/rewezicon.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfffbb448), Color(0xffe46b10)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(),
            SizedBox(
              height: 80,
            ),
            _submitButton(),
            SizedBox(
              height: 20,
            ),
            _signUpButton(),
          ],
        ),
      ),
    );
  }
}

/*


  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
          toggleView:
              toggleView); // here we pass function toggle to sign in pass as parameter to toggle it into button
    } else
      return Register(
          toggleView:
              toggleView); // here we pass function toggle to Register pass as parameter to toggle it into button
  }
}
*/
