import 'package:cooking_app/Provider/all_provider.dart';
import 'package:cooking_app/models/user.dart';
import 'package:cooking_app/screens/HomePage.dart';
import 'package:cooking_app/screens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return either Home or authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      // return HomePage();
      
      return HomePage();
    }
  }
}
