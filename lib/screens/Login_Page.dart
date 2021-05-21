
import 'package:cooking_app/widgets/login_form.dart';
import 'package:cooking_app/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cooking_app/services/auth.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            topSection(context),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: bottomSection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget topSection(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(
            "assets/images/backgroundhome/home.png",
          ),
        ),
        // FlutterLogo(size: 160.0, style: FlutterLogoStyle.stacked),
        SizedBox(
          height: 32.0,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: LoginForm(),
                    ),
                  );
                  /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  })); */
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: SignInForm(),
                    ),
                  );
                  /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  })); */
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow[700]),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or via social media',
          style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 18.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                }
              },
              child: Container(
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            InkWell(
              // onTap: () async {
              //   final user = await AuthService.signInWithGoogle();
              //   if (user != null) {
              //     /* Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) {
              //       return HomeScreen();
              //     })); */
              //   } else {
              //     print("error logging in");
              //   }
              // },
              // onTap: () {
              //   authService.signInWithGoogle().then((result) {
              //     if (result != null) {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) {
              //             return HomePage();
              //           },
              //         ),
              //       );
              //     }
              //   });
              // },
              child: Container(
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/google.svg'),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
