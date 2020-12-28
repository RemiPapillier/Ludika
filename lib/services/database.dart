import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference ludikaCollection =
      FirebaseFirestore.instance.collection('badges');

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

  Future giveUserBadge(String badge) async {
    return await ludikaCollection.doc(uid).update({badge: true}).then((_) {
      print("Success");
    });
  }

  Future getUserBadge() async {
    return await ludikaCollection.doc(uid).get();
  }
}
