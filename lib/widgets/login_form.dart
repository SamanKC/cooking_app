
import 'package:cooking_app/services/auth.dart';
import 'package:email_validator/email_validator.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  static String id = 'login_form';

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  //textfields
  bool showSpinner = false;
  String error = '';

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    keyboardType: TextInputType.emailAddress,
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
                    child: Text("Login"),
                    color: Colors.yellow[700],
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        final email = _email.text.trim();
                        final pass = _password.text.trim();
                        print("email: $email, password: $pass");
                        setState(() {
                          showSpinner = true;
                        });
                        _emailValidation();
                      }
                    },
                  ),
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
    isValid ? _loginIn() : print("Invalid Email");
  }

  void _loginIn() async {
    dynamic result = await _authService.signInWithEmailAndPassword(
        _email.text.trim(), _password.text);
    if (result == null) {
      setState(() {
        error = 'Could not sign in!';
      });
    } else {
      setState(() {
        showSpinner = false;
      });
      Navigator.pop(context);
    }
  }

  // void _signInWithEmailPassword() async {
  //   try {
  //     final User user = (await _auth.signInWithEmailAndPassword(
  //             email: _email.text.trim(), password: _password.text))
  //         .user;
  //     if (!user.emailVerified) {
  //       await user.sendEmailVerification();
  //     }
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return HomePage(
  //         user: user,
  //       );
  //     }));
  //     setState(() {
  //       showSpinner = false;
  //     });
  //   } catch (e) {
  //     // _scaffoldKey.currentState
  //     //     .showSnackBar(SnackBar(content: Text("Failed to signIn")));
  //     print(e);
  //     _email.text = "";
  //     _password.text = "";
  //   }
  // }
}
