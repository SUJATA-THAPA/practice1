import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  FirebaseAuth? _firebaseAuth;
  // ignore: non_constant_identifier_names
  AuthRepoImp() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  
  get await_firebaseAuth => null;
  @override
  Future<UserCredential> login({required String email, required String password}) async{
   final res=await_firebaseAuth!.signInWithEmailAndPassword(email: email, password: password);
   return res;


  }

  @override
 Future register({required String email, required String password})async {
   
   final res=_firebaseAuth!.createUserWithEmailAndPassword(email: email, password: password);
   return res;
  }
}
