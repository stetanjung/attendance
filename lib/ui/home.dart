import 'package:flutter/material.dart';
import '../util/auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("testing"),
      ),
      body: new Container(
        child: new Column(
            children: <Widget>[
              GoogleSignInButton(onPressed: () => authService().googleSignIn()),
              TwitterSignInButton(onPressed: () => authService().signOut())
          ],
        ),
      ),
    );
  }
}