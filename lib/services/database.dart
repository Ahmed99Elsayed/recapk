import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prefirebase/models/recapakdata.dart';
import 'package:prefirebase/models/user.dart';

class DataBaseServices {
  final CollectionReference collection =
      Firestore.instance.collection('recapak');

  final String uid;
  DataBaseServices({this.uid});

  Future updateUserData(String name, int age, String field) async {
    return await collection
        .document(uid)
        .setData({'name': name, 'age': age, 'field': field});
  }

  //convert snapshot to list
  List<ReCapakUserData> _userListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ReCapakUserData(
          name: doc.data['name'] ?? '  ',
          age: doc.data['age'] ?? 0,
          field: doc.data['field'] ?? '  ');
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<ReCapakUserData>> get reCapakUserData {
    return collection.snapshots().map(_userListFromSnapShot);
  }

  Stream<UserData> get userData {
    return collection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        age: snapshot.data['age'],
        interstedFields: snapshot.data['interstedFields']);
  }
}
