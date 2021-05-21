import 'package:cooking_app/models/user.dart';
import 'package:cooking_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   CollectionReference users =
//         FirebaseFirestore.instance.collection("users");

//   // static Future<bool> logOut() async {
//   //   try {
//   //     await _auth.signOut();
//   //     return true;
//   //   } catch (e) {
//   //     print(e.message);
//   //     return false;
//   //   }
//   // }
//   Future<void> userSetup(String displayName) async {

//     String uid = _auth.currentUser.uid.toString();
//     users.add({'displayName': displayName, 'uid': uid});
//     return;
//   }

// static Future<User> loginWithEmail({String email, String password}) async {
//   try {
//     // final res = await _auth.signInWithEmailAndPassword(
//     //   email: email,
//     //   password: password,
//     // );

//     // return res.user;
//     final User user = (await _auth.signInWithEmailAndPassword(
//             email: email.trim(), password: password))
//         .user;
//     return user;
//   } catch (e) {
//     print(e.message);
//     return null;
//   }
// }

// static Future<User> signUpWithEmail({String email, String password}) async {
//   try {
//     final res = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return res.user;
//   } catch (e) {
//     print(e.message);
//     return null;
//   }
// }

// Future signInAnon() async {
//   try {
//     AuthResult result = await _auth.signInAnonymously();
//   } catch (e) {}
// }

// sign in with email and password
//  Future registerWithEmailAndPassword(String email, String password) async {
//   try {
//     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     FirebaseUser user = result.user;
//     return _userFromFirebaseUser(user);
//   } catch (error) {
//     print(error.toString());
//     return null;
//   }
// }

//register with email and password
// Future registerWithEmailAndPassword(
//     String fullname, String email, String password) async {
//   try {
//     final User user = (await _auth.createUserWithEmailAndPassword(
//         email: email, password: password)) as User;

//     if (user != null) {
//       if (!user.emailVerified) {
//         await user.sendEmailVerification();
//       }
//       await user.updateProfile(displayName: fullname);
//       final user1 = _auth.currentUser;

//     }
//   } catch (error) {
//     print(error.toString());
//     return null;
//   }
// }
// signout

//google signin
// Future<String> signInWithGoogle() async {
//   await Firebase.initializeApp();

//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   if (user != null) {
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return null;
// }

//google signout

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }
// }

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      // return user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and passord
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          'Fresh Fruit Tart',
          '30 mins',
          '100 servings',
          'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
          '',
          '',
          0,
          '',
          '',
          '');

      await DatabaseService(uid: user.uid).updateNewRecipeData(
          'Fresh Fruit Tart',
          '30 mins',
          '100 servings',
          'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60');

      await DatabaseService(uid: user.uid).updateFollowsData(
          'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
          'Karen',
          'Chef');

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
