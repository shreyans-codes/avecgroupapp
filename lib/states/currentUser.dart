import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retValue = "error";

    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _uid = _firebaseUser.uid;
      _email = _firebaseUser.email;
      retValue = "success";
    } catch (e) {
      print(e);
    }
    return retValue;
  }

  Future<String> signUpUser(String email, String password) async {
    String retValue = "error";

    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      retValue = "success";
    } catch (e) {
      retValue = e.message;
    }

    return retValue;
  }

  Future<String> logInUser(String email, String password) async {
    String retValue = "error";

    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      retValue = "success";
    } catch (e) {
      retValue = e.message;
    }

    return retValue;
  }

  Future<String> logInUserWithGoogle() async {
    String retValue = "error";

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      AuthResult _authResult = await _auth.signInWithCredential(credential);
      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      retValue = "success";
    } catch (e) {
      retValue = e.message;
    }

    return retValue;
  }
}
