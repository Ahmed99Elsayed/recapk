import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addData(data) async {
  print(data);

  if (true) { // test Auth .. if he signed
    try{
 
    Firestore.instance.collection('recapks').document().setData(Map.of(data));
    print(' الخرا اشتغل');
  }catch(e){print(e);} }
}