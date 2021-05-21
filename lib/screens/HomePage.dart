import 'package:cooking_app/Provider/all_provider.dart';
import 'package:cooking_app/Provider/app_provider.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/screens/detailsPage.dart';
import 'package:cooking_app/services/auth.dart';
import 'package:cooking_app/services/database.dart';
import 'package:cooking_app/widgets/follows_home.dart';
import 'package:cooking_app/widgets/new_recipies.dart';
import 'package:cooking_app/widgets/recommended_cards.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var providerdata = Provider.of<FoodData>(context);
    // AppProvider appProvider = Provider.of<AppProvider>(context);

    final greyColor = Colors.grey;
    final yellowColor = Colors.yellow[700];
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/backgroundhome/home.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  providerdata.featureProducts.length.toString(),
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Hello, ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text("Amanda",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // ButtonTheme(
                      //   height: 30,
                      //   child: FlatButton(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10)),
                      //     color: Color(0xFF1f1e26),
                      //     onPressed: () async {
                      //       // _signOut().whenComplete(() => Navigator.of(context)
                      //       //         .pushReplacement(
                      //       //             MaterialPageRoute(builder: (_) {
                      //       //       return LoginScreen();
                      //       //     })));
                      //       await _authService.signOut();
                      //     },
                      //     child: Text(
                      //       "Log out",
                      //       style: TextStyle(
                      //           color: Colors.yellow[700], fontSize: 12),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          print("Tapped");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsPage();
                          }));
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFF1f1e26),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.notifications_none,
                              color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: StreamProvider<List<Follows>>.value(
                        value: DatabaseService().newfollows,
                        child: FollowsHome()),
                  ),
                  _buildPadding(
                      firstRow: "Recommended Recepies", view: "View all"),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 200,
                      child: Row(
                        children: [
                          RotatedBox(
                            quarterTurns: -1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Dinner"),
                                Text("Lunch"),
                                Text("Breakfast"),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 31,
                            child: StreamProvider<List<Recipe>>.value(
                                value: DatabaseService().reciperecommend,
                                child: RecommendedRecepies()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPadding(firstRow: "New Recepies", view: "View all"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 180,
                    child: StreamProvider<List<NewRecipe>>.value(
                        value: DatabaseService().newrecipe,
                        child: NewRecepies()),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.payment),
        backgroundColor: Colors.yellow[700],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          _buildBottomAppBar(providerdata, greyColor, yellowColor),
    );
  }

  BottomAppBar _buildBottomAppBar(providerdata, greyColor, yellowColor) {
    return BottomAppBar(
      notchMargin: 8,
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.home,
                      color: providerdata.isSelected ? greyColor : yellowColor),
                  onPressed: () {
                    providerdata.updateSelected();
                  }),
              IconButton(
                icon: Icon(Icons.navigation,
                    color: providerdata.isSelected ? greyColor : yellowColor),
                onPressed: () {
                  providerdata.updateSelected();
                },
              ),
              SizedBox.shrink(),
              IconButton(
                icon: Icon(Icons.shopping_cart,
                    color: providerdata.isSelected ? greyColor : yellowColor),
                onPressed: () {
                  providerdata.updateSelected();
                },
              ),
              IconButton(
                icon: Icon(Icons.person_outline,
                    color: providerdata.isSelected ? greyColor : yellowColor),
                onPressed: () {
                  providerdata.updateSelected();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPadding({String firstRow, String view}) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(firstRow,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(view,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.yellow[700])),
        ],
      ),
    );
  }
}
