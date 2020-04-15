// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as path;
// //import 'package:uuid/uuid.dart';
// import 'package:fillme/auth_session/get_session.dart';
// import 'package:fillme/models/user.dart';

// abstract class AuthMethods {
//   Future<String> login(User user, AuthSession authSession);

//   Future<String> signUp(
//       String name, String contact, String email, String password);

//   Future<FirebaseUser> getCurrentUser();

//   Future<void> signOut();

//   Future<void> sendVerifiation();

//   Future<bool> isVerified();
// }

// class Base implements AuthMethods {
//   final FirebaseAuth _fireAuth = FirebaseAuth.instance;

//   @override
//   Future<String> login(User user, AuthSession authSession) async {
//     // TODO: implement login
//     var userResult = (await _fireAuth.signInWithEmailAndPassword(
//             email: user.email, password: user.password))
//         .user;
//     return userResult.uid;
//   }

//   @override
//   Future<void> signOut() {
//     // TODO: implement signOut
//     return _fireAuth.signOut();
//   }

//   @override
//   Future<String> signUp(
//       String name, String contact, String email, String password) async {
//     // TODO: implement signUp
//     var user = (await _fireAuth.createUserWithEmailAndPassword(
//             email: email, password: password))
//         .user;
//     return user.uid;
//   }

//   @override
//   Future<FirebaseUser> getCurrentUser() async {
//     // TODO: implement getCurrentUser
//     return await _fireAuth.currentUser();
//   }

//   @override
//   Future<bool> isVerified() async {
//     // TODO: implement isVerified
//     var user = await _fireAuth.currentUser();

//     return user.isEmailVerified;
//   }

//   @override
//   Future<void> sendVerifiation() async {
//     // TODO: implement sendVerifiation
//     var user = await _fireAuth.currentUser();
//     user.sendEmailVerification();
//   }
// }
