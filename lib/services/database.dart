import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //Attribute and constructor to get user uid
  final String uid;
  DatabaseService({this.uid});

  //Create a reference to our Ludika Collection where we placed badges
  final CollectionReference ludikaCollection =
      FirebaseFirestore.instance.collection('badges');

  //Create default data for a User, with user uid as collection name
  Future createUserData() async {
    return await ludikaCollection.doc(uid).set({
      'cpcalcul': false,
      'cpconjugaison': false,
      'cpgrammaire': false,
      'cpheure': false,
      'cpnombre': false,
      'cpsyllabe': false,
    });
  }

  //Function that set a specific badge to true meaning it is acquired
  Future giveUserBadge(String badge) async {
    return await ludikaCollection.doc(uid).update({badge: true}).then((_) {
      print("Success");
    });
  }

  //Function that return wheter a badge is acquired or not
  Future getUserBadge() async {
    return await ludikaCollection.doc(uid).get();
  }
}
