import 'package:cooking_app/Provider/app_provider.dart';
import 'package:cooking_app/models/user.dart';
import 'package:cooking_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/all_provider.dart';
import 'widgets/wrapper.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<FoodData>(
              create: (BuildContext context) => FoodData()),
          // ChangeNotifierProvider<AppProvider>(
          //     create: (BuildContext context) => AppProvider())
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: LoginScreen.id,
        // routes: {
        //   LoginScreen.id: (context) =>LoginScreen(),
        //   LoginForm.id: (context) => LoginForm(),
        //   SignInForm.id: (context) => SignInForm(),
        //   HomePage.id: (context) => HomePage(),
        // },
        home: Wrapper(),
      ),
    );
  }
}
