import 'package:Ludika/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Ludika/models/myUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _myUserConvert(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      await DatabaseService(uid: user.uid).createUserData();
      return _myUserConvert(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  MyUser getCurrentUser() {
    User user = _auth.currentUser;
    return _myUserConvert(user);
  }
}
