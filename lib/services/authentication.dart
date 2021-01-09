import 'package:Ludika/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Ludika/models/myUser.dart';

class AuthService {
  //Create instance of Firebase authentification
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Convert default User type to MyUser custom model with getting only uid
  MyUser _myUserConvert(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //Sign in anonymously return user or null
  Future signInAnon() async {
    try {
      //Firebase method to sign in anonymously
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      //Create default data in database for this user
      await DatabaseService(uid: user.uid).createUserData();
      return _myUserConvert(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Function that get the current user as custome type MyUser
  MyUser getCurrentUser() {
    User user = _auth.currentUser;
    return _myUserConvert(user);
  }
}
