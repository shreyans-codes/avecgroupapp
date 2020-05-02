import 'package:avecgroupapp/models/userModel.dart';
import 'package:avecgroupapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();

  OurUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retValue = "error";

    //* As soon as we have a user, this gets called
    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _currentUser = await OurDatabase().getUserInfo(_firebaseUser.uid);
      if (_currentUser != null) {
        retValue = "success";
      }
    } catch (e) {
      print(e);
    }
    return retValue;
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName, String status) async {
    String retValue = "error";
    OurUser _user = OurUser(); //* Local object, only for this function

    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(_authResult.user);

      _user.uid = _authResult.user.uid;
      _user.fullName = fullName;
      _user.email = _authResult.user.email;
      _user.status = status;
      String _result = await OurDatabase().createUser(_user);
      if (_result == "success") {
        retValue = "success";
      }
    } on PlatformException catch (e) {
      retValue = e.message;
    } catch (e) {
      print(e);
    }

    return retValue;
  }

  Future<String> logInUser(String email, String password) async {
    String retValue = "error";

    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(_authResult);

      _currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retValue = "success";
        print(_currentUser);
      }
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
    OurUser _user = OurUser();

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      AuthResult _authResult = await _auth.signInWithCredential(credential);
      _currentUser.uid = _authResult.user.uid;
      _currentUser.email = _authResult.user.email;

      if (_authResult.additionalUserInfo.isNewUser) {
        _user.uid = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.fullName = _authResult.user.displayName;
        _user.status = "By Google, ask again. Code: G123";
        OurDatabase().createUser(_user);
      }
      _currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retValue = "success";
      }
    } catch (e) {
      retValue = e.message;
    }
    return retValue;
  }
}
/*
Todo: Show a loading screen after people click LogIn and CreateAccount

*/ 