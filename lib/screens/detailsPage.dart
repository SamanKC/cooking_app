import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/services/database.dart';
import 'package:cooking_app/widgets/follower_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  static String id = 'details_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildImageContainer(
                            "https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                        _buildImageContainer(
                            "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                        _buildImageContainer(
                            "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFF1f1e26),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.chevron_left, color: Colors.yellow),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print("Tapped");
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFF1f1e26),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.share, color: Colors.yellow),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              print("Tapped");
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFF1f1e26),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.bookmark_border,
                                  color: Colors.yellow),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 40),
              decoration: BoxDecoration(
                  color: Color(0xFFfefefe),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 5,
                    height: 2,
                    indent: 200,
                    endIndent: 200,
                  ),
                  Text("BlueBerries Orange Pancakes",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      RatingBar(
                        initialRating: 4,
                        minRating: 1,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 4,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text("(+120)")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContainerServings(45, 'mins', 'Cooking Time'),
                      _buildContainerServings(120, 'kcal', 'Calories'),
                      _buildContainerServings(95, 'plates', 'Servings'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Servings"),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 100,
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.yellow[700],
                                  child: Text(
                                    "10",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  StreamProvider<List<Follows>>.value(
                      value: DatabaseService().newfollows,
                      child: FollowerButtonCard()),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 0.5,
                    ))),
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.yellow[700],
                        labelColor: Colors.yellow[700],
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            child: Text(
                              "Ingredients",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Directions",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Reviews",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        "\$ 30",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("Tapped");
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1f1e26),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.library_books,
                                        size: 20, color: Colors.yellow),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ButtonTheme(
                                  height: 40,
                                  minWidth: 100,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Color(0xFF1f1e26),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Buy Now",
                                          style: TextStyle(
                                              color: Colors.yellow[700],
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.chevron_right,
                                            size: 20,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Padding _buildImageContainer(String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 5.0),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                image,
              ),
            ),
            border: Border.all(color: Colors.yellow[600], width: 2)),
      ),
    );
  }

  Container _buildContainerServings(
      int number, String character, String serve) {
    return Container(
      height: 105,
      width: 70,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFF1f1e26),
              radius: 28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.yellow[700]),
                  ),
                  Text(
                    character,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.yellow[600],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              serve,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
            )
          ],
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
