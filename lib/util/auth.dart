import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService{
  Future<String> getUID();
  Future<FirebaseUser> googleSignIn();
  void signOut();
}

class authService implements AuthService{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> getUID() async{
    final FirebaseUser user = await _auth.currentUser();
    return user != null ? user.uid : null;
  }

  @override
  Future<FirebaseUser> googleSignIn() async{
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }

  @override
  void signOut() {
    _auth.signOut();
    _googleSignIn.signOut();
  }
}