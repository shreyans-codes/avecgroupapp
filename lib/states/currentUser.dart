import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier{
  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retValue = false;

    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_authResult.user != null)
      {
        retValue = true;
      }
    } catch (e) {
      print(e);
    }

    return retValue;
  }

  Future<bool> logInUser(String email, String password) async {
    bool retValue = false;

    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_authResult.user != null)
      {
        _uid = _authResult.user.uid;
        _email = _authResult.user.email;
        retValue = true;
      }
    } catch (e) {
      print(e);
    }

    return retValue;
  }
}