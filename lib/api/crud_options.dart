// import 'package:firebase_auth/firebase_auth.dart';


// abstract class AuthImp {
//   Future<String> signIn(String email, String password);
//   Future<String> signUp(String _email, String _password);
//   Future<String> getCurrentUser();
//   Future<void> signOut();
// }

// class Auth implements AuthImp {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
//   Future<String> signIn(String email, String password) async {
//      print(email);
//     AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//     FirebaseUser user = result.user;
//     return user.uid;
//   }

  
//   Future<String> signUp(String _email, String _password) async {
//     print(_email);
//     AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: _email, password: _password);
//     FirebaseUser user = result.user;
//   //  print(result);
//     return user.uid;
//   }

  
//   Future<String> getCurrentUser() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.uid;
//   }

 
//   Future<void> signOut() async {
//     _firebaseAuth.signOut();
//   }
// }
