// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:fillme/auth_session/get_session.dart';
// import 'package:fillme/models/user.dart';


// abstract class authImp{

//    Future<String> SignIn(String email,String password);

// }
// class Auth implements authImp{

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String> SignIn(String email,String password) async{

//     FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//     return user.uid;
//   }

//    Future<String> SignUp(String email,String password) async{

//     FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//     return user.uid;
//   }

//   Future<String> getCurrentUser() async{
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.uid;
//   }

//    Future<void> SignOut() async{

//    _firebaseAuth.signOut();
//   }

// }

//---------------------------------------------

//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:fillme/auth_session/get_session.dart';
// import 'package:fillme/models/user.dart';


// login(User user, AuthSession authNotifier) async {
//   AuthResult authResult = await FirebaseAuth.instance
//       .signInWithEmailAndPassword(email: user.email, password: user.password)
//       .catchError((error) => print(error.code));

//   if (authResult != null) {
//     FirebaseUser firebaseUser = authResult.user;

//     if (firebaseUser != null) {
//       print("Log In: $firebaseUser");
//       authNotifier.setUser(firebaseUser);

//       return firebaseUser;
//     }else{
//       return '0';
//     }
//   }
// }

//  String signup(User user, AuthSession authNotifier) async {
//   AuthResult authResult = await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: user.email, password: user.password)
//       .catchError((error) => print(error.code));

//   if (authResult != null) {
//     UserUpdateInfo updateInfo = UserUpdateInfo();
//     updateInfo.displayName = user.name;

//     FirebaseUser firebaseUser = authResult.user;

//     if (firebaseUser != null) {
//       await firebaseUser.updateProfile(updateInfo);

//       await firebaseUser.reload();

//       print("Sign up: $firebaseUser");

//       FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
//       authNotifier.setUser(currentUser);

//       return 'currentUser';
//     }else{
//       return '0';
//     }
//   }
// }

// signout(AuthSession authNotifier) async {
//   await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

//   authNotifier.setUser(null);
// }

// initializeCurrentUser(AuthSession authNotifier) async {
//   FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

//   if (firebaseUser != null) {
//     print(firebaseUser);
//     authNotifier.setUser(firebaseUser);
//   }
// }



