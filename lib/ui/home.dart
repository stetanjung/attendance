import 'package:flutter/material.dart';
import '../util/auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  @override
  void initState() {
    super.initState();
    loadCurrentUser();
  }
  
  Future loadCurrentUser() async {
    var curID = await authService().getUID();
    setState(() {
      this.uid = curID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("testing"),
        actions: this.uid != null ? <Widget>[
          IconButton(
            icon: Icon(Icons.lock_open),
            tooltip: "LogOut",
            onPressed: () => authService().signOut(),
          )
        ]: null,
      ),
      body: new Container(
        child: this.uid == null ? new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GoogleSignInButton(onPressed: () => authService().googleSignIn()),
          ],
        ) : 
        new Column(
          
        ),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   String userId;
//   @override
//   initState(){
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("testing"),
//         actions: authService().getUID() != null ? <Widget>[
//           IconButton(
//             icon: Icon(Icons.lock_open),
//             tooltip: "LogOut",
//             onPressed: () => authService().signOut(),
//           )
//         ]: null,
//       ),
//       body: new Container(
//         child: authService().getUID() != null ? new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GoogleSignInButton(onPressed: () => authService().googleSignIn()),
//           ],
//         ) : 
//         new Column(
          
//         ),
//       ),
//     );
//   }
// }