
/*
import 'package:exchange_app/models/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fireStoreServices {
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  fireStoreServices({this.uid});

  Stream<QuerySnapshot> get myProducts {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Products")
        .snapshots();
  }
}
*/


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_app/models/profileModel.dart';

class firestore_database {

final String? uid;

  firestore_database( this.uid);


Future createUserData(String name,String phone,String? email) async {
  final user_profile =  FirebaseFirestore.instance.collection('Users').doc(uid);
  
  final user = profile_model(
    name,
    phone,
    user_profile.id,
    email!,
  );

  final json = user.toJson();

  await user_profile.set(json);
}

Future <profile_model?> readUser() async {
  final user_profile =  FirebaseFirestore.instance.collection('Users').doc(uid);
  final snapshot = await user_profile.get();
  
  if(snapshot.exists){
    
    return profile_model.fromJson(snapshot.data()!);
  }
}

/*
List<profile_model> _profileFromSnapshot(QuerySnapshot snapshot){
  return snapshot.docs.map((doc){
    return profile_model(
      doc.get("name"),
      doc.get("phone")
    );
    }
    ).toList();
}
*/



/*Stream <List<profile_model>>? get prof{
  return user_profile.snapshots().map(_profileFromSnapshot);
}*/



}
