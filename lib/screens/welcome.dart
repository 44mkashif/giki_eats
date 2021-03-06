import 'package:flutter/material.dart';
import 'package:giki_eats/utils/colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal[700],
              Colors.teal[600],
              Colors.teal[500],
              Colors.teal[400],
              Colors.teal[300],
              Colors.teal[200],
              Colors.teal[100],
              white,
              white,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/food1.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(280, 180, 0, 0),
              child: Container(
                alignment: Alignment.topRight,
                child: Image.asset('images/food21.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 180, 280, 0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset('images/food31.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 250, 150),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset('images/food41.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(250, 0, 0, 150),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset('images/food51.png'),
              ),
            ),
            Container(
              height: 180,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Image.asset('images/gikieats_white.png'),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(0.0, 190.0, 0.0, 0.0),
              child: Text(
                'Click. Click. Eat.',
                //Our App will make your food ordering experience pleasant and fast.
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.fromLTRB(34.0, 0.0, 34.0, 100.0),
              child: Container(
                height: 60.0,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 7.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  color: white,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.fromLTRB(34.0, 0.0, 34.0, 20.0),
              child: Container(
                height: 60.0,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 7.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  color: teal,
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
