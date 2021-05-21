import 'package:cooking_app/screens/HomePage.dart';
import 'package:cooking_app/services/auth.dart';
import 'package:cooking_app/services/database.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInForm extends StatefulWidget {
  static String id = 'signin_form';

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final AuthService _authService = AuthService();

  //textfields
  // String fullname = "";
  // String email = "";
  // String password = "";
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String error = '';
  bool showSpinner = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) => val.isEmpty ? "Enter your Name" : null,
                    controller: _username,
                    // onChanged: (val) {
                    //   setState(() {
                    //     fullname = val;
                    //   });
                    // },
                    decoration: InputDecoration(hintText: "Display Name"),
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? "Enter an email" : null,
                    controller: _email,
                    // onChanged: (val) {
                    //   setState(() {
                    //     email = val;
                    //   });
                    // },

                    decoration: InputDecoration(hintText: "Email address"),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) => val.length < 6
                        ? "Your password is less than 6 characters"
                        : null,
                    controller: _password,
                    // onChanged: (val) {
                    //   setState(() {
                    //     password = val;
                    //   });
                    // },
                    obscureText: true,
                    decoration: InputDecoration(hintText: "password"),
                  ),
                  const SizedBox(height: 10.0),
                  RaisedButton(
                      child: Text("Register"),
                      color: Colors.yellow[700],
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          // String email = _email.text.trim();
                          // final bool isValid = EmailValidator.validate(email);
                          // isValid ? _registerAccount() : print("Invalid Email");
                          // dynamic result  = _authService.registerWithEmailAndPassword(email, password)
                          _emailValidation();
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void _emailValidation() {
    String email = _email.text.trim();
    final bool isValid = EmailValidator.validate(email);
    isValid ? _registerAccount() : print("Invalid Email");
  }

  void _registerAccount() async {
    dynamic result = await _authService.registerWithEmailAndPassword(
        _email.text.trim(), _password.text);
    if (result == null) {
      setState(() {
        error = 'Please supply a valid email';
      });
    } else {
      setState(() {
        showSpinner = false;
      });
      Navigator.pop(context);
    }
  }
  // void _registerAccount() async {
  //   final UserCredential user = await _auth.createUserWithEmailAndPassword(
  //       email: _email.text.trim(), password: _password.text);
  //   User updateUser = _auth.currentUser;
  //   // updateUser.updateProfile(displayName: _username.text);
  //   // authService.userSetup(_username.text);
  //   await DatabaseService(uid: updateUser.uid)
  //       .updateUserData('Hello', 'Hello', 'Hello', 'Hello');
  //   if (user != null) {
  //     // await user.updateProfile(displayName: fullname);
  //     // final user1 = _auth.currentUser;
  //     Navigator.of(context)
  //         .pushReplacement(MaterialPageRoute(builder: (context) {
  //       return HomePage();
  //     }));
  //   }
  // try {
  //   final email = _email.text.trim();
  //   final pass = _password.text.trim();
  //   print("email: $email, password: $pass");
  //   final user =
  //       await AuthService.signUpWithEmail(email: email, password: pass);
  //   if (user != null) {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) {
  //       return HomePage();
  //     }));
  //     Navigator.pop(context);
  //   } else {
  //     print("error logging in");
  //   }
  // } catch (e) {
  //   print(e);
  // }
  // try {
  //   FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password)) as FirebaseUser;
  //   if (user != null) {
  //     UserUpdateInfo updateUser = UserUpdateInfo();
  //     updateUser.displayName = fullname;
  //     user.updateProfile(updateUser);
  //     Navigator.pushNamed(context, HomePage.id);
  //   }
  // } catch (e) {
  //   print(e);
  //   email = "";
  //   password = "";
  // }
}
// }
